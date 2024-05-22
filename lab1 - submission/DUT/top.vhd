LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE wORk.aux_package.all;
-------------------------------------
ENTITY top IS
  GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
  PORT 
  (  
	Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
	Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC
  ); -- Zflag,Cflag,Nflag,Vflag
END top;
------------- complete the top Architecture code --------------
ARCHITECTURE struct OF top IS 
	subtype vectOR IS STD_LOGIC_VECTOR(n-1 DOWNTO 0);

	--modules input wires
	SIGNAL x_adderSub_in: vectOR;
	SIGNAL x_Logic_in: vectOR;
	SIGNAL x_Shifter_in: vectOR;
	SIGNAL y_adderSub_in: vectOR;
	SIGNAL y_Logic_in: vectOR;
	SIGNAL y_Shifter_in: vectOR;
	
	--modules output wires
	SIGNAL adderSub_out: vectOR;
	SIGNAL Shifter_out: vectOR;
	SIGNAL Logic_out: vectOR;
	SIGNAL adderSub_cout: STD_LOGIC;
	SIGNAL Shifter_cout:  STD_LOGIC;
	SIGNAL Logic_cout:    STD_LOGIC;
	
	
	
	--signals to create the overflow (V flag) output
	SIGNAL Vflag_add: STD_LOGIC;
	SIGNAL Vflag_sub: STD_LOGIC;
	
	
BEGIN
	
 --gate inputs to AdderSub module when active
	y_adderSub_in <= Y_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0');
	x_adderSub_in <= X_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0');
	
 --gate inputs to Logic module when active
	y_Logic_in    <= Y_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0');
	x_Logic_in    <= X_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0');
	
 --gate inputs to Shifter module when active
	y_Shifter_in  <= Y_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0');
	x_Shifter_in  <= X_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0');
	
	
--determine if V flag should be raised
	Vflag_add <= '1' WHEN -- pos+pos=neg OR neg+neg=pos otherwise set to 0
					((not y_adderSub_in(n-1)  AND not x_adderSub_in(n-1) AND     adderSub_out(n-1))  = '1' 
				OR  ((     y_adderSub_in(n-1) AND     x_adderSub_in(n-1) AND not adderSub_out(n-1))) = '1')
				else '0';
				
	Vflag_sub <= '1' WHEN  -- pos-neg=neg OR neg-pos=pos otherwise set to 0
					((not y_adderSub_in(n-1) AND     x_adderSub_in(n-1) AND     adderSub_out(n-1))  = '1' 
				OR  ((    y_adderSub_in(n-1) AND not x_adderSub_in(n-1) AND not adderSub_out(n-1))) = '1')
				else '0';
				
	
	
--output logic section
--==========================================================--
	ALUout_o <= adderSub_out when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_out  when ALUFN_i(4 DOWNTO 3) = "10" else
				Logic_out    when ALUFN_i(4 DOWNTO 3) = "11" 
				else (others => '0');

	Vflag_o <= 	Vflag_add when ALUFN_i = "01000" else 
				Vflag_sub when ALUFN_i = "01001" 
				else '0';
	
	Nflag_o <= 	adderSub_out(n-1) when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_out (n-1) when ALUFN_i(4 DOWNTO 3) = "10" else
				Logic_out   (n-1) when ALUFN_i(4 DOWNTO 3) = "11" 
				else '0';
				
	Zflag_o <= '1' when ((ALUFN_i(4 DOWNTO 3) = "01" and adderSub_out = (n-1 DOWNTO 0 => '0')) OR 
						 (ALUFN_i(4 DOWNTO 3) = "10" and Shifter_out  = (n-1 DOWNTO 0 => '0')) OR 
	                     (ALUFN_i(4 DOWNTO 3) = "11" and Logic_out    = (n-1 DOWNTO 0 => '0')))
				else '0';
	
	Cflag_o <=  adderSub_cout when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_cout  when ALUFN_i(4 DOWNTO 3) = "10" 
				else '0'; --logic ops do not affect carry flag
	
	
	
--==========================================================--

		
--component instantiation section
--==========================================================--
	AdderSub_inst: AdderSub GENERIC map(n => n)
		PORT map(
				x_adderSub_in => x_adderSub_in,
				y_adderSub_in => y_adderSub_in,
				ALUFN 		  => ALUFN_i(2 DOWNTO 0),
				adderSub_cout => adderSub_cout,
				adderSub_out  => adderSub_out
	);
				
	Logic_inst: Logic GENERIC map(n => n)
		PORT map(
				x_logic    => x_Logic_in,
				y_logic    => y_Logic_in,
				ALUFN      => ALUFN_i(2 DOWNTO 0),
				Logic_out  => Logic_out
	);
	
	Shifter_inst: Shifter GENERIC map(n => n , k => k)
		PORT map(
				x_Shifter_in => x_adderSub_in,
				y_Shifter_in => y_adderSub_in,
				ALUFN 	     => ALUFN_i(2 DOWNTO 0),
				Shifter_cout => Shifter_cout,
				Shifter_out  => Shifter_out
	);
--==========================================================--	
	
	
			 
END struct;

