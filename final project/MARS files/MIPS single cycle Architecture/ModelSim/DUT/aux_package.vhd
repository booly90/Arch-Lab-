library IEEE;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
package aux_package is
------------------------------------------------------
	component GPIO_handler IS
	GENERIC(	AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT( 
		MemRead_Signal				: IN 	STD_LOGIC;
		clock					: IN 	STD_LOGIC;
		reset					: IN 	STD_LOGIC;
		MemWrite_Signal			: IN 	STD_LOGIC;
		AddressBus				: IN	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
		DataBus					: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
		HEX0					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX3					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX4					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX5					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		LEDR					: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		SW						: IN	STD_LOGIC_VECTOR(7 DOWNTO 0)

		);
END COMPONENT;		
		------------------------------------------------------
		COMPONENT GPI IS
		GENERIC(DataBusSize	: integer := 32);
		PORT( 
		MemRead		: IN	STD_LOGIC;
		ChipSelect	: IN 	STD_LOGIC;
		Data		: OUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
		GPInput		: IN	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
		END COMPONENT;
		
		
		------------------------------------------------------
	COMPONENT GPO IS
		GENERIC (	useSevenSeg: BOOLEAN :=TRUE;
				IOWidth	: INTEGER := 7); -- 7 WHEN HEX, 8 WHEN LEDs
		PORT( 
		MemRead			: IN	STD_LOGIC;
		reset			: IN 	STD_LOGIC;
		MemWrite		: IN	STD_LOGIC;
		ChipSelect		: IN 	STD_LOGIC;
		Data			: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		GPOutput		: OUT	STD_LOGIC_VECTOR(IOWidth-1 DOWNTO 0)
		);
	END COMPONENT;
		
		
		
		------------------------------------------------------
	COMPONENT segDecoder IS
		PORT (data		: in STD_LOGIC_VECTOR (3 DOWNTO 0);
			  seg   	: out STD_LOGIC_VECTOR (6 downto 0));
	END COMPONENT;
		
		
		
		------------------------------------------------------
		COMPONENT OptAddrDecoder IS
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
END COMPONENT;
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		------------------------------------------------------
end aux_package;

