
USE work.aux_package.all;
-------------------------------------
ENTITY segDecoder IS
  PORT (data		: in STD_LOGIC_VECTOR (3 DOWNTO 0);
		seg   		: out STD_LOGIC_VECTOR (6 downto 0));
END segDecoder;
--------------------------------------------------------------
ARCHITECTURE dfl OF segDecoder IS
BEGIN


	seg <= 	"1000000" 	when data = "0000"       else
			"1111001" 	when data = "0001"       else
			"0100100" 	when data = "0010"       else
			"0110000" 	when data = "0011"       else
			"0011001" 	when data = "0100"       else
			"0010010" 	when data = "0101"       else
			"0000010" 	when data = "0110"       else
			"1111000" 	when data = "0111"       else
			"0000000" 	when data = "1000"       else
			"0010000" 	when data = "1001"       else
			"0001000" 	when data = "1010"       else
			"0000011" 	when data = "1011"       else
			"1000110" 	when data = "1100"       else
			"0100001" 	when data = "1101"       else
			"0000110" 	when data = "1110"       else
			"0001110" 	when data = "1111"       else
			"1111111"	;

END dfl;











