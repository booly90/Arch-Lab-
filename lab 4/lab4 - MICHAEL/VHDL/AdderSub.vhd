LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------- Generic Adder/Subtractor module based on a single ripple carry adder ---------------
-- Supports Sum and Subtraction according sub_cont bit and supports getting negative of vector X
-- Input - Two n-bit vectors, X and Y 
-- Output - Y±X
-- sub_cont = 000 - Adder
-- sub_cont = 001 - Subtractor
-- sub_cont = 010 - Neg(X)
-- If ALUFN[2:0] undefined - Output zero
--------AdderSub Entity---------------------------
ENTITY AdderSub IS
  GENERIC (n : INTEGER := 8);
  PORT ( x,y	  :	IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		 sub_cont :	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         cout	  :	OUT STD_LOGIC;
         s		  :	OUT STD_LOGIC_VECTOR(n-1 downto 0));
END AdderSub;
---------AdderSub Architecture--------------------
ARCHITECTURE dfl OF AdderSub IS
	SIGNAL reg : std_logic_vector(n-1 DOWNTO 0);
	SIGNAL x_temp, y_temp: std_logic_vector(n-1 DOWNTO 0);
	SIGNAL cin : std_logic;
BEGIN

	-- carry in should be LSB of sub_cont 
	cin <= sub_cont(0) WHEN (sub_cont = "000" or sub_cont = "001") ELSE
		   '1' WHEN (sub_cont = "010") ELSE
		   '0';

	-- x_tmp - X xor with sub_cont. sub_cont = 0 - make sum; sub_cont = 1 - make subtraction
	x_tmp  : for i in 0 to n-1 generate
		x_temp(i) <= (x(i) xor sub_cont(0)) WHEN (sub_cont = "000" or sub_cont = "001") ELSE
					 (x(i) xor '1')			WHEN (sub_cont = "010") ELSE  -- sub_cont=00 or 01 is for Y+X,Y-X; Else Condtion for Res=Neg(X)=0-X
					 '0';
	end generate;
	
	-- y_temp - For Neg operation: Y=0 else Y stays the same
	y_temp <= 	y 				WHEN (sub_cont = "000" or sub_cont = "001") ELSE
				(OTHERS => '0');

-- First FA operation to AdderSub
	first: FA port map(xi => x_temp(0),yi => y_temp(0),cin => cin,s => s(0),cout => reg(0));
-- Make the rest of the FA operations
	rest : for i in 1 to n-1 generate
		chain : FA port map(xi => x_temp(i),yi => y_temp(i),cin => reg(i-1),s => s(i),cout => reg(i));
	end generate;
	-- Get carry of the last FA
	cout <= reg(n-1);

END dfl;

