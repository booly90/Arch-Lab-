				-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;

ENTITY MIPS IS
	GENERIC(MemWidth 	: INTEGER := 10;
			SIM 	 	 : boolean :=FALSE;
			ControlBusSize: integer := 4;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT(	reset, clock				 : IN  STD_LOGIC; 
			ControlBus	        		 : OUT STD_LOGIC_VECTOR   (ControlBusSize-1 DOWNTO 0);
			DataBus		        		 : INOUT STD_LOGIC_VECTOR (DataBusSize-1    DOWNTO 0);
			AddressBus          		 : OUT STD_LOGIC_VECTOR   (AddrBusSize-1    DOWNTO 0);
			GIE							 : OUT 	STD_LOGIC;

		-- Output important signals to pins for easy display in Simulator
		PC								 : OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					 : OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out					 : OUT 	STD_LOGIC ;
		Next_PC_out  	: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
		Ainput_out, Binput_out		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);

END 	MIPS;

ARCHITECTURE structure OF MIPS IS

	

					-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4 		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data_1 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Sign_Extend 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_temp	: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALUSrc 			: STD_LOGIC;
	SIGNAL Branch 			: STD_LOGIC;
	SIGNAL RegDst 			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Regwrite 		: STD_LOGIC;
	SIGNAL Zero 			: STD_LOGIC;
	SIGNAL MemWrite 		: STD_LOGIC;
	SIGNAL MemtoReg 		: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL MemRead 			: STD_LOGIC;
	SIGNAL Instruction		: STD_LOGIC_VECTOR(31 DOWNTO 0 );
	SIGNAL BranchNe			: STD_LOGIC;
	SIGNAL BranchEq			: STD_LOGIC;
	SIGNAL jump 			: STD_LOGIC;
	SIGNAL Jr   			: STD_LOGIC;
	SIGNAL Funct			: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL muxed_next_pc	: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL address     		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL MemReadInt  		: STD_LOGIC;
	SIGNAL MemWriteInt 		: STD_LOGIC;
	SIGNAL read_data_MEM	: STD_LOGIC_VECTOR(31 DOWNTO 0 );
	SIGNAL clr_IRbt			: STD_LOGIC;
	SIGNAL clr_IRdiv   		: STD_LOGIC;
	SIGNAL INTA				: STD_LOGIC;
	SIGNAL INTR				: STD_LOGIC;
	SIGNAL INT_FSM			: STD_LOGIC_VECTOR ( 1  DOWNTO 0 );
	SIGNAL DIV_en	 		: STD_LOGIC;
	SIGNAL JAL_ISR			: STD_LOGIC;

BEGIN

	read_data <= read_data_temp WHEN ALU_result(11) ='0' ELSE DataBus;
	
	DataBus <= read_data_2 when (MemWrite = '1'  AND ALU_result(11) = '1') ELSE (others => 'Z');  --read_data_2 is the write_data signal for data-memory
	AddressBus <= X"00000" & ALU_result (11 DOWNTO 0);
	ControlBus(0) <= MemRead;
	ControlBus(1) <= MemWrite;
	ControlBus(2) <= clr_IRbt;
	ControlBus(3) <= clr_IRdiv;
	
					-- copy important signals to output pins for easy 
					-- display in Simulator
   Instruction_out 	<= Instruction;
   ALU_result_out 	<= ALU_result;
   read_data_1_out 	<= read_data_1;
   read_data_2_out 	<= read_data_2;
   
   Branch_out 		<= BranchNe OR BranchEq;
   Zero_out 		<= Zero;
   RegWrite_out 	<= RegWrite;
   MemWrite_out 	<= MemWrite;	
   
					-- connect the 5 MIPS components   
  IFE : Ifetch GENERIC map (MemWidth, SIM)
	PORT MAP (	Instruction 	=> Instruction,
    	    	PC_plus_4_out 	=> PC_plus_4,
				Add_result 		=> Add_result,
				BranchNe 		=> BranchNe,
				BranchEq 		=> BranchEq,
				Zero 			=> Zero,
				PC_out 			=> PC,
				Jr				=> Jr,
				Jump			=> Jump,
				read_data_1_ID	=> read_data_1,
				read_data_MEM	=> read_data_MEM,
				JAL_ISR			=> JAL_ISR,
				INT_FSM			=> INT_FSM,
				clock 			=> clock,
				reset 			=> reset,
				Next_PC_out		=> Next_PC_out);

   ID : Idecode
   	PORT MAP (	read_data_1 	=> read_data_1,
        		read_data_2 	=> read_data_2,
        		Instruction_IF 	=> Instruction,
        		read_data 		=> read_data,
				ALU_result 		=> ALU_result,
				RegWrite 		=> RegWrite,
				MemtoReg 		=> MemtoReg,
				RegDst 			=> RegDst,
				Sign_extend 	=> Sign_extend,
				PC_plus_4   =>  PC_plus_4,
				write_data_out	=> write_data_out,
				INT_FSM			=> INT_FSM,
				GIE				=> GIE,
        		clock 			=> clock,  
				reset 			=> reset );


   CTL:   control
	PORT MAP ( 	Opcode 			=> Instruction( 31 DOWNTO 26 ),
				Funct			=> Instruction( 5 DOWNTO 0 ),
				Instruction		=> Instruction,
				RegDst 			=> RegDst,
				ALUSrc 			=> ALUSrc,
				MemtoReg 		=> MemtoReg,
				RegWrite 		=> RegWrite,
				MemRead 		=> MemRead,
				MemWrite 		=> MemWrite,
				BranchNe		=> BranchNe,
				BranchEq		=> BranchEq,
				Jr				=> Jr,
				Jump			=> Jump,
				JAL_ISR_out		=> JAL_ISR,
				clr_IRbt 		=> clr_IRbt,
				clr_IRdiv		=> clr_IRdiv,
				INTA	 		=> INTA,		
				INTR	 		=> INTR,	
				INT_FSM	 		=> INT_FSM,	
				DIV_en	 		=> DIV_en,	 
                clock 	 		=> clock,
				reset 	 		=> reset );

   EXE:  Execute
   	PORT MAP (	Read_data_1 	=> read_data_1,
             	Read_data_2 	=> read_data_2,
				Sign_extend 	=> Sign_extend,
                Function_opcode	=> Instruction( 5 DOWNTO 0 ),
				ALUSrc 			=> ALUSrc,
				Zero 			=> Zero,
                ALU_Result		=> ALU_Result,
				Add_Result 		=> Add_Result,
				PC_plus_4		=> PC_plus_4,
                Clock			=> clock,
				Reset			=> reset ,
				Opcode 			=> Instruction( 31 DOWNTO 26 ),
				Ainput_out		=> Ainput_out,
				Binput_out		=> Binput_out);

   MEM:  dmemory
	GENERIC MAP(MemWidth => MemWidth, SIM => SIM) 
	PORT MAP (	read_data 		=> read_data_temp,
				address 		=> address,--jump memory address by 4
				write_data 		=> read_data_2,
				MemRead 		=> MemReadInt, 
				Memwrite 		=> MemWriteInt,
                clock 			=> clock,  
				reset 			=> reset );
				
	address     <=  ALU_Result (9 DOWNTO 2) & "00"	;
	MemReadInt  <= (MemRead AND (NOT ALU_result(11)));
	MemWriteInt  <= (MemWrite AND (NOT ALU_result(11)));
END structure;

