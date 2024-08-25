LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------- Logic Module - Boolean functions ---------------
-- Supports Boolean operations between two vectors
-- Input - Two n-bit vectors, X and Y
-- Output - Operation result
-- Supports Not,Or,And,Xor,Nor,Nand,Xnor
-- If ALUFN[2:0] undefined - Output zero
-------------------------------------
ENTITY Logic IS
  GENERIC (	n	: INTEGER := 8);
  PORT (X,Y	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		FN	: IN STD_LOGIC_VECTOR (2 DOWNTO 0); 
        res	: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END Logic;
--------------------------------------------------------------
ARCHITECTURE dfl OF Logic IS
BEGIN
	-- Perform Operation according FN bits of ALUFN 
	calc : for i in 0 to n-1 generate
		res(i) <= 	not (Y(i))		WHEN FN = "000" ELSE
					Y(i) OR X(i)	WHEN FN = "001" ELSE
					Y(i) AND X(i)	WHEN FN = "010" ELSE
					Y(i) XOR X(i)	WHEN FN = "011" ELSE
					Y(i) NOR X(i)	WHEN FN = "100" ELSE
					Y(i) NAND X(i)	WHEN FN = "101" ELSE
					Y(i) XNOR X(i)	WHEN FN = "111" ELSE
					'0';
	end generate;

END dfl;