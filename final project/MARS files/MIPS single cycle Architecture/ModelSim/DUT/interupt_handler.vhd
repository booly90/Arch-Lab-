library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

--------------------------------------------------------------

ENTITY interupt_handler IS
GENERIC(	AddrBusSize	: integer := 12;
			DataBusSize	: integer := 32;
			IrqSize	    : integer := 7
			);
	PORT( 
		set_btifg,key_1,key_2,key_3,DIV_ifg,clk,rst	:	in std_logic;
		INTR							:	out std_logic;
		IRQ_OUT							:	out STD_LOGIC_VECTOR(6 DOWNTO 0);		
		MemReadBus	: IN	STD_LOGIC;
		MemWriteBus	: IN	STD_LOGIC;
		AddressBus	: IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		DataBus		: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
		INTA		: IN	STD_LOGIC;
		GIE			: IN	STD_LOGIC
		);
  
END interupt_handler;
--------------------------------------------------------------
ARCHITECTURE dfl OF interupt_handler IS
	SIGNAL IRQ		:	std_logic_vector (6 downto 0);
	SIGNAL CLR_IRQ  : STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL IntrEn	: STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL IFG		: STD_LOGIC_VECTOR(6 DOWNTO 0);
	SIGNAL INTA_Delayed : STD_LOGIC;
	SIGNAL	IntrSrc : STD_LOGIC_VECTOR(6 DOWNTO 0);
	signal	counter : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	signal typereg	: STD_LOGIC_VECTOR (7 downto 0);

BEGIN

DataBus <=	X"000000" & typereg 	WHEN (AddressBus = X"83E" AND MemReadBus = '1') else --**OR (INTA = '0' AND MemReadBus = '0') ELSE
			X"000000" & '0' 	& IntrEn 	WHEN (AddressBus = X"83C" AND MemReadBus = '1') ELSE
			X"000000" & '0' 	& IFG		WHEN (AddressBus = X"83D" AND MemReadBus = '1') ELSE
			(OTHERS => 'Z');




PROCESS(clk) 
BEGIN
	IF (falling_edge(clk)) THEN
		IF (AddressBus = X"83C" AND MemWriteBus = '1') THEN
			IntrEn 	<=	DataBus(6 DOWNTO 0);
		END IF;		
	END IF;
END PROCESS;

IFG		<=	DataBus(6 DOWNTO 0)	WHEN (AddressBus = X"83D" AND MemWriteBus = '1') 
			ELSE (IRQ AND IntrEn);		

PROCESS (clk, IFG) BEGIN 
	IF (rising_edge(clk)) THEN
		IF (IFG(0) = '1' OR IFG(1) = '1' OR IFG(2) = '1' OR
			IFG(3) = '1' OR IFG(4) = '1' OR IFG(5) = '1') THEN
			
			INTR <= GIE;
		ELSE 
			INTR <= '0';
		END IF;
	END IF;
END PROCESS;
			
------------ KEY1 ---------------
-- two zeroes are for USART IFG's
IntrSrc <= DIV_ifg & key_3 & key_2 & key_1 & set_btifg & '0' & '0';
			

PROCESS (clk, rst, CLR_IRQ(3), IntrSrc(3))
BEGIN
	IF (rst = '1') THEN
		IRQ(3) <= '0';
	ELSIF CLR_IRQ(3) = '0' THEN
		IRQ(3) <= '0';
	ELSIF rising_edge(IntrSrc(3)) THEN
		IRQ(3) <= '1';
	END IF;
END PROCESS;
	

------------ KEY2 ---------------
PROCESS (clk, rst, CLR_IRQ(4), IntrSrc(4))
BEGIN
	IF (rst = '1') THEN
		IRQ(4) <= '0';
	ELSIF CLR_IRQ(4) = '0' THEN
		IRQ(4) <= '0';
	ELSIF rising_edge(IntrSrc(4)) THEN
		IRQ(4) <= '1';
	END IF;
END PROCESS;
------------ KEY3 ---------------
PROCESS (clk, rst, CLR_IRQ(5), IntrSrc(5))
BEGIN
	IF (rst = '1') THEN
		IRQ(5) <= '0';
	ELSIF CLR_IRQ(5) = '0' THEN
		IRQ(5) <= '0';
	ELSIF rising_edge(IntrSrc(5)) THEN
		IRQ(5) <= '1';
	END IF;
END PROCESS;
---

IRQ_OUT <= IRQ;

PROCESS (clk) BEGIN
	IF (rst = '1') THEN
		INTA_Delayed <= '1';
	ELSIF (falling_edge(clk)) THEN
		INTA_Delayed <= INTA;
	END IF;
END PROCESS;



CLR_IRQ(0) <= '0' WHEN (typereg = X"08" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';
CLR_IRQ(1) <= '0' WHEN (typereg = X"0C" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';
CLR_IRQ(2) <= '0' WHEN (typereg = X"10" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';
CLR_IRQ(3) <= '0' WHEN (typereg = X"14" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';
CLR_IRQ(4) <= '0' WHEN (typereg = X"18" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';
CLR_IRQ(5) <= '0' WHEN (typereg = X"1C" AND INTA = '1' AND INTA_Delayed = '0') ELSE '1';




typereg  <= 	
			"00010000" 	WHEN IRQ(1) = '1' ELSE 		-- type = X"10"
			"00010100" 	WHEN IRQ(2) = '1' ELSE 		-- type = X"14"
			"00011000" 	WHEN IRQ(3) = '1' ELSE 		-- type = X"18"
			"00011100" 	WHEN IRQ(4) = '1' ELSE 		-- type = X"1c"
			"00100000" 	WHEN IRQ(5) = '1' ELSE 		-- type = X"20" 
			"00000000" ;
END dfl;