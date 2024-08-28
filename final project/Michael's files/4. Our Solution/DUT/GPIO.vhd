--------------- Input Peripheral Module 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
-------------- ENTITY --------------------
ENTITY GPIO IS
	GENERIC(CtrlBusSize	: integer := 8;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT( 
		INTA					: IN	STD_LOGIC;
		MemRead_Signal			: IN 	STD_LOGIC;
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
		Switches				: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
		CS_LEDR					: IN 	STD_LOGIC
		CS_SW					: IN 	STD_LOGIC;
		CS_HEX0					: IN 	STD_LOGIC
		CS_HEX1					: IN 	STD_LOGIC
		CS_HEX2					: IN 	STD_LOGIC;
		CS_HEX3					: IN 	STD_LOGIC
		CS_HEX4					: IN 	STD_LOGIC
		CS_HEX5					: IN 	STD_LOGIC
		);
END GPIO;
------------ ARCHITECTURE ----------------
ARCHITECTURE structure OF GPIO IS
	---- CONTROL SIGNALS ----
	SIGNAL ChipSelect	: STD_LOGIC_VECTOR(6 DOWNTO 0);
	-- SIGNAL MemRead		: STD_LOGIC;
	-- SIGNAL MemWrite		: STD_LOGIC;
	SIGNAL OADAddr		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	---- GPIO SIGNALS ----
	-- SIGNAL LEDR			: STD_LOGIC_VECTOR(7 DOWNTO 0);
	-- SIGNAL HEX0_CS, HEX1_CS, HEX2_CS : STD_LOGIC;
	-- SIGNAL HEX3_CS, HEX4_CS, HEX5_CS : STD_LOGIC;
	
BEGIN	
	
	--OADAddr <= AddressBus(11) & AddressBus(4 DOWNTO 2);
	
	--OAD : 	OptAddrDecoder
	--PORT MAP(	Address		=> OADAddr,
	--			ChipSelect 	=> ChipSelect);
		
	LED:	OutputPeripheral
	GENERIC MAP(SevenSeg => FALSE,
				IOSize	 => 8)
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_LEDR,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> LEDR
			);
	
	-- HEX0_CS	<=	ChipSelect(1) AND (NOT AddressBus(0));
	-- HEX1_CS	<=	ChipSelect(1) AND AddressBus(0);
	-- HEX2_CS	<=	ChipSelect(2) AND (NOT AddressBus(0));
	-- HEX3_CS	<=	ChipSelect(2) AND AddressBus(0);
	-- HEX4_CS	<=	ChipSelect(3) AND (NOT AddressBus(0));
	-- HEX5_CS	<=	ChipSelect(3) AND AddressBus(0);
	
	HEX0_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,	
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX0,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX0
			);
			
	HEX1_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX1,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX1
			);
	
	HEX2_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX2,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX2
			);
	
	HEX3_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX3,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX3
			);
			
	HEX4_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX4,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX4
			);
			
	HEX5_7SEG:	OutputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				clock 		=> clock,
				reset		=> reset,
				MemWrite	=> MemWrite_Signal,
				ChipSelect	=> CS_HEX5,
				Data		=> DataBus(7 DOWNTO 0),
				GPOutput	=> HEX5
			);
	
	SW:			InputPeripheral
	PORT MAP(	MemRead		=> MemRead_Signal,
				ChipSelect	=> CS_SW,
				Data		=> DataBus,
				GPInput		=> Switches
			);
		
	
END structure;