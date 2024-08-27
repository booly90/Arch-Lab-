-- Set Generic g_CLKS_PER_BIT as follows:
-- g_CLKS_PER_BIT = (Frequency of i_Clk)/(Frequency of UART)
-- Example: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87
-- 50 MHz Clock, 9600 baud UART - (50000000)/(9600) = 5208
-- In our case:
-- 50 MHz Clock, 115200 baud UART - (50000000)/(115200) = 434

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
USE work.aux_package.all;
 
entity USART is
	GENERIC(DataBusSize		: integer := 32;
			AddrBusSize		: integer := 12;
			IrqSize	    	: integer := 6;
			RegSize			: integer := 8
			);
	PORT(
			clock, reset      	: in  	std_logic;
			RXIFG 		: out  	std_logic := '0';
			TXIFG		: out	std_logic := '0';
			B_RX		: in	std_logic := '1';
			B_TX     	: out 	std_logic := '1';
			IFG_STATUS_ERROR	:	out	std_logic;
			AddressBus	: IN	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);	
			DataBus		: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
			MemReadBus	: IN	STD_LOGIC := '0';
			MemWriteBus	: IN	STD_LOGIC := '0'
		);
end USART;
 
 
architecture structure of USART is

	SIGNAL UCTL											: STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := "00001001";
	SIGNAL RXBUF										: STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := "00000000";
	SIGNAL TXBUF										: STD_LOGIC_VECTOR( 7 DOWNTO 0 ) := "00000000";
	SIGNAL g_CLKS_PER_BIT								: integer;

	SIGNAL FULLBUFF_FG									: STD_LOGIC := '0';
	SIGNAL RX_BUSY										: STD_LOGIC := '0';
	SIGNAL TX_BUSY										: STD_LOGIC := '0';
	SIGNAL s_BUSY										: STD_LOGIC := '0';
	SIGNAL Data_RX										: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL Data_VLD_RX									: STD_LOGIC;	
	SIGNAL Data_VLD_TX									: STD_LOGIC;
	SIGNAL s_TX_Done									: STD_LOGIC;
	---- Error signals
	SIGNAL FRAMING_ERROR								: STD_LOGIC;
	SIGNAL PARITY_ERROR									: STD_LOGIC;
	SIGNAL OVERRUN_ERROR								: STD_LOGIC;

	--- UCTL ALIAS	
	ALIAS SWRST		IS UCTL(0);
	ALIAS PENA		IS UCTL(1);
	ALIAS PEV		IS UCTL(2);
	ALIAS BAUDRATE	IS UCTL(3);
	ALIAS FE		IS UCTL(4);
	ALIAS PE		IS UCTL(5);
	ALIAS OE	IS UCTL(6);
	ALIAS BUSY		IS UCTL(7);
	
 
begin
	
	
	g_CLKS_PER_BIT <= 434 WHEN BAUDRATE = '1' ELSE 5208;

	

	
	
-- OUTPUT TO MCU -- 
DataBus <=	X"000000" 		& UCTL 		WHEN (AddressBus = X"818" AND MemReadBus = '1') ELSE
			X"000000"		& RXBUF 	WHEN (AddressBus = X"819" AND MemReadBus = '1') ELSE
			X"000000"		& TXBUF		WHEN (AddressBus = X"81A" AND MemReadBus = '1') ELSE
			(OTHERS => 'Z');		
	
	
----- Error -------
	IFG_STATUS_ERROR <= FRAMING_ERROR OR PARITY_ERROR  OR OVERRUN_ERROR ;
----- UCTL(7) --------
	s_BUSY <= RX_BUSY OR TX_BUSY ;
----- RX/TX Intr	
	RXIFG <= FULLBUFF_FG;		
	TXIFG <= s_TX_Done;	

------------ RX PORT MAP	
    RX_RECEIVE : UART_RX
	PORT MAP (	
				--Inputs:
				i_Clk			=> clock,
				i_RX_Serial		=> B_RX,
				o_RX_DV 		=> Data_VLD_RX,
				o_RX_Byte		=> Data_RX,	
				SWRST			=> SWRST,
				PENA			=> PENA,
				PEV				=> PEV,	
				FE				=> FRAMING_ERROR,			
				PE				=> PARITY_ERROR,
				OE				=> OVERRUN_ERROR,
				BUSY			=> RX_BUSY,
				g_CLKS_PER_BIT 	=> g_CLKS_PER_BIT
				);

-------------- TX PORT MAP
    TX_TRANSMIT : UART_TX
	PORT MAP (	
				i_Clk			=> clock,
				i_TX_DV			=> Data_VLD_TX,
				i_TX_Byte 		=> TXBUF,
				o_TX_Active		=> TX_BUSY,
				o_TX_Serial		=> B_TX,
				o_TX_Done		=> s_TX_Done,
				SWRST			=> SWRST,
				PENA			=> PENA,
				g_CLKS_PER_BIT 	=> g_CLKS_PER_BIT
				); 
 
 
---- UCTL PROCESS

	PROCESS (clock, reset)
	BEGIN
		IF rising_edge(clock) THEN
			IF (reset = '1') THEN 
				UCTL <= "00001001";	
			ELSIF (AddressBus = X"818" AND MemWriteBus = '1') THEN
				UCTL <= DataBus(7 DOWNTO 0);					
			ELSIF SWRST = '1' THEN
				UCTL <= "00001001";
			ELSE
				BUSY  	<= s_BUSY;
				FE 	  <= FRAMING_ERROR;
				PE 	  <= PARITY_ERROR;
				OE 	  <= OVERRUN_ERROR;			
			END IF;
			
			-- RX BUFFER
			IF(reset = '1') THEN 
				RXBUF <= "00000000";
			ELSIF ( Data_VLD_RX = '1' AND NOT (AddressBus = X"819" AND MemReadBus = '1') ) THEN
				FULLBUFF_FG <= '1';
				RXBUF <= Data_RX;
			ELSIF ( (AddressBus = X"819" AND MemReadBus = '1') AND NOT Data_VLD_RX = '1' ) THEN
				RXBUF <= "00000000";
				FULLBUFF_FG <= '0';

			END IF;
			
			-- TX BUFFER
			IF(reset = '1') THEN 
				TXBUF <= "00000000";
			ELSIF ( AddressBus = X"81A" AND MemWriteBus = '1' ) THEN
				Data_VLD_TX <= '1';
				TXBUF 		<= DataBus(7 DOWNTO 0);
			ELSE
				Data_VLD_TX <= '0';
			END IF;
			
		END IF;
	END PROCESS;   
end structure;
