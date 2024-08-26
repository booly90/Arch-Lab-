library IEEE;
use ieee.std_logic_1164.all;

package aux_package is
--------------------------- MIPS ---------------------------
	COMPONENT MIPS IS
		GENERIC (	MemWidth 	: INTEGER := 10;
					SIM 		: BOOLEAN := FALSE;
					CtrlBusSize	: integer := 8;
					AddrBusSize	: integer := 32;
					DataBusSize	: integer := 32;
					IOSize		: integer := 8
				 );
		PORT( reset, clock, ena	: IN 	STD_LOGIC; 
			-- Output important signals to pins for easy display in Simulator
			PC					: OUT  	STD_LOGIC_VECTOR(9 DOWNTO 0);
			CLKCNT				: OUT  	STD_LOGIC_VECTOR(15 DOWNTO 0);
			STCNT				: OUT  	STD_LOGIC_VECTOR(7 DOWNTO 0);
			FHCNT				: OUT  	STD_LOGIC_VECTOR(7 DOWNTO 0);
			BPADD				: IN  	STD_LOGIC_VECTOR(7 DOWNTO 0);
			ST_trigger			: OUT	STD_LOGIC;
			ControlBus			: OUT	STD_LOGIC_VECTOR(CtrlBusSize-1 DOWNTO 0);
			MemReadBus			: OUT 	STD_LOGIC;
			MemWriteBus			: OUT 	STD_LOGIC;
			AddressBus			: OUT	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
			GIE					: OUT	STD_LOGIC;
			INTR				: IN	STD_LOGIC;
			INTA				: OUT	STD_LOGIC;
			INTR_Active			: IN	STD_LOGIC;
			CLR_IRQ				: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			DataBus				: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT Ifetch IS
	GENERIC (MemWidth	: INTEGER;
			 SIM 		: BOOLEAN);
	PORT(	Instruction						       	: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	PC_plus_4_out 					       	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	Add_result 						       	: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	PCSrc 							       	: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
      		PC_out 							       	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			JumpAddr						       	: IN	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	clock, ena, Stall_IF,  reset 			: IN 	STD_LOGIC;
			INTA									: IN	STD_LOGIC;
			Read_ISR_PC								: IN	STD_LOGIC;
			HOLD_PC									: IN 	STD_LOGIC;
			ISRAddr									: IN	STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT Idecode
	PORT(	read_data_1						: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2						: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			write_register_address_0 		: OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			write_register_address_1 		: OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			write_register_address      	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Instruction 					: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4_shifted				: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			RegWrite						: IN 	STD_LOGIC;
			ForwardA_ID, ForwardB_ID		: IN 	STD_LOGIC;
			BranchBeq, BranchBne, Jump, JAL	: IN 	STD_LOGIC; -- Added JAL
			Stall_ID					: IN    STD_LOGIC;
			write_data				: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Branch_read_data_FW			: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Sign_extend 				: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PCSrc		 				: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
			JumpAddr					: OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
			PCBranch_addr 				: OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			GIE							: OUT 	STD_LOGIC;
			Read_ISR_PC					: IN	STD_LOGIC;
			EPC							: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			INTR						: IN	STD_LOGIC;
			INTR_Active					: IN	STD_LOGIC;
			CLR_IRQ						: IN	STD_LOGIC_VECTOR(5 DOWNTO 0);
			clock,reset					: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT control
	PORT( 	
		Opcode 			: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		Funct			: IN 	STD_LOGIC_VECTOR(5 DOWNTO 0);
		RegDst 			: OUT 	STD_LOGIC_VECTOR(1 DOWNTO 0);
		ALUSrc 			: OUT 	STD_LOGIC;
		MemtoReg 		: OUT 	STD_LOGIC;
		RegWrite 		: OUT 	STD_LOGIC;
		MemRead 		: OUT 	STD_LOGIC;
		MemWrite 		: OUT 	STD_LOGIC;
		BranchBeq 		: OUT 	STD_LOGIC;
		BranchBne 		: OUT 	STD_LOGIC;
		Jump			: OUT 	STD_LOGIC;
		Jal				: OUT 	STD_LOGIC;
		ALUop 			: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
		INTR			: IN 	STD_LOGIC;
		-- INTA			: INOUT STD_LOGIC;
		IF_FLUSH		: OUT 	STD_LOGIC;
		ID_FLUSH		: OUT 	STD_LOGIC;
		EX_FLUSH		: OUT 	STD_LOGIC;
		HOLD_PC			: IN 	STD_LOGIC;
		Read_ISR_PC		: IN 	STD_LOGIC;	
		clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT  Execute
	PORT(	Read_data_1 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Read_data_2 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Sign_extend 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Function_opcode : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			Opcode			: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			ALUOp 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			ALUSrc 			: IN 	STD_LOGIC;
			Zero 			: OUT	STD_LOGIC;
			RegDst			: IN    STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			ALU_Result 		: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4 		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			Wr_reg_addr     : OUT   STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_reg_addr_0	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_reg_addr_1	: IN    STD_LOGIC_VECTOR( 4 DOWNTO 0 );
			Wr_data_FW_WB	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Wr_data_FW_MEM	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ForwardA 		: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);		
			ForwardB		: IN 	STD_LOGIC_VECTOR(1 DOWNTO 0);	
			WriteData_EX    : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Flush_EX		: IN 	STD_LOGIC;
			clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT dmemory IS
		GENERIC (MemWidth	: INTEGER;
				 SIM		: BOOLEAN);
		PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				address 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				MemRead, Memwrite 	: IN 	STD_LOGIC;
				clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;
	
	COMPONENT WRITE_BACK IS
	PORT( 
		ALU_Result, read_data	: IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		PC_plus_4_shifted		: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		MemtoReg, Jal			: IN  STD_LOGIC;
		write_data 				: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		write_data_mux			: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
		
	COMPONENT ALU_CONTROL IS
	PORT(	ALUOp 						: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
			Funct 						: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			Opcode 						: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
			ALU_ctl 					: OUT   STD_LOGIC_VECTOR( 3 DOWNTO 0 ));
	END COMPONENT;
		
	COMPONENT  ALU IS
	PORT(	Ainput 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Binput 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALU_ctl		 	: IN 	STD_LOGIC_VECTOR( 3 DOWNTO 0 );
			ALU_output_mux	: OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 )
			);
	END COMPONENT;
		
	COMPONENT HazardUnit IS
	PORT( 
		MemtoReg_EX, MemtoReg_MEM	 		 : IN STD_LOGIC;
		WriteReg_EX, WriteReg_MEM, WriteReg_WB : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegRs_ID, RegRt_ID 					 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		RegRs_EX, RegRt_EX					 : IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		EX_RegWr, MEM_RegWr, WB_RegWr		 : IN  STD_LOGIC;
		BranchBeq_ID, BranchBne_ID, Jump_ID	 : IN STD_LOGIC;
		Stall_IF, Stall_ID, Flush_EX 	 	 : OUT STD_LOGIC;
		ForwardA, ForwardB				     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		ForwardA_Branch, ForwardB_Branch		     : OUT STD_LOGIC
		);
	END 	COMPONENT;
-----------------------------------------------------------------------------------

--------------------------- GPIO ---------------------------
	COMPONENT InputPeripheral IS
		GENERIC(DataBusSize	: integer := 32);
		PORT( 
			MemRead		: IN	STD_LOGIC;
			ChipSelect	: IN 	STD_LOGIC;
			INTA		: IN	STD_LOGIC;
			Data		: OUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
			GPInput		: IN	STD_LOGIC_VECTOR(7 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT OutputPeripheral IS
		GENERIC (SevenSeg	: BOOLEAN := TRUE; 
				 IOSize		: INTEGER := 7); -- 7 WHEN HEX, 8 WHEN LEDs
		PORT( 
			MemRead		: IN	STD_LOGIC;
			clock		: IN 	STD_LOGIC;
			reset		: IN 	STD_LOGIC;
			MemWrite	: IN	STD_LOGIC;
			ChipSelect	: IN 	STD_LOGIC;
			Data		: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			GPOutput	: OUT	STD_LOGIC_VECTOR(IOSize-1 DOWNTO 0)
			);
	END COMPONENT;

	COMPONENT OptAddrDecoder IS
		PORT( 
			reset 						: IN	STD_LOGIC;
			AddressBus					: IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
			CS_LEDR, CS_SW, CS_KEY		: OUT 	STD_LOGIC;
			CS_HEX0, CS_HEX1, CS_HEX2	: OUT 	STD_LOGIC;
			CS_HEX3, CS_HEX4, CS_HEX5	: OUT 	STD_LOGIC
			);
	END COMPONENT;

	COMPONENT SevenSegDecoder IS
	  GENERIC (SegmentSize	: integer := 7);
	  PORT (data		: in STD_LOGIC_VECTOR (3 DOWNTO 0);
			seg   		: out STD_LOGIC_VECTOR (SegmentSize-1 downto 0));
	END COMPONENT;

	COMPONENT GPIO IS
		GENERIC(CtrlBusSize	: integer := 8;
				AddrBusSize	: integer := 32;
				DataBusSize	: integer := 32
		);
		PORT( 
			-- ControlBus	: IN	STD_LOGIC_VECTOR(CtrlBusSize-1 DOWNTO 0);
			INTA						: IN	STD_LOGIC;
			MemReadBus					: IN 	STD_LOGIC;
			clock						: IN 	STD_LOGIC;
			reset						: IN 	STD_LOGIC;
			MemWriteBus					: IN 	STD_LOGIC;
			AddressBus					: IN	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
			DataBus						: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
			HEX0, HEX1					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2, HEX3					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4, HEX5					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR						: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
			Switches					: IN	STD_LOGIC_VECTOR(7 DOWNTO 0);
			CS_LEDR, CS_SW				: IN 	STD_LOGIC;
			CS_HEX0, CS_HEX1, CS_HEX2	: IN 	STD_LOGIC;
			CS_HEX3, CS_HEX4, CS_HEX5	: IN 	STD_LOGIC
		);
	END COMPONENT;
------------------ BASIC TIMER ---------------------------
	COMPONENT BTIMER IS
		GENERIC(DataBusSize	: integer := 32);
		PORT( 
			Addr	: IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
			BTRead	: IN	STD_LOGIC;
			BTWrite	: IN	STD_LOGIC;
			MCLK	: IN 	STD_LOGIC;
			reset	: IN 	STD_LOGIC;
			BTCTL	: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			BTCCR0	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
			BTCCR1	: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
			BTCNT_io: INOUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
			IRQ_OUT : IN	STD_LOGIC;
			BTIFG	: OUT 	STD_LOGIC;
			BTOUT	: OUT	STD_LOGIC
			);
	END COMPONENT;
------------------ Interrupt Controller --------------------
	COMPONENT INTERRUPT IS
	GENERIC(DataBusSize	: integer := 32;
			AddrBusSize	: integer := 12;
			IrqSize	    : integer := 6;
			RegSize		: integer := 8
			);
	PORT( 
			reset		: IN	STD_LOGIC;
			clock		: IN	STD_LOGIC;
			MemReadBus	: IN	STD_LOGIC;
			MemWriteBus	: IN	STD_LOGIC;
			AddressBus	: IN	STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
			DataBus		: INOUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
			IntrSrc		: IN	STD_LOGIC_VECTOR(IrqSize-1 DOWNTO 0); -- IRQ
			ChipSelect	: IN	STD_LOGIC;
			INTR		: OUT	STD_LOGIC;
			INTA		: IN	STD_LOGIC;
			IRQ_OUT		: OUT   STD_LOGIC_VECTOR(IrqSize-1 DOWNTO 0);
			INTR_Active	: OUT	STD_LOGIC;
			CLR_IRQ_OUT	: OUT	STD_LOGIC_VECTOR(5 DOWNTO 0);
			IFG_STATUS_ERROR : IN STD_LOGIC;
			GIE			: IN	STD_LOGIC
		);
	END COMPONENT;

------------------ UART --------------------
	COMPONENT USART is
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
				MemReadBus	: IN	STD_LOGIC;
				MemWriteBus	: IN	STD_LOGIC
			);
	end COMPONENT;
	
	COMPONENT UART_RX is
		port (
			i_Clk       : in 	std_logic;
			i_RX_Serial : in  	std_logic := '1';
			o_RX_DV     : out	std_logic;
			o_RX_Byte   : out 	std_logic_vector(7 downto 0);
			-- UCTL register bits
			SWRST		: in	std_logic := '0';
			PENA		: in	std_logic := '0';
			PEV			: in	std_logic := '0';
			FE			: out	std_logic := '0';
			PE			: out	std_logic := '0';
			OE			: out	std_logic := '0';
			BUSY		: out	std_logic := '0';
			g_CLKS_PER_BIT	: IN INTEGER
		);
	end COMPONENT;

	COMPONENT UART_TX is
		port (
			i_Clk       : in  std_logic;
			i_TX_DV     : in  std_logic;
			i_TX_Byte   : in  std_logic_vector(7 downto 0);
			o_TX_Active : out std_logic; -- BUSY
			o_TX_Serial : out std_logic;
			o_TX_Done   : out std_logic;
			SWRST		: in  std_logic := '0'; -- Software reset enable
			PENA		: in  std_logic := '0'; -- Parity enable
			g_CLKS_PER_BIT	: IN INTEGER
		);
	end COMPONENT;

end aux_package;

