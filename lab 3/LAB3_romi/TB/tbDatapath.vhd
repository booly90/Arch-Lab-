library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
use std.textio.all;
use IEEE.std_logic_textio.all;
---------------------------------------------------------
entity tb is
	generic(bus_size : integer := 16;
			prog_data_size : integer := 16;
			prog_addr_size : integer := 6;
			data_data_size : integer := 16;
			data_addr_size : integer := 6;
			Awidth : integer := 6;
			dept:   integer:=64);
	
end tb;
----------
architecture dfl of tb is

signal clk, rst : std_logic;
-- inputs from control unit
signal Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in : std_logic;
signal OPC : std_logic_vector(3 downto 0);
signal RFaddr, PCsel : std_logic_vector(1 downto 0);
 -- inputs from tb
 -- PROGRAM
signal Prog_wren : std_logic; -- enable bit
signal ProgMem_Data_in : std_logic_vector(prog_data_size-1 downto 0);
signal ProgMem_writeAddr : std_logic_vector(prog_addr_size-1 downto 0);
-- DATA
signal TB_Data_wren, TBactive: std_logic := '0';
signal TB_DataMem_Data_in: std_logic_vector(data_data_size-1 downto 0);
signal TB_Data_writeAddr, TB_Data_readAddr : std_logic_vector(data_addr_size-1 downto 0);

-- outputs to control unit
signal		mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st,Nflag, Zflag, Cflag:  std_logic;
-- output to tb
signal 		DataMem_Data_out : std_logic_vector(data_data_size-1 downto 0);
signal 		tb_done : std_logic;

-- reading from files flags
signal 	    donePmemIn, doneDmemIn:	 BOOLEAN;

-- signal 		DebugSignal		 : std_logic_vector(bus_size-1 downto 0);

constant dataMemResult:	 	string(1 to 101) :=
"C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\DTCMcontent.txt"; -- our url

constant dataMemLocation: 	string(1 to 98) :=
"C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\DTCMinit.txt";-- our url

constant progMemLocation: 	string(1 to 98) :=
"C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\ITCMinit.txt";-- our url

begin 

DataPathUnit: Datapath 	generic map	(bus_size,prog_data_size,prog_addr_size,data_data_size, data_addr_size, Awidth, dept)
						port map	(clk, rst,
									 Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in, OPC, RFaddr, PCsel, --inputs from control unit
									 Prog_wren, ProgMem_Data_in,ProgMem_writeAddr, --inputs from tb_program
									 TB_Data_wren,TBactive,TB_DataMem_Data_in,TB_Data_writeAddr,TB_Data_readAddr, -- inputs from tb_data
									 mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st,Nflag, Zflag, Cflag, -- outputs to control unit
									 DataMem_Data_out); -- output to tb													
--------- clk
gen_clk : process
	begin
	  clk <= '0';
	  wait for 50 ns;
	  clk <= not clk;
	  wait for 50 ns;
	end process;

--------- Rst
gen_rst : process
        begin
		  rst <='1','0' after 100 ns;
		  wait;
        end process;	
--------- TB	
-- gen_TB : process
	-- begin
	 -- TBactive <= '1';
	 -- wait for 1700 ns;  
	 -- TBactive <= '0';
	 -- wait until tb_done = '1';  
	 -- TBactive <= '1';	
	-- end process;	
TB_active_1 : process
	begin
	 TBactive <= '1';
	 wait until donePmemIn and doneDmemIn;  
	 TBactive <= '0';
	 wait until done = '1';  
	 TBactive <= '1';	
	end process;	
	
--------- Reading from text file and initializing the data memory data--------------
LoadDataMem:process 
	file inDmemfile : text open read_mode is dataMemLocation;
	variable    linetomem			: std_logic_vector(bus_size-1 downto 0);
	variable	good				: boolean;
	variable 	L 					: line;
	variable	TempAddresses		: std_logic_vector(Awidth-1 downto 0) ; 
begin 
	doneDmemIn <= false;
	TempAddresses := (others => '0');
	while not endfile(inDmemfile) loop
		readline(inDmemfile,L);
		hread(L,linetomem,good);
		next when not good;
		TB_Data_wren <= '1';
		TB_Data_writeAddr <= TempAddresses;
		TB_DataMem_Data_in <= linetomem;
		wait until rising_edge(clk);
		TempAddresses := TempAddresses +1;
	end loop ;
	TB_Data_wren <= '0';
	doneDmemIn <= true;
	file_close(inDmemfile);
	wait;
