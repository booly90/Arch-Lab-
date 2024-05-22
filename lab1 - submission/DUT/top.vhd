LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
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
	subtype vector IS STD_LOGIC_VECTOR(n-1 DOWNTO 0);

	--modules input wires
	SIGNAL x_adderSub_in: vector;
	SIGNAL x_Logic_in: vector;
	SIGNAL x_Shifter_in: vector;
	SIGNAL y_adderSub_in: vector;
	SIGNAL y_Logic_in: vector;
	SIGNAL y_Shifter_in: vector;
	
	--modules output wires
	SIGNAL adderSub_out: vector;
	SIGNAL Shifter_out: vector;
	SIGNAL Logic_out: vector;
	SIGNAL adderSub_cout: vector;
	SIGNAL Shifter_cout: vector;
	SIGNAL Logic_cout: vector;
	
	
	
	--signals to create the overflow (V flag) output
	SIGNAL Vflag_add: STD_LOGIC;
	SIGNAL Vflag_sub: STD_LOGIC;
	
	
BEGIN
	
 --gate inputs to AdderSub module when active
	y_adderSub_in <= Y_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0')
	x_adderSub_in <= X_i when ALUFN_i(4 DOWNTO 3) = "01" else (others => '0')
	
 --gate inputs to Logic module when active
	y_Logic_in <= Y_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0')
	x_Logic_in <= X_i when ALUFN_i(4 DOWNTO 3) = "11" else (others => '0')
	
 --gate inputs to Shifter module when active
	y_Shifter_in <= Y_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0')
	x_Shifter_in <= X_i when ALUFN_i(4 DOWNTO 3) = "10" else (others => '0')
	
	
--determine if V flag should be raised
	Vflag_add <= '1' WHEN -- pos+pos=neg or neg+neg=pos
	( ALUFN_i = "01000" and ((not y_adderSub_in(n-1) and not x_adderSub_in(n-1) and     adderSub_out(n-1)) 
					   or ((    y_adderSub_in(n-1) and     x_adderSub_in(n-1) and not adderSub_out(n-1)))))
	or -- pos-neg=neg or neg-pos=pos
	( ALUFN_i = "01001" and ((not y_adderSub_in(n-1) and     x_adderSub_in(n-1) and     adderSub_out(n-1)) 
					   or ((    y_adderSub_in(n-1) and not x_adderSub_in(n-1) and not adderSub_out(n-1)))))
	else '0'; --when not overflow or when not arithmetic op
	
	
--output logic section
--==========================================================--
	Vflag_o <= Vflag_add or Vflag_sub; --note that for illegal ALUFN is set to 0
	
	Nflag_o <= 	adderSub_out(n-1) when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_out(n-1)  when ALUFN_i(4 DOWNTO 3) = "10" else
				Logic_out(n-1)    when ALUFN_i(4 DOWNTO 3) = "11" 
				else '0';
				
	Zflag_o <= '1' when (ALUFN_i(4 DOWNTO 3) = "01" or 
						 ALUFN_i(4 DOWNTO 3) = "10" or 
	                     ALUFN_i(4 DOWNTO 3) = "11") and
						 ALUout_o = ((n-1 DOWNTO 0 => '0')
				else '0';
	
	Cflag_o <=  adderSub_cout when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_cout  when ALUFN_i(4 DOWNTO 3) = "10" else
				else '0'; --logic ops do not affect carry flag
	
	ALUout_o <= adderSub_out when ALUFN_i(4 DOWNTO 3) = "01" else
				Shifter_out  when ALUFN_i(4 DOWNTO 3) = "10" else
				Logic_out    when ALUFN_i(4 DOWNTO 3) = "11" 
				else '0';
	
--==========================================================--

		
--component instantiation section
--==========================================================--
	AdderSub_inst: AdderSub GENERIC map(n => n);
		PORT map(
				x_adderSub_in => x_adderSub_in,
				x_adderSub_in => y_adderSub_in,
				ALUFN 		  => ALUFN_i(2 DOWNTO 0),
				adderSub_cout => adderSub_cout,
				adderSub_out  => adderSub_out
	);
				
	Logic_inst: Logic GENERIC map(n => n);
		PORT map(
				x_logic    => x_Logic_in,
				y_logic    => y_Logic_in,
				ALUFN      => ALUFN_i(2 DOWNTO 0),
				Logic_out  => Logic_out
	);
	
	AdderSub_inst: AdderSub GENERIC map(n => n , k => k);
		PORT map(
				x_Shifter_in => x_adderSub_in,
				x_Shifter_in => y_adderSub_in,
				ALUFN 	     => ALUFN_i(2 DOWNTO 0),
				Shifter_cout => Shifter_cout,
				Shifter_out  => Shifter_out
	);
--==========================================================--	
	
	
			 
END struct;

