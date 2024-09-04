LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
--------------------------------------------------------------------
ENTITY OptAddrDecoder IS
	PORT( 
		reset 			: IN	STD_LOGIC;
		AddressBusBits	: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		CS_LEDR			: OUT 	STD_LOGIC;
		CS_SW  			: OUT 	STD_LOGIC;
		CS_KEY			: OUT 	STD_LOGIC;
		CS_HEX0			: OUT 	STD_LOGIC;
		CS_HEX1			: OUT 	STD_LOGIC;
		CS_HEX2			: OUT 	STD_LOGIC;
		CS_HEX3			: OUT 	STD_LOGIC;
		CS_HEX4			: OUT 	STD_LOGIC;
		CS_HEX5			: OUT 	STD_LOGIC
		);
END OptAddrDecoder;
--------------------------------------------------------------
ARCHITECTURE structure OF OptAddrDecoder IS

BEGIN

	CS_LEDR	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1000" ELSE '0';  --adress = 1000_0000_0000  --> (A11,A4,A3,A2) = (1000) 
	CS_HEX0	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1001" ELSE '0';  --adress = 1000_0000_0100  --> (A11,A4,A3,A2) = (1001) + A0=0
	CS_HEX1	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1001" ELSE '0';  --adress = 1000_0000_0101  --> (A11,A4,A3,A2) = (1001) + A0=1 
	CS_HEX2	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1010" ELSE '0';  --adress = 1000_0000_1000  --> (A11,A4,A3,A2) = (1010) + A0=0 
	CS_HEX3	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1010" ELSE '0';  --adress = 1000_0000_1001  --> (A11,A4,A3,A2) = (1010) + A0=0 
	CS_HEX4	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1011" ELSE '0';  --adress = 1000_0000_1100  --> (A11,A4,A3,A2) = (1011) + A0=1 
	CS_HEX5	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1011" ELSE '0';  --adress = 1000_0000_1101  --> (A11,A4,A3,A2) = (1011) + A0=0
	CS_SW	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1100" ELSE '0';  --adress = 1000_0001_0000  --> (A11,A4,A3,A2) = (1100) 
	CS_KEY	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1101" ELSE '0';  --adress = 1000_0001_0100  --> (A11,A4,A3,A2) = (1101) 
	

END structure;