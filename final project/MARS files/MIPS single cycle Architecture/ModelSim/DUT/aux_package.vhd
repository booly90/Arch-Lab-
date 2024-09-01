library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;

package aux_package is
------------------------------------------------------
	component GPIO_handler IS
	GENERIC(	AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT( 
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
		seg   		: out STD_LOGIC_VECTOR (6 DOWNTO 0));
	END COMPONENT segDecoder;
		
		
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
		
		COMPONENT Ifetch
		GENERIC  (MemWidth 	: INTEGER := 10;
					 SIM 	 	 : boolean :=FALSE);

   	     PORT(	 Instruction 		: INOUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				 PC_plus_4_out 		: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				 Add_result 		: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
				 BranchNe 			: IN 	STD_LOGIC;
				 BranchEq 			: IN 	STD_LOGIC;
				 Zero 				: IN 	STD_LOGIC;
				 PC_out 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
				 Jr		   	 		: IN 	STD_LOGIC;
				 Jump		   	 	: IN 	STD_LOGIC;
				 R_data1			: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
				 clock, reset 		: IN 	STD_LOGIC;
				Next_PC_out			: OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0));
	END COMPONENT; 

------------------------------------------------------
	COMPONENT Idecode
		 PORT(	read_data_1	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data_2		: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Instruction 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			read_data 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			ALU_result		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			RegWrite 		: IN 	STD_LOGIC;
			MemtoReg 		: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0);
			RegDst 			: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0);
			Sign_extend 	: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			PC_plus_4		: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			write_data_out	: OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0);
			clock,reset		: IN 	STD_LOGIC  );
	END COMPONENT;

------------------------------------------------------
	COMPONENT control
	     PORT( 		Opcode 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
					Funct 		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
					RegDst 		: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
					ALUSrc 		: OUT 	STD_LOGIC;
					MemtoReg 	: OUT 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
					RegWrite 	: OUT 	STD_LOGIC;
					MemRead 	: OUT 	STD_LOGIC;
					MemWrite 	: OUT 	STD_LOGIC;
					BranchEq 	: OUT 	STD_LOGIC;
					BranchNe 	: OUT 	STD_LOGIC;
					Jump 		: OUT 	STD_LOGIC;
					Jr 			: OUT 	STD_LOGIC;
					clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

------------------------------------------------------
	COMPONENT  Execute
   	     PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
                Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Sign_Extend 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Function_opcode		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
               	ALUSrc 				: IN 	STD_LOGIC;
               	Zero 				: OUT	STD_LOGIC;
               	ALU_Result 			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Add_Result 			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
               	PC_plus_4 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
               	clock, reset		: IN 	STD_LOGIC ;
				Opcode              : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
				Ainput_out, Binput_out		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)				);
	END COMPONENT;

------------------------------------------------------
	COMPONENT dmemory
	    GENERIC (MemWidth 	: INTEGER := 10;
			SIM 	 	 : boolean :=FALSE);
		PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		address 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        		write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		MemRead, Memwrite 	: IN 	STD_LOGIC;
				--Peripheral 			: IN 	STD_LOGIC;
        		Clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;
		
		
		------------------------------------------------------
COMPONENT MIPS IS
	GENERIC(MemWidth 	: INTEGER := 10;
			SIM 	 	: boolean := FALSE;
			ControlBusSize: integer := 2;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			) ;
	PORT(	reset, clock				 : IN  STD_LOGIC; 
			ControlBus	        		 : OUT STD_LOGIC_VECTOR   (ControlBusSize-1 DOWNTO 0);
			DataBus		        		 : INOUT STD_LOGIC_VECTOR (DataBusSize-1    DOWNTO 0);
			AddressBus          		 : OUT STD_LOGIC_VECTOR   (AddrBusSize-1    DOWNTO 0);
			-- Output important signals to pins for easy display in Simulator
			PC								 : OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
			Instruction_out					 : OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			Branch_out, Zero_out, Memwrite_out, 
			Regwrite_out					 : OUT 	STD_LOGIC;
			Next_PC_out			: OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0);
			Ainput_out, Binput_out		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)				

			);
END COMPONENT MIPS;
		
		
		
		------------------------------------------------------
		
		COMPONENT MCU IS
	GENERIC(MemWidth 	: INTEGER := 10;
			SIM 		: boolean :=FALSE;
			ControlBusSize: integer := 2;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT( 	reset, PIN_AF14			: IN 	STD_LOGIC; 
			--SW						: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			--HEX0					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			--HEX1					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			--HEX2					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			--HEX3					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			--HEX4					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR					: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out					: OUT 	STD_LOGIC;
		Next_PC_out			: OUT 	STD_LOGIC_VECTOR( 7 DOWNTO 0);
		Ainput_out, Binput_out		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)				
);
END COMPONENT MCU;
		
		
		------------------------------------------------------
	COMPONENT pll50_25 is
	port (
		locked   : out std_logic;        --  locked.export
		outclk_0 : out std_logic;        -- outclk0.clk
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'  --   reset.reset
	);
	end COMPONENT;
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		
		------------------------------------------------------
		
		
		
		------------------------------------------------------
end aux_package;