end process;
	
	
--------- Reading from text file and initializing the program memory instructions	
LoadProgramMem:process 
	file inPmemfile : text open read_mode is progMemLocation;
	variable    linetomem			: std_logic_vector(bus_size-1 downto 0);
	variable	good				: boolean;
	variable 	L 					: line;
	variable	TempAddresses		: std_logic_vector(Awidth-1 downto 0) ; -- Awidth
begin 
	donePmemIn <= false;
	TempAddresses := (others => '0');
	while not endfile(inPmemfile) loop
		readline(inPmemfile,L);
		hread(L,linetomem,good);
		next when not good;
		Prog_wren <= '1';	
		ProgMem_writeAddr <= TempAddresses;
		ProgMem_Data_in <= linetomem;
		wait until rising_edge(clk);
		TempAddresses := TempAddresses +1;
	end loop ;
	Prog_wren <= '0';
	donePmemIn <= true;
	file_close(inPmemfile);
	wait;
end process;


	--------- Writing from Data memory to external text file, after the program ends (tb_done = 1).
	
	WriteToDataMem:process 
		file outDmemfile : text open write_mode is dataMemResult;
		variable    linetomem			: STD_LOGIC_VECTOR(bus_size-1 downto 0);
		variable	good				: BOOLEAN;
		variable 	L 					: LINE;
		variable	TempAddresses		: STD_LOGIC_VECTOR(Awidth-1 downto 0) ; 
		variable 	counter				: INTEGER;
	begin 

		--wait until tb_done = '1'; 
		wait for 6500 ns;
		TempAddresses := (others => '0');
		counter := 1;
		while counter < 16 loop	--15 lines in file
			TB_Data_readAddr <= TempAddresses;
			wait until rising_edge(clk);   
			wait until rising_edge(clk); 
			linetomem := DataMem_Data_out;   
			hwrite(L,linetomem);
			writeline(outDmemfile,L);
			TempAddresses := TempAddresses +1;
			counter := counter +1;
		end loop ;
		file_close(outDmemfile);
		wait;
	end process;


--------- Start Test Bench ---------------------
StartTb : process
	begin
	
		wait until donePmemIn and doneDmemIn;  

------------- Reset ------------------------		
	 --reset
		wait until rising_edge(clk);
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '0';
			PCin <= '1'; -- resets PC
			PCsel <= "11";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '1';
---------------------- Instruction For Load - D104-----------------------------		
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst1
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1'; -- REG-C <- R[rb] + Imm2
			OPC <= "0000"; -- add opcode
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '1';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst2
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0'; -- ld case included
			cout <= '1'; -- Data Memory <- address (ALU result)
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst3
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '1';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '1';
			RFout <= '0';
			RFaddr <= "01"; -- R[ra]
			IRin <= '0';
			PCin <= '1'; -- update PC
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

-----------------------------------------------------------------------------
---------------------- Instruction For Load - D205-----------------------------	
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst1
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1'; -- REG-C <- R[rb] + Imm2
			OPC <= "0000"; -- add opcode
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '1';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst2
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0'; -- ld case included
			cout <= '1'; -- Data Memory <- address (ALU result)
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst3
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '1';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '1';
			RFout <= '0';
			RFaddr <= "01"; -- R[ra]
			IRin <= '0';
			PCin <= '1'; -- update PC
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

-------------------------------------------------------------------------------
---------------------- Instruction For mov - C31F-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- mov  ------------------------
-- Itype_mov
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '1'; -- R[ra] <- Imm1
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1';
			PCsel <= "01"; --PC <- PC+1
			Imm1_in <= '1';
			Imm2_in <= '0';
			tb_done <= '0';

-------------------------------------------------------------------------------
---------------------- Instruction For mov - C401-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- mov  ------------------------
-- Itype_mov
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '1'; -- R[ra] <- Imm1
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1';
			PCsel <= "01"; --PC <- PC+1
			Imm1_in <= '1';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For mov - C50E-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- mov  ------------------------
