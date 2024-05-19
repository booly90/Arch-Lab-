LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------------------------------------------------------------

ENTITY Logic IS 
	GENERIC (n: INTEGER :=8;   --bit size of input and outputs signals, default is 8
			 OP : INTEGER :=8);--number of logical operations plus 1 (for  zeros), default is 8
	PORT (x_logic,y_logic : IN std_logic_vector (n-1 Downto 0);
		  ALUFN : IN std_logic_vector (2 Downto 0);
		  Logic_out : OUT std_logic_vector (n-1 Downto 0));
END Logic
--------------------------------------------------------------

ARCHITECTURE Logic_arch of Logic IS 
	type result_matrix IS array (OP-1 Downto 0) of std_logic_vector (n-1 Downto 0);
	signal output_matrix : result_matrix; --matrix of all possible outputs for Logic module
	
	BEGIN
		output_matrix(0) <= NOT(y_logic); -- ALUFN(2:0) = 000
		output_matrix(1) <=(x_logic) OR (y_logic);   -- ALUFN(2:0) = 001
		output_matrix(3) <=(x_logic) XOR (y_logic);  -- ALUFN(2:0) = 011
		output_matrix(2) <=(x_logic) AND (y_logic);  -- ALUFN(2:0) = 010
		output_matrix(4) <=(x_logic) NOR (y_logic);  -- ALUFN(2:0) = 100
		output_matrix(5) <=(x_logic) NAND (y_logic); -- ALUFN(2:0) = 101
		output_matrix(6) <=(x_logic) XNOR (y_logic); -- ALUFN(2:0) = 111
		output_matrix(7) <= (others => '0');
		
		Logic_out <= output_matrix(0) when ALUFN = "000" else
					 output_matrix(1) when ALUFN = "001" else	
					 output_matrix(2) when ALUFN = "010" else	
					 output_matrix(3) when ALUFN = "011" else	
					 output_matrix(4) when ALUFN = "100" else	
					 output_matrix(5) when ALUFN = "101" else	
					 output_matrix(6) when ALUFN = "111" else	
					 output_matrix(7) when OTHERS	

END Logic_arch
																				 