				-- Top Level Structural Model for MIPS Processor Core
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY MIPS IS

	PORT( reset, clock					: IN 	STD_LOGIC; 
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out					: OUT 	STD_LOGIC );
END 	MIPS;

ARCHITECTURE structure OF MIPS IS

	COMPONENT Ifetch
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
				 clock, reset 		: IN 	STD_LOGIC );
	END COMPONENT; 

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
					Jal			: OUT 	STD_LOGIC;
					Jr 			: OUT 	STD_LOGIC;
					clock, reset	: IN 	STD_LOGIC );
	END COMPONENT;

	COMPONENT  Execute
   	     PORT(	Read_data_1 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
                Read_data_2 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Sign_Extend 		: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Function_opcode		: IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 );
               	ALUOp 				: IN 	STD_LOGIC_VECTOR( 1 DOWNTO 0 );
               	ALUSrc 				: IN 	STD_LOGIC;
               	Zero 				: OUT	STD_LOGIC;
               	ALU_Result 			: OUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
               	Add_Result 			: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
               	PC_plus_4 			: IN 	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
               	clock, reset		: IN 	STD_LOGIC ;
				Opcode              : IN 	STD_LOGIC_VECTOR( 5 DOWNTO 0 ) );
	END COMPONENT;


	COMPONENT dmemory
	     PORT(	read_data 			: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		address 			: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        		write_data 			: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        		MemRead, Memwrite 	: IN 	STD_LOGIC;
        		Clock,reset			: IN 	STD_LOGIC );
	END COMPONENT;

					-- declare signals used to connect VHDL components
	SIGNAL PC_plus_4 		: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL read_data_1 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data_2 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Sign_Extend 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL Add_result 		: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL ALU_result 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL read_data 		: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL ALUSrc 			: STD_LOGIC;
	SIGNAL Branch 			: STD_LOGIC;
	SIGNAL RegDst 			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Regwrite 		: STD_LOGIC;
	SIGNAL Zero 			: STD_LOGIC;
	SIGNAL MemWrite 		: STD_LOGIC;
	SIGNAL MemtoReg 		: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL MemRead 			: STD_LOGIC;
	SIGNAL ALUop 			: STD_LOGIC_VECTOR( 1 DOWNTO 0 );
	SIGNAL Instruction		: STD_LOGIC_VECTOR(31 DOWNTO 0 );
	SIGNAL BranchNe			: STD_LOGIC;
	SIGNAL BranchEq			: STD_LOGIC;
	SIGNAL jump 			: STD_LOGIC;
	SIGNAL Jr   			: STD_LOGIC;
	SIGNAL Jal  			: STD_LOGIC;
	SIGNAL Funct			: STD_LOGIC_VECTOR( 5 DOWNTO 0 );
	SIGNAL muxed_next_pc	: STD_LOGIC_VECTOR( 9 DOWNTO 0);

BEGIN
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
  IFE : Ifetch
	PORT MAP (	Instruction 	=> Instruction,
    	    	PC_plus_4_out 	=> PC_plus_4,
				Add_result 		=> Add_result,
				BranchNe 		=> BranchNe,
				BranchEq 		=> BranchEq,
				Zero 			=> Zero,
				PC_out 			=> PC,
				Jr				=> Jr,
				Jump			=> Jump,
				R_data1			=> read_data_1,
				clock 			=> clock,  
				reset 			=> reset );

   ID : Idecode
   	PORT MAP (	read_data_1 	=> read_data_1,
        		read_data_2 	=> read_data_2,
        		Instruction 	=> Instruction,
        		read_data 		=> read_data,
				ALU_result 		=> ALU_result,
				RegWrite 		=> RegWrite,
				MemtoReg 		=> MemtoReg,
				RegDst 			=> RegDst,
				Sign_extend 	=> Sign_extend,
				PC_plus_4   =>  PC_plus_4,
				write_data_out	=> write_data_out,
        		clock 			=> clock,  
				reset 			=> reset );


   CTL:   control
	PORT MAP ( 	Opcode 			=> Instruction( 31 DOWNTO 26 ),
				Funct			=> Instruction( 5 DOWNTO 0 ),
				RegDst 			=> RegDst,
				ALUSrc 			=> ALUSrc,
				MemtoReg 		=> MemtoReg,
				RegWrite 		=> RegWrite,
				MemRead 		=> MemRead,
				MemWrite 		=> MemWrite,
				BranchNe		=> BranchNe,
				BranchEq		=> BranchEq,
				Jal				=> Jal,
				Jr				=> Jr,
				Jump			=> Jump,
				--ALUop 			=> ALUop,
                clock 			=> clock,
				reset 			=> reset );

   EXE:  Execute
   	PORT MAP (	Read_data_1 	=> read_data_1,
             	Read_data_2 	=> read_data_2,
				Sign_extend 	=> Sign_extend,
                Function_opcode	=> Instruction( 5 DOWNTO 0 ),
				ALUOp 			=> ALUop,
				ALUSrc 			=> ALUSrc,
				Zero 			=> Zero,
                ALU_Result		=> ALU_Result,
				Add_Result 		=> Add_Result,
				PC_plus_4		=> PC_plus_4,
                Clock			=> clock,
				Reset			=> reset ,
				Opcode 			=> Instruction( 31 DOWNTO 26 ));

   MEM:  dmemory
	PORT MAP (	read_data 		=> read_data,
				address 		=> ALU_Result (9 DOWNTO 2),--jump memory address by 4
				write_data 		=> read_data_2,
				MemRead 		=> MemRead, 
				Memwrite 		=> MemWrite, 
                clock 			=> clock,  
				reset 			=> reset );
END structure;

