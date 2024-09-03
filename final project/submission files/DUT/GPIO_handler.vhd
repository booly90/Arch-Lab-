library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

--------------------------------------------------------------

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


		SIGNAL CS_LEDR, CS_LEDR_gated				:	STD_LOGIC;
		SIGNAL CS_SW, CS_SW_gated					:	STD_LOGIC;
		SIGNAL CS_KEY								:	STD_LOGIC;
		SIGNAL CS_HEX0								:	STD_LOGIC;
		SIGNAL CS_HEX1								:	STD_LOGIC;
		SIGNAL CS_HEX2								:	STD_LOGIC;
		SIGNAL CS_HEX3								:	STD_LOGIC;
		SIGNAL CS_HEX4								:	STD_LOGIC;
		SIGNAL CS_HEX5								:	STD_LOGIC;
		SIGNAL AddressBusBits						: 	STD_LOGIC_VECTOR(3 DOWNTO 0);								
		

BEGIN
		AddressBusBits <= AddressBus(11) & AddressBus(4 DOWNTO 2);
		
		
		
		ADecoder : OptAddrDecoder
			port map (	reset 			=> reset,
						AddressBusBits	=> AddressBusBits,
						Address0		=> AddressBus(0),
						CS_LEDR			=> CS_LEDR,
						CS_SW  			=> CS_SW  ,
						CS_KEY  		=> CS_KEY  ,
						CS_HEX0			=> CS_HEX0,
						CS_HEX1			=> CS_HEX1,
						CS_HEX2			=> CS_HEX2,
						CS_HEX3			=> CS_HEX3,
						CS_HEX4			=> CS_HEX4,
						CS_HEX5			=> CS_HEX5
						);
	
-------------------HEX0--------------------------------------------
		
		HEX0_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
										MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX0,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX0);
		
-------------------HEX1--------------------------------------------
		
		HEX1_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX1,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX1);

-------------------HEX2--------------------------------------------
		
		HEX2_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX2,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX2);
		
-------------------HEX3--------------------------------------------
		
		HEX3_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX3,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX3);

-------------------HEX4--------------------------------------------
		
		HEX4_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead		=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX4,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX4);
		
-------------------HEX5--------------------------------------------
		
		HEX5_inst: GPO 	generic map (useSevenSeg => TRUE,
									 IOWidth 	=> 7)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_HEX5,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> HEX5);

-------------------LEDR--------------------------------------------
		
		LEDR_inst: GPO 	generic map (useSevenSeg => FALSE,
									 IOWidth 	=> 8)
						port map   (MemRead 	=> MemRead_Signal,
									reset		=> reset,
									MemWrite	=> MemWrite_Signal,
									ChipSelect	=> CS_LEDR,
									Data		=> DataBus(7 downto 0),
									GPOutput	=> LEDR);
									
-------------------SW--------------------------------------------
		
		SW_inst:  GPI   generic map(DataBusSize => DataBusSize)
						port map   (MemRead  	=> MemRead_Signal,
									ChipSelect 	=> CS_SW,
									Data		=> DataBus,
									GPInput		=> SW);
END dfl;

