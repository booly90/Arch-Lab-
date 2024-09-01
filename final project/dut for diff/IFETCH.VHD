-- Ifetch module (provides the PC and instruction 
--memory for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.aux_package.ALL;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Ifetch IS
	GENERIC (MemWidth 	: INTEGER := 10;
			 SIM 	 	: boolean :=FALSE);
	PORT(	SIGNAL Instruction 		: INOUT	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	SIGNAL PC_plus_4_out 	: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        	SIGNAL Add_result 		: IN 	STD_LOGIC_VECTOR( 7 DOWNTO 0 );
        	SIGNAL BranchNe			: IN 	STD_LOGIC;
			SIGNAL BranchEq			: IN 	STD_LOGIC;
        	SIGNAL Zero 			: IN 	STD_LOGIC;
      		SIGNAL PC_out 			: OUT	STD_LOGIC_VECTOR( 9 DOWNTO 0 );
			SIGNAL Jr		   	 	: IN 	STD_LOGIC;
			SIGNAL Jump		   	 	: IN 	STD_LOGIC;
			SIGNAL R_data1			: IN	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        	SIGNAL clock, reset 	: IN 	STD_LOGIC;
			
			-- Output important signals to pins for easy display in Simulator
			SIGNAL Next_PC_out  	: OUT	STD_LOGIC_VECTOR( 7 DOWNTO 0 ));
			

			
END Ifetch;

ARCHITECTURE behavior OF Ifetch IS
	SIGNAL PC, PC_plus_4 	 	: STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	SIGNAL Mem_Addr 						: STD_LOGIC_VECTOR( MemWidth-1 DOWNTO 0 );
	SIGNAL next_PC 						: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL jump_address					: STD_LOGIC_VECTOR(9 DOWNTO 0 );
	signal reset_sample : STD_LOGIC;
	
BEGIN
		
Simulation:	IF (SIM) GENERATE
				Mem_Addr <= Next_PC;
				--Mem_Addr <= PC (9 DOWNTO 2);
			END GENERATE simulation;
		
		 
FPGA:		IF (not SIM ) GENERATE
				Mem_Addr <= Next_PC & "00";
				--Mem_Addr <= PC;
			END GENERATE FPGA;

	Next_PC_out <= Next_PC;

	--ROM for Instruction Memory
inst_memory: altsyncram
	
	GENERIC MAP (
		operation_mode => "ROM",
		width_a => 32,
		widthad_a => MemWidth,
		numwords_a => 1024,
		lpm_hint => "ENABLE_RUNTIME_MOD = YES,INSTANCE_NAME = ITCM",
		lpm_type => "altsyncram",
		outdata_reg_a => "UNREGISTERED",
		--init_file => "C:\Users\user\Documents\GitHub\Arch-Lab-\final project\MARS files\MIPS single cycle Architecture\ModelSim\L1_Caches\our tests\program.hex",
		init_file => "C:\Users\barmu\Documents\GitHub\Arch-Lab-\final project\MARS files\MIPS single cycle Architecture\ModelSim\L1_Caches\our tests\program.hex",
		--init_file =>"C:\Users\barmu\Documents\GitHub\Arch-Lab-\final project\MARS files\MIPS single cycle Architecture\Quartus\asm code\program.hex",
		intended_device_family => "Cyclone"
	)
	PORT MAP (
		clock0     =>  (clock),
		address_a 	=> Mem_Addr  , 
		q_a 			=> Instruction );
		
					-- Instructions always start on word address - not byte
		PC(1 DOWNTO 0) <= "00";
					-- copy output signals - allows read inside module
		
			PC_out 			<= PC ;
			PC_plus_4_out 	<= PC_plus_4 ;
						-- send address to inst. memory address register
		
						-- Adder to increment PC by 4        
      	PC_plus_4( 9 DOWNTO 2 )  <= PC( 9 DOWNTO 2 ) + 1;
       	PC_plus_4( 1 DOWNTO 0 )  <= "00";
						-- Calculate jump adress using pc and Instruction
		jump_address <= Instruction(7 DOWNTO 0) & "00" ;
						-- Mux to select Branch Address or PC + 4        
		Next_PC  <= "00000000"   		WHEN Reset = '1' ELSE --or reset_sample = '1'  ELSE                        
					R_data1(9 DOWNTO 2)			WHEN Jr = '1' 	 ELSE
					jump_address( 9 DOWNTO 2)	WHEN jump='1'    ELSE
					Add_result  	WHEN ( (( BranchNe = '1' ) AND ( Zero = '0' )) 
									OR	   (( BranchEq = '1' ) AND ( Zero = '1' ))) ELSE
					PC_plus_4( 9 DOWNTO 2 );
		
		
					
	PROCESS
		BEGIN
			WAIT UNTIL ( clock'EVENT ) AND ( clock = '1' );
			IF reset = '1' THEN
				   PC( 9 DOWNTO 2) <= "00000000" ; 

				   
			else
				   PC( 9 DOWNTO 2 ) <= next_PC;
			END IF;
	END PROCESS;
	
--sample_reset:	
--		PROCESS (clock)
--		BEGIN
--			if (rising_edge(clock)) then
--				reset_sample <= reset;
--			END IF;
--	END PROCESS;
END behavior;


