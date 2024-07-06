LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

-------------------------------------
ENTITY top IS
  GENERIC (n : INTEGER := 8;
           k : integer := 3;   -- k=log2(n)
           m : integer := 4 ); -- m=2^(k-1)
  PORT 
  (  
    Y_i, X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
    ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0); --5 bit vector
    ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
    Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT STD_LOGIC;
    ENA, RST, CLK : in STD_LOGIC;
    PWM_OUT : out STD_LOGIC
  ); -- Zflag, Cflag, Nflag, Vflag
END top;

------------- complete the top Architecture code --------------
ARCHITECTURE struct OF top IS 
    constant NUM_OF_MODULES : INTEGER := 3; --ALU HAS 3 modules
    subtype vector IS STD_LOGIC_vector(n-1 DOWNTO 0);
    type matrix IS ARRAY ((NUM_OF_MODULES - 1) DOWNTO 0) of vector;
    
    --modules input wires
    SIGNAL x_adderSub_in, x_Logic_in, x_Shifter_in, X_PWM_in: vector;
    SIGNAL y_adderSub_in, y_Logic_in, y_Shifter_in, Y_PWM_in: vector;
    
    --modules outputs
    SIGNAL result_matrix : matrix;
    SIGNAL cout_vector : STD_LOGIC_vector((NUM_OF_MODULES - 1) DOWNTO 0);
    SIGNAL ALUOUT: vector;
    
    --signals to create the overflow (V flag) output
    SIGNAL Vflag_add: STD_LOGIC;
    SIGNAL Vflag_sub: STD_LOGIC;
    
BEGIN
    
--component instantiation section
--==========================================================--
    AdderSub_inst: AdderSub GENERIC map(n => n)
        PORT map(
            x_adderSub_in => x_adderSub_in,
            y_adderSub_in => y_adderSub_in,
            ALUFN         => ALUFN_i(2 DOWNTO 0),
            adderSub_cout => cout_vector(0),
            adderSub_out  => result_matrix(0)
        );
                
    Shifter_inst: Shifter GENERIC map(n => n, k => k)
        PORT map(
            x_Shifter_in  => x_Shifter_in(k-1 DOWNTO 0),
            y_Shifter_in  => y_Shifter_in,
            ALUFN         => ALUFN_i(2 DOWNTO 0),
            Shifter_cout  => cout_vector(1),
            Shifter_out   => result_matrix(1)
        );

    Logic_inst: Logic GENERIC map(n => n)
        PORT map(
            x_logic   => x_Logic_in,
            y_logic   => y_Logic_in,
            ALUFN     => ALUFN_i(2 DOWNTO 0),
            Logic_out => result_matrix(2)
        );
    
    PWM_inst: PWM GENERIC map(n => n, k => k)
        PORT MAP (
            Y_PWM => Y_PWM_in,
            X_PWM => X_PWM_in,
            ENA   => ENA,
            RST   => RST,
            CLK   => CLK,
            ALUFN => ALUFN_i(2 DOWNTO 0), 
            PWM_OUT => PWM_OUT
        );

--==========================================================--    
--gate inputs to PWM module when active
    Y_PWM_in    <= Y_i when ALUFN_i(4 DOWNTO 3) = "00" else (others => '0');
    X_PWM_in    <= X_i when ALUFN_i(4 DOWNTO 3) = "00" else (others => '0');
    
 --gate inputs to AdderSub module when active
    y_adderSub_in <= Y_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0');
    x_adderSub_in <= X_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0');
    
  --gate inputs to Shifter module when active
    y_Shifter_in  <= Y_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0');
    x_Shifter_in  <= X_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0');
    
--gate inputs to Logic module when active
    y_Logic_in    <= Y_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0');
    x_Logic_in    <= X_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0');
        
    
--determine if V flag should be raised
    Vflag_add <= '1' WHEN -- pos+pos=neg OR neg+neg=pos otherwise set to 0
                    ((not y_adderSub_in(n-1) AND not x_adderSub_in(n-1) AND     result_matrix(0)(n-1))  = '1' 
                OR  ((    y_adderSub_in(n-1) AND     x_adderSub_in(n-1) AND not result_matrix(0)(n-1))) = '1')
                else '0';
                
    Vflag_sub <= '1' WHEN  -- pos-neg=neg OR neg-pos=pos otherwise set to 0
                    ((not y_adderSub_in(n-1) AND     x_adderSub_in(n-1) AND     result_matrix(0)(n-1))  = '1' 
                OR  ((    y_adderSub_in(n-1) AND not x_adderSub_in(n-1) AND not result_matrix(0)(n-1))) = '1')
                else '0';
                
    
    
--output logic section
--==========================================================--
    ALUOUT <= result_matrix(0) when ALUFN_i(4 DOWNTO 3) = "01" else --for adderSub
                result_matrix(1) when ALUFN_i(4 DOWNTO 3) = "10" else --for Shifter
                result_matrix(2) when ALUFN_i(4 DOWNTO 3) = "11"       --for Logic
                else (others => '0');

    Vflag_o <=  Vflag_add when ALUFN_i = "01000" else 
                Vflag_sub when ALUFN_i = "01001" 
                else '0';
    
    Nflag_o <=  ALUOUT(n-1);
                
    Zflag_o <= '1' when ((ALUFN_i(4 DOWNTO 3) = "01" and result_matrix(0) = (n-1 DOWNTO 0 => '0'))  OR 
                         (ALUFN_i(4 DOWNTO 3) = "10" and result_matrix(1) = (n-1 DOWNTO 0 => '0'))  OR 
                         (ALUFN_i(4 DOWNTO 3) = "11" and result_matrix(2) = (n-1 DOWNTO 0 => '0'))  OR
                          ALUFN_i(4 DOWNTO 3) = "00")
                else '0';
    
    Cflag_o <=  cout_vector(0) when ALUFN_i(4 DOWNTO 3) = "01" else --for adderSub
                cout_vector(1) when ALUFN_i(4 DOWNTO 3) = "10"      --for Shifter
                else '0'; --logic ops do not affect carry flag so set to '0'
    
    ALUout_o <= ALUOUT;
    
--==========================================================--

    
END struct;
