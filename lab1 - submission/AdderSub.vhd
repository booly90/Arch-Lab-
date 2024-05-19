LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------------------------------------------------------------

ENTITY AdderSub IS
  GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
  PORT (    x_adderSub_in,y_adderSub_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --inputs for adderSub
			ALUFN : IN STD_LOGIC_VECTOR (2 Downto 0);
            adderSub_cout: OUT STD_LOGIC;
            adderSub_out: OUT STD_LOGIC_VECTOR(n-1 Downto 0));
END AdderSub;
--------------------------------------------------------------

ARCHITECTURE AS_arch OF adderSub IS
	SIGNAL reg : std_logic_vector(n-1 DOWNTO 0);
	SIGNAL x_adderSub_xor : std_logic_vector(n-1 DOWNTO 0); --can be inverted with cin signal for sub op
	SIGNAL y_adderSub_gated : std_logic_vector(n-1 DOWNTO 0); --gated to be 'b0 for neg op
	signal sub_control : std_logic;
	
BEGIN
	
	sub_control <= '1' when (ALUFN = "001" or ALUFN = "010" else '0';
	y_adderSub_gated <= y_adderSub_in when ((ALUFN = "000") or (ALUFN = "001"))
						else (others => '0'); --for add\sub Y_gated = Y_in else Y_gated = 'b0
											  --Y_gated = 'b0 for illegal ALUFN values	
				  
	L1: for i in 0 to n-1 generate 
	x_adderSub_xor(i) <= x_adderSub_in(i) xor sub_control when --X_xor inverted for sub_control == '1'
	((ALUFN = "000") or (ALUFN = "001") or (ALUFN = "010"))	else '0' --X_xor = 'b0 for illegal ALUFN values
	x_adderSub_xor <= x_adderSub_in xor 
	
	first : FA port map(
			xi => x_adderSub_xor(0),
			yi => y_adderSub_gated(0),
			cin => sub_control,
			s => adderSub_out(0),
			cin => reg(0)
	);
	
	rest : for i in 1 to n-1 generate
		chain : FA port map(
			xi => x_adderSub_xor(i),
			yi => y_adderSub_gated(i),
			cin => reg(i-1),
			s => adderSub_out(i),
			cin => reg(i)
		);
	end generate;
	adderSub_cout <= reg(n-1);
	

END AS_arch;