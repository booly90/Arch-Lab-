LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------- Shifter Module Based on n-bit Barrel Shifter ---------------
-- Supports SHR and SHL according dir bit (dir = '1' - SHR; dir = '0' - SHL)
-- Input - Two n-bit vectors, X and Y and one bit dir
-- Output - carry out and shifted result of Y
-- Shifted Vector - Y
-- Number of Shifts - X value 
-- If ALUFN[2:0] undefined - Output zero
---------Shifter Entity-------------------------------
ENTITY Shifter IS
  GENERIC (	n	: INTEGER := 8; -- Input vector size, default=8
			k	: INTEGER := 3); -- Number of 
  PORT ( X,Y	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); -- Input
		 dir	: IN STD_LOGIC_VECTOR (2 DOWNTO 0); -- Direction Choice
         cout	: OUT STD_LOGIC; -- Carry out
         res	: OUT STD_LOGIC_VECTOR(n-1 downto 0)); -- Result
END Shifter;
----------Shifter Architecture-------------------------
ARCHITECTURE dfl OF Shifter IS
	SUBTYPE vector IS std_logic_vector (n-1 DOWNTO 0);
	TYPE matrix IS ARRAY (k DOWNTO 0) OF vector;
	--SIGNAL mat		: matrix := (others=>(others=>'0')); -- Store each shift step vector
	SIGNAL mat		: matrix; -- Store each shift step vector
	SIGNAL carry : std_logic_vector(k-1 DOWNTO 0);
BEGIN

	-- Init shifted vector according the direction (If SHR, inverse the vector)
	init : for i in 0 to n-1 generate
		mat(0)(i) <= Y(i) 		WHEN dir = "000" ELSE
					 Y(n-1-i)	WHEN dir = "001" else
					 '0';
	end generate;

	shift: for step in 1 to k generate
		-- ADD ZEROS TO START IF SHIFT NEEDED
		mat(step)(2**(step-1) - 1 DOWNTO 0) <= mat(step-1)(2**(step-1) - 1 DOWNTO 0)	WHEN X(step-1)='0' ELSE
										   (OTHERS => '0') 					 			WHEN X(step-1)='1';
		-- SHIFT IF NEEDED otherwise DONT CHANGE
		mat(step)(n-1 DOWNTO 2**(step-1)) <= mat(step-1)(n-1 DOWNTO 2**(step-1))	WHEN X(step-1)='0' ELSE
											 mat(step-1)(n-1-2**(step-1) DOWNTO 0)	WHEN X(step-1)='1';
	end generate;
	-------- Take Care of Final Shifted Result---------------------------
	-- Take Last row of matrix. If Dir=1(SHR), inverse the result
	inv	: for i in 0 to n-1 generate
		res(i) <= mat(k)(i)	 	WHEN dir = "000" ELSE
				  mat(k)(n-1-i) WHEN dir = "001" ELSE
				  '0';
	end generate;
	
	-----------------Carry Out-------------------------
	--	At the start take the lsb of the vector if first shift performed.
	carry(0) <= mat(0)(n-1) WHEN X(0) = '1' ELSE
				'0' 		WHEN X(0) = '0';
	-- Take n-1-2**(step-1)	position value of the shifted vector if shift was performed in the corresponding step.
	carry_out : for step in 1 to k-1 generate
		carry(step) <= mat(step)(n-1-2**(step-1))	WHEN X(step) = '1' ELSE
					   carry(step-1) 				WHEN X(step) = '0';
	end generate;
	
	cout <= carry(k-1) WHEN (dir = "000" or dir = "001") ELSE
			'0';
	
END dfl;

