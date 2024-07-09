LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

ENTITY SegDecoder IS
  GENERIC (	n			: INTEGER := 4;
			SegmentSize	: integer := 7);
  PORT (data		: in STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		seg   		: out STD_LOGIC_VECTOR (SegmentSize-1 downto 0));
END SegDecoder;

ARCHITECTURE dfl OF SegDecoder IS
  TYPE seg_array IS ARRAY (15 DOWNTO 0) OF STD_LOGIC_VECTOR (SegmentSize-1 DOWNTO 0);
  CONSTANT seg_values : seg_array := (
    "1000000", -- 0
    "1111001", -- 1
    "0100100", -- 2
    "0110000", -- 3
    "0011001", -- 4
    "0010010", -- 5
    "0000010", -- 6
    "1111000", -- 7 
    "0000000", -- 8 
    "0010000", -- 9
    "0001000", -- A
    "0000011", -- B
    "1000110", -- C
    "0100001", -- D
    "0000110", -- E
    "0001110"  -- F
  );
BEGIN
  PROCESS(data)
  BEGIN
    IF data < 16 THEN
      seg <= seg_values(CONV_INTEGER(data));
    ELSE
      seg <= "1111111";
    END IF;
  END PROCESS;
END dfl;
