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
    ena, rst, clk : in STD_LOGIC;
    PWM_OUT : out STD_LOGIC
  ); -- Zflag, Cflag, Nflag, Vflag
END top;

------------- complete the top Architecture code --------------
ARCHITECTURE struct OF top IS 
 

    
BEGIN
    
--component instantiation section
--==========================================================--

    
    PWM_inst: PWM GENERIC map(n=>n, k=>k, m=>m)
        PORT MAP (
            Y_PWM_in => Y_i,
            X_PWM_in => X_i,
            ena   => ena,
            rst   => rst,
            clk   => clk,
            ALUFN => ALUFN_i, 
            PWM_OUT => PWM_OUT
        );

	ALU_inst: ALU GENERIC map (n=>n, k=>k, m=>m)
		Port map (	Y_i => Y_i,
					X_i => X_i,
					ALUFN_i => ALUFN_i,
					ALUout_o => ALUout_o,
					Nflag_o => Nflag_o,
					Cflag_o => Cflag_o,
					Zflag_o => Zflag_o,
					Vflag_o => Vflag_o
				);
				

--==========================================================--    

 

    
--==========================================================--

    
END struct;
