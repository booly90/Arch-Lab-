LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
--------------------------------------------------------------------


--#--------------------------------------------------------------
--#		    MEMORY Mapped I/O
--#--------------------------------------------------------------
--#define PORT_LEDR[7-0] 0x800 - LSB byte (Output Mode)
--#------------------- PORT_HEX0_HEX1 ---------------------------
--#define PORT_HEX0[7-0] 0x804 - LSB byte (Output Mode)
--#define PORT_HEX1[7-0] 0x805 - LSB byte (Output Mode)
--#------------------- PORT_HEX2_HEX3 ---------------------------
--#define PORT_HEX2[7-0] 0x808 - LSB byte (Output Mode)
--#define PORT_HEX3[7-0] 0x809 - LSB byte (Output Mode)
--#------------------- PORT_HEX4_HEX5 ---------------------------
--#define PORT_HEX4[7-0] 0x80C - LSB byte (Output Mode)
--#define PORT_HEX5[7-0] 0x80D - LSB byte (Output Mode)
--#--------------------------------------------------------------
--#define PORT_SW[7-0]   0x810 - LSB byte (Input Mode)
--#--------------------------------------------------------------
ENTITY OptAddrDecoder IS
	PORT( 
		reset 			: IN	STD_LOGIC;
		Address0			: IN	STD_LOGIC;  --bit 0 of address bus
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

	signal CS_HEX0_temp 	:STD_LOGIC;
	signal CS_HEX1_temp 	:STD_LOGIC;
	signal CS_HEX2_temp 	:STD_LOGIC;
	signal CS_HEX3_temp 	:STD_LOGIC;
	signal CS_HEX4_temp 	:STD_LOGIC;
	signal CS_HEX5_temp 	:STD_LOGIC;
	

BEGIN

	CS_LEDR			<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1000" ELSE '0';  --adress = 1000_0000_0000  --> (A11,A4,A3,A2) = (1000) 
	CS_HEX0_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1001" ELSE '0';  --adress = 1000_0000_0100  --> (A11,A4,A3,A2) = (1001) + A0=0
	CS_HEX1_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1001" ELSE '0';  --adress = 1000_0000_0101  --> (A11,A4,A3,A2) = (1001) + A0=1 
	CS_HEX2_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1010" ELSE '0';  --adress = 1000_0000_1000  --> (A11,A4,A3,A2) = (1010) + A0=0 
	CS_HEX3_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1010" ELSE '0';  --adress = 1000_0000_1001  --> (A11,A4,A3,A2) = (1010) + A0=0 
	CS_HEX4_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1011" ELSE '0';  --adress = 1000_0000_1100  --> (A11,A4,A3,A2) = (1011) + A0=1 
	CS_HEX5_temp	<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1011" ELSE '0';  --adress = 1000_0000_1101  --> (A11,A4,A3,A2) = (1011) + A0=0
	CS_SW			<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1100" ELSE '0';  --adress = 1000_0001_0000  --> (A11,A4,A3,A2) = (1100) 
	CS_KEY			<=	'0' WHEN reset = '1' ELSE '1' WHEN AddressBusBits = "1101" ELSE '0';  --adress = 1000_0001_0100  --> (A11,A4,A3,A2) = (1101) 
	
	CS_HEX0 	<=	CS_HEX0_temp  AND  (not Address0);
	CS_HEX1 	<=	CS_HEX1_temp  AND  Address0;
	CS_HEX2 	<=	CS_HEX2_temp  AND  (not Address0);
	CS_HEX3 	<=	CS_HEX3_temp  AND  Address0;
	CS_HEX4 	<=	CS_HEX4_temp  AND  (not Address0);
	CS_HEX5 	<=	CS_HEX5_temp  AND  Address0;
END structure;