-- Itype_mov
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '1'; -- R[ra] <- Imm1
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1';
			PCsel <= "01"; --PC <- PC+1
			Imm1_in <= '1';
			Imm2_in <= '0';
			tb_done <= '0';

-------------------------------------------------------------------------------
---------------------- Instruction For and - 2113-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- and  ------------------------
-- Rtype1
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1';
			OPC <= "0010"; -- opcode and
			Ain <= '0';
			RFin <= '0';
			RFout <= '1'; -- ALU-B <- R[rc]
			RFaddr <= "11";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- and  ------------------------
-- Rtype2
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '1'; -- BUS <- ALU operation result
			cin <= '0';
			OPC <= "0101"; -- unused opcode
			Ain <= '0';
			RFin <= '1'; -- R[ra <- result
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1'; -- next opcode
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For and - 2223-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- and  ------------------------
-- Rtype1
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1';
			OPC <= "0010"; -- opcode and
			Ain <= '0';
			RFin <= '0';
			RFout <= '1'; -- ALU-B <- R[rc]
			RFaddr <= "11";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- and  ------------------------
-- Rtype2
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '1'; -- BUS <- ALU operation result
			cin <= '0';
			OPC <= "0101"; -- unused opcode
			Ain <= '0';
			RFin <= '1'; -- R[ra <- result
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1'; -- next opcode
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For sub - 1621-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- sub  ------------------------
-- Rtype1
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1';
			OPC <= "0001"; -- opcode sub
			Ain <= '0';
			RFin <= '0';
			RFout <= '1'; -- ALU-B <- R[rc]
			RFaddr <= "11";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- sub  ------------------------
-- Rtype2
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '1'; -- BUS <- ALU operation result
			cin <= '0';
			OPC <= "0101"; -- unused opcode
			Ain <= '0';
			RFin <= '1'; -- R[ra <- result
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1'; -- next opcode
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For jc - 8002-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- jc  ------------------------
-- Jtype
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '1';
			PCsel <= "01"; -- unsucessful jump
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
-------------------------------------------------------------------------------
---------------------- Instruction For Add - 0640-----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- add  ------------------------
-- Rtype1
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1';
			OPC <= "0000"; -- opcode add
			Ain <= '0';
			RFin <= '0';
			RFout <= '1'; -- ALU-B <- R[rc]
			RFaddr <= "11";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- add  ------------------------
-- Rtype2
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '1'; -- BUS <- ALU operation result
			cin <= '0';
			OPC <= "0101"; -- unused opcode
			Ain <= '0';
			RFin <= '1'; -- R[ra <- result
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1'; -- next opcode
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For jmp - 7001 -----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- jump  ------------------------
-- Jtype
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '1';
			PCsel <= "10"; -- jump
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Add - 0600 -----------------------------
------------- Fetch ------------------------
		
		-- wait until rising_edge(clk); 
			-- Mem_wr <= '0';
			-- Mem_out <= '0';
			-- Mem_in <= '0';
			-- cout <= '0';
			-- cin <= '0';
			-- OPC <= "0101"; -- opcode not in use
			-- Ain <= '0';
			-- RFin <= '0';
			-- RFout <= '0';
			-- RFaddr <= "00";
			-- IRin <= '1';
			-- PCin <= '0';
			-- PCsel <= "00";
			-- Imm1_in <= '0';
			-- Imm2_in <= '0';
			-- tb_done <= '0';
----------- Decode ------------------------	
    	-- wait until rising_edge(clk); 
		
			-- Mem_wr <= '0';
			-- Mem_out <= '0';
			-- Mem_in <= '0';
			-- cout <= '0';
			-- cin <= '0';
			-- OPC <= "0101"; -- opcode not in use
			-- Ain <= '1';
			-- RFin <= '0';
			-- RFout <= '1'; -- REG-A <- R[rb]
			-- RFaddr <= "10";
			-- IRin <= '0';
			-- PCin <= '0';
			-- PCsel <= "00";
			-- Imm1_in <= '0';
			-- Imm2_in <= '0';
			-- tb_done <= '0';

----------- add  ------------------------
--Rtype1
		-- wait until rising_edge(clk); 		
			-- Mem_wr <= '0';
			-- Mem_out <= '0';
			-- Mem_in <= '0';
			-- cout <= '0';
			-- cin <= '1';
			-- OPC <= "0000"; -- opcode add
			-- Ain <= '0';
			-- RFin <= '0';
			-- RFout <= '1'; -- ALU-B <- R[rc]
			-- RFaddr <= "11";
			-- IRin <= '0';
			-- PCin <= '0';
			-- PCsel <= "00";
			-- Imm1_in <= '0';
			-- Imm2_in <= '0';
			-- tb_done <= '0';
----------- add  ------------------------
--Rtype2
		-- wait until rising_edge(clk); 		
			-- Mem_wr <= '0';
			-- Mem_out <= '0';
			-- Mem_in <= '0';
			-- cout <= '1'; -- BUS <- ALU operation result
			-- cin <= '0';
			-- OPC <= "0101"; -- unused opcode
			-- Ain <= '0';
			-- RFin <= '1'; -- R[ra <- result
			-- RFout <= '0';
			-- RFaddr <= "01"; -- choose R[ra]
			-- IRin <= '0';
			-- PCin <= '1'; -- next opcode
			-- PCsel <= "01"; -- PC <- PC+1
			-- Imm1_in <= '0';
			-- Imm2_in <= '0';
			-- tb_done <= '0';	
			
-------------------------------------------------------------------------------			
---------------------- Instruction For st - E650-----------------------------		
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Decode ------------------------	
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- st  ------------------------
-- Itype_ldst1
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1'; -- REG-C <- R[rb] + Imm2
			OPC <= "0000"; -- add opcode
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '1';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst2
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '1'; -- st case included
			cout <= '1'; -- Data Memory <- address (ALU result)
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Load  ------------------------
-- Itype_ldst3
		wait until rising_edge(clk); 
			Mem_wr <= '1';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0000"; -- don't care
			Ain <= '0';
			RFin <= '0';
			RFout <= '1';
			RFaddr <= "01"; -- R[ra]
			IRin <= '0';
			PCin <= '1'; -- update PC
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
-------------------------------------------------------------------------------			
---------------------- Instruction For done - F000 -----------------------------		
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- Decode ------------------------	
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- reset ------------------------

		wait until rising_edge(clk);
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '0';
			PCin <= '1'; -- resets PC
			PCsel <= "11";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '1';
-------------------------------------------------------------------------------
---------------------- Instruction For nop - 0000 -----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- nop  ------------------------
-- Rtype1
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '1';
			OPC <= "0000"; -- opcode add
			Ain <= '0';
			RFin <= '0';
			RFout <= '1'; -- ALU-B <- R[rc]
			RFaddr <= "11";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
------------- nop  ------------------------
-- Rtype2
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '1'; -- BUS <- ALU operation result
			cin <= '0';
			OPC <= "0101"; -- unused opcode
			Ain <= '0';
			RFin <= '1'; -- R[ra <- result
			RFout <= '0';
			RFaddr <= "01"; -- choose R[ra]
			IRin <= '0';
			PCin <= '1'; -- next opcode
			PCsel <= "01"; -- PC <- PC+1
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
-------------------------------------------------------------------------------
---------------------- Instruction For jmp - 70FE -----------------------------
------------- Fetch ------------------------
		
		wait until rising_edge(clk); 
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "00";
			IRin <= '1';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
------------- Decode ------------------------	
    	wait until rising_edge(clk); 
		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '1';
			RFin <= '0';
			RFout <= '1'; -- REG-A <- R[rb]
			RFaddr <= "10";
			IRin <= '0';
			PCin <= '0';
			PCsel <= "00";
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';

------------- jc  ------------------------
-- Jtype
		wait until rising_edge(clk); 		
			Mem_wr <= '0';
			Mem_out <= '0';
			Mem_in <= '0';
			cout <= '0';
			cin <= '0';
			OPC <= "0101"; -- opcode not in use
			Ain <= '0';
			RFin <= '0';
			RFout <= '0';
			RFaddr <= "10"; -- don't care
			IRin <= '0';
			PCin <= '1';
			PCsel <= "10"; -- jump
			Imm1_in <= '0';
			Imm2_in <= '0';
			tb_done <= '0';
			
--------------------------------------------------------------
--------------------------------------------------------------
--------------------------------------------------------------

end process;	
end dfl;