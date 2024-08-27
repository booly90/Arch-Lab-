--------------- MCU System Architecture Module 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;
-------------- ENTITY --------------------
ENTITY MCU IS
	GENERIC(MemWidth	: INTEGER := 10;
			SIM 		: BOOLEAN := FALSE;
			CtrlBusSize	: integer := 8;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32;
			IrqSize		: integer := 6;
			RegSize		: integer := 8
			);
	PORT( 
			reset, clock, ena	: IN	STD_LOGIC;
			HEX0, HEX1, HEX2	: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3, HEX4, HEX5	: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR				: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Switches			: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			BTOUT				: OUT   STD_LOGIC;
			KEY1, KEY2, KEY3	: IN	STD_LOGIC;
			UART_RX				: IN 	STD_LOGIC := '1';
			UART_TX				: OUT	STD_LOGIC := '1'
		);
END MCU;
------------ ARCHITECTURE ----------------
ARCHITECTURE structure OF MCU IS
	SIGNAL resetSim		: STD_LOGIC;
	SIGNAL enaSim		: STD_LOGIC;

	-- TEMP SIGNALS - DELETE LATER --
	SIGNAL PC			:	STD_LOGIC_VECTOR(9 DOWNTO 0);
	SIGNAL CLKCNT		: 	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL STCNT		: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL FHCNT		: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL BPADD		: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL ST_trigger	: 	STD_LOGIC;
	
	-- CHIP SELECT SIGNALS --
	SIGNAL CS_LEDR, CS_SW, CS_KEY		: STD_LOGIC;
	SIGNAL CS_HEX0, CS_HEX1, CS_HEX2	: STD_LOGIC;
	SIGNAL CS_HEX3, CS_HEX4, CS_HEX5	: STD_LOGIC;
	
	
	-- GPIO SIGNALS -- 
	SIGNAL MemReadBus	: 	STD_LOGIC;
	SIGNAL MemWriteBus	:	STD_LOGIC;
	SIGNAL ControlBus	: 	STD_LOGIC_VECTOR(CtrlBusSize-1 DOWNTO 0);
	SIGNAL AddressBus	: 	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
	SIGNAL DataBus		: 	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
	
	-- BASIC TIMER --
	SIGNAL BTCTL		:	STD_LOGIC_VECTOR(CtrlBusSize-1 DOWNTO 0);
	SIGNAL BTCNT		:	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
	SIGNAL BTCCR0		:	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
	SIGNAL BTCCR1		:	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
	SIGNAL BTIFG		:	STD_LOGIC;

	
	-- INTERRUPT MODULE --
	SIGNAL IntrEn		:	STD_LOGIC_VECTOR(RegSize-1 DOWNTO 0);
	SIGNAL IFG			:	STD_LOGIC_VECTOR(RegSize-1 DOWNTO 0);
	SIGNAL TypeReg		:	STD_LOGIC_VECTOR(RegSize-1 DOWNTO 0);
	SIGNAL IntrSrc		:	STD_LOGIC_VECTOR(IrqSize-1 DOWNTO 0);
	SIGNAL IRQ_OUT		:	STD_LOGIC_VECTOR(IrqSize-1 DOWNTO 0);
	SIGNAL IntrTx		:	STD_LOGIC;
	SIGNAL IntrRx		:	STD_LOGIC;
	SIGNAL INTR			:	STD_LOGIC;
	SIGNAL INTA			:	STD_LOGIC;  
	SIGNAL GIE			:	STD_LOGIC;
	SIGNAL INTR_Active	:	STD_LOGIC;
	SIGNAL CLR_IRQ		:	STD_LOGIC_VECTOR(5 DOWNTO 0);
	-- Uart
	SIGNAL IFG_STATUS_ERROR : STD_LOGIC;
	
	
BEGIN	

	-------------------------- FPGA or ModelSim -----------------------
	resetSim 	<= reset WHEN SIM ELSE not reset;


	
	CPU: MIPS
		GENERIC MAP(
					MemWidth	=> MemWidth,
					SIM 		=> SIM)
		PORT MAP(
					reset		=> resetSim,
					clock		=> clock,
					ena			=> ena,
					PC			=> PC,
					CLKCNT		=> CLKCNT,
					STCNT		=> STCNT,
					FHCNT		=> FHCNT,
					BPADD		=> BPADD,
					ST_trigger	=> ST_trigger,
					ControlBus	=> ControlBus,
					MemReadBus	=> MemReadBus,
					MemWriteBus	=> MemWriteBus,
					AddressBus	=> AddressBus,
					GIE			=> GIE,
					INTR		=> INTR,
					INTA		=> INTA,
					INTR_Active	=> INTR_Active,
					CLR_IRQ		=> CLR_IRQ,
					DataBus		=> DataBus
		);
		
	
	OAD : 	OptAddrDecoder
	PORT MAP(	reset		=> resetSim,
				AddressBus	=> AddressBus(11 DOWNTO 0),
				CS_LEDR		=> CS_LEDR,
				CS_SW		=> CS_SW,
				CS_KEY		=> CS_KEY,
				CS_HEX0		=> CS_HEX0,
				CS_HEX1		=> CS_HEX1,
				CS_HEX2		=> CS_HEX2,
				CS_HEX3		=> CS_HEX3,
				CS_HEX4		=> CS_HEX4,
				CS_HEX5		=> CS_HEX5
				);
		
	
	IO_interface: GPIO
		PORT MAP(
			INTA		=> INTA,
			MemReadBus	=> MemReadBus,
			clock		=> clock,
			reset		=> resetSim,
			MemWriteBus	=> MemWriteBus,
			AddressBus	=> AddressBus,
			DataBus		=> DataBus,
			HEX0		=> HEX0,
			HEX1		=> HEX1,
			HEX2		=> HEX2,
			HEX3		=> HEX3,
			HEX4		=> HEX4,
			HEX5		=> HEX5,
			LEDR		=> LEDR,
			Switches	=> Switches,
			CS_LEDR		=> CS_LEDR,
			CS_SW		=> CS_SW,
			CS_HEX0		=> CS_HEX0,
			CS_HEX1		=> CS_HEX1,
			CS_HEX2		=> CS_HEX2,
			CS_HEX3		=> CS_HEX3,
			CS_HEX4		=> CS_HEX4,
			CS_HEX5		=> CS_HEX5
		);

	PROCESS(clock)
	BEGIN
		if (falling_edge(clock)) then
			if(AddressBus(11 DOWNTO 0) = X"81C" AND MemWriteBus = '1') then
				BTCTL <= ControlBus;
			END IF;
			if(AddressBus(11 DOWNTO 0) = X"824" AND MemWriteBus = '1') then
				BTCCR0 <= DataBus;
			END IF;
			if(AddressBus(11 DOWNTO 0) = X"828" AND MemWriteBus = '1') then
				BTCCR1 <= DataBus;
			END IF;
		END IF;
		
	END PROCESS;
	
	----
	BTCNT	<= DataBus		WHEN (AddressBus(11 DOWNTO 0) = X"820" AND MemWriteBus = '1') ELSE (OTHERS => 'Z');	-- INPUT
	DataBus	<= BTCNT		WHEN (AddressBus(11 DOWNTO 0) = X"820" AND MemReadBus = '1') ELSE (OTHERS => 'Z');  -- OUTPUT

	
	Basic_Timer: BTIMER
		PORT MAP(
			Addr	=> AddressBus(11 DOWNTO 0),
			BTRead	=> MemReadBus,
			BTWrite	=> MemWriteBus,
			MCLK	=> clock,
			reset	=> resetSim,
			BTCTL	=> BTCTL,
			BTCCR0	=> BTCCR0,
			BTCCR1	=> BTCCR1,
			BTCNT_io=> BTCNT,
			IRQ_OUT => IRQ_OUT(2),
			BTIFG	=> BTIFG,
			BTOUT	=> BTOUT
		);
		
	
	IntrSrc	<=  (NOT KEY3) & (NOT KEY2) & (NOT KEY1) & BTIFG & IntrTx & IntrRx;
	Intr_Controller: INTERRUPT
		GENERIC MAP(
			DataBusSize	=> DataBusSize,
			AddrBusSize	=> AddrBusSize,
			IrqSize		=> IrqSize,
			RegSize 	=> RegSize
		)
		PORT MAP(
			reset		=> resetSim,
		    clock		=> clock,
		    MemReadBus	=> MemReadBus,
		    MemWriteBus	=> MemWriteBus,
		    AddressBus	=> AddressBus,
		    DataBus		=> DataBus,
		    IntrSrc		=> IntrSrc,
		    ChipSelect	=> '0',
		    INTR		=> INTR,
		    INTA		=> INTA,
			IRQ_OUT		=> IRQ_OUT,
			INTR_Active	=> INTR_Active,
			CLR_IRQ_OUT	=> CLR_IRQ,
			IFG_STATUS_ERROR => IFG_STATUS_ERROR,
		    GIE			=> GIE
		);
		
		
	---- Uart Support
	UsartSupport: USART
		GENERIC MAP(
			DataBusSize	=> DataBusSize,
			AddrBusSize	=> 12,
			IrqSize		=> IrqSize,
			RegSize 	=> RegSize			
		)
		PORT MAP(
			clock	 		=> clock,
			reset		 	=> resetSim,
			RXIFG			=> IntrRx,
			TXIFG			=> IntrTx,
			B_RX			=> UART_RX,
			B_TX			=> UART_TX,
			IFG_STATUS_ERROR=> IFG_STATUS_ERROR,
			AddressBus		=> AddressBus(11 DOWNTO 0),
			DataBus			=> DataBus,
			MemReadBus		=> MemReadBus,
		    MemWriteBus		=> MemWriteBus
		);
		
END structure;