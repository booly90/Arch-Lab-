LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------------------------------------------------------------

ENTITY Shifter IS 
	GENERIC (
			n: INTEGER :=8 ; --IO bit size, default 8
			k: INTEGER :=3 ; --k=log2(n), default 3
			 );
	PORT (  y_Shifter_in: IN std_logic_vector (n-1 downto 0);
			x_Shifter_in: IN std_logic_vector (n-1 downto 0);
			ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			Shifter_cout: OUT std_logic;
			Shifter_out: OUT std_logic_vector (n-1 downto 0)
		 );
		 
END Shifter
			
--------------------------------------------------------------

ARCHITECTURE dataflow of Shifter IS			
	SUBTYPE vector IS std_logic_vector (n-1 downto 0);
	TYPE matrix IS ARRAY (k downto 0) OF vector;
	SIGNAL Shifter_cout_vector_left: vector;
	SIGNAL Shifter_cout_vector_right :vector;
	SIGNAL row_left: matrix;
	SIGNAL row_rigth: matrix;
BEGIN
	row_left(0)  <= y_Shifter_in ;
	row_right(0) <= y_Shifter_in ;
	SHL: for i IN 1 to n-1 generate
		row_left(i) <= row_left(i-1)(n-2 downto 0) & '0'; --shift previous row_left 1 bit to the left and insert '0'
		Shifter_cout_vector_left(i-1) <= row_left(i-1)(n-1); --cout recieves the last bit that has been pushed out
	END generate
	nn  
	SLR: for i IN 1 to n-1 generate
		row_right(i) <= '0' & row_right(i-1)(n-1 downto 1); --shift previous row_right 1 bit to the right and insert '0'
		Shifter_cout_vector_right(i-1) <= row_left(i-1)(0); --cout recieves the last bit that has been pushed out
	END generate
	
	
	Shifter_out <=  row_left(x_Shifter_in(k-1 DOWNTO 0))  when ALUFN = "000" else  --choose output based on ALUFN signals
				   row_right(x_Shifter_in(k-1 DOWNTO 0)) when ALUFN = "001" else (others => '0');
				   
	Shifter_cout <= Shifter_cout_vector_left(x_Shifter_in(k-1 DOWNTO 0)) when ALUFN = "000" else -- choose cout based on ALUFN signals
				   Shifter_cout_vector_right(x_Shifter_in(k-1 DOWNTO 0)) when ALUFN = "001" else '0';
	
END Shifter