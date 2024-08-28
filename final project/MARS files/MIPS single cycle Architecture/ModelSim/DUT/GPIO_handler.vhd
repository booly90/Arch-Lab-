LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;

ENTITY GPIO_handler IS
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
  
END GPIO_handler;
--------------------------------------------------------------
ARCHITECTURE dfl OF GPIO_handler IS


		SIGNAL CS_LEDR				:	STD_LOGIC;
		SIGNAL CS_SW				:	STD_LOGIC;
		SIGNAL CS_KEY				:	STD_LOGIC;
		SIGNAL CS_HEX0				:	STD_LOGIC;
		SIGNAL CS_HEX1				:	STD_LOGIC;
		SIGNAL CS_HEX2				:	STD_LOGIC;
		SIGNAL CS_HEX3				:	STD_LOGIC;
		SIGNAL CS_HEX4				:	STD_LOGIC;
		SIGNAL CS_HEX5				:	STD_LOGIC;
										
		SIGNAL MemRead_gated		:	STD_LOGIC;
BEGIN
		
		
		MemRead_gated <= MemRead_Signal AND AddressBus(0);   -- to differentiate between similarliy decoded adresses (like hex0 and hex1)
		
		ADecoder : OptAddrDecoder
			port map (	reset 		=> reset,
						AddressBus	=> AddressBus,
						CS_LEDR		=> CS_LEDR,
						CS_SW  		=> CS_SW  ,
						CS_KEY  	=> CS_KEY  ,
						CS_HEX0		=> CS_HEX0,
						CS_HEX1		=> CS_HEX1,
						CS_HEX2		=> CS_HEX2,
						CS_HEX3		=> CS_HEX3,
						CS_HEX4		=> CS_HEX4,
						CS_HEX5		=> CS_HEX5);
	
		-------------------HEX0----------------------
		
		HEX0_inst: GPO 	generic map (useSevenSeg => TRUE,
									IOWidth 	=> 7)
						port map   (MemRead 	=> MemWrite_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX0,
									DataBus		=> DataBus(7 DOWNTO 0),
									GPOutput	=> DataBus(6 DOWNTO 0));

END dfl;

