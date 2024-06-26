library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity tb is
    generic(bus_size : integer := 16;
            prog_data_size : integer := 16;
            prog_addr_size : integer := 6;
            data_data_size : integer := 16;
            data_addr_size : integer := 6;
			RFAddrWidth: integer:=4; 	-- Register Size
		    OffsetSize 	: integer := 8;
			ImmidSize	: integer := 8;	
            Awidth : integer := 6;
            dept: integer := 64);
end tb;

architecture dfl of tb is

signal clk, rst : std_logic;
-- inputs from control unit
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
signal mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st, Nflag, Zflag, Cflag: std_logic;
-- output to tb
signal DataMem_Data_out : std_logic_vector(data_data_size-1 downto 0);
signal done_TB : std_logic;

-- reading from files flags
signal donePmemIn, doneDmemIn: BOOLEAN;

-- for yarden's PC
constant lab3path:		string (1 to 48) :=              
"C:\Users\barmu\Documents\GitHub\Arch-Lab-\lab 3\";

---- for Hadar's PC
--constant lab3path:		string (1 to 48) :=              
--"C:\Users\barmu\Documents\GitHub\Arch-Lab-\lab 3\";

constant dataMemResult:	 	string(1 to 95) :=
lab3path & "Lab 3 - submission\memory files\DTCMcontent.txt";

constant dataMemLocation: 	string(1 to 92) :=
lab3path & "Lab 3 - submission\memory files\DTCMinit.txt";

constant progMemLocation: 	string(1 to 100) :=
lab3path & "Lab 3 - submission\memory files\ITCMinitDatapath.txt";

--constant dataMemResult: string(1 to 101) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\DTCMcontent.txt"; -- our url
--constant dataMemLocation: string(1 to 98) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\DTCMinit.txt";-- our url
--constant progMemLocation: string(1 to 98) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\ITCMinit.txt";-- our url

begin 

DataPathUnit: datapath
    generic map(bus_size, RFAddrWidth, OffsetSize, ImmidSize, dept, prog_data_size, prog_addr_size)
    port map(clk, rst, Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in, OPC, RFaddr, PCsel, Prog_wren, ProgMem_Data_in, ProgMem_writeAddr, TB_Data_wren, TBactive, TB_DataMem_Data_in, TB_Data_writeAddr, TB_Data_readAddr, mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st, Nflag, Zflag, Cflag, DataMem_Data_out);

-- Clock generation
gen_clk : process
begin
    clk <= '0';
    wait for 50 ns;
    clk <= not clk;
    wait for 50 ns;
end process;

-- Reset generation
gen_rst : process
begin
    rst <= '1';
    wait for 100 ns;
    rst <= '0';
    wait;
end process;

-- Testbench activation
TB_active_1 : process
begin
    TBactive <= '1';
    wait until donePmemIn and doneDmemIn;
    TBactive <= '0';
    wait until done_TB = '1';
    TBactive <= '1';
end process;

-- Reading from text file and initializing the data memory data
LoadDataMem: process
    file inDmemfile : text open read_mode is dataMemLocation;
    variable linetomem: std_logic_vector(bus_size-1 downto 0);
    variable good: boolean;
    variable L: line;
    variable TempAddresses: std_logic_vector(Awidth-1 downto 0); 
begin
    doneDmemIn <= false;
    TempAddresses := (others => '0');
    while not endfile(inDmemfile) loop
        readline(inDmemfile, L);
        hread(L, linetomem, good);
        next when not good;
        TB_Data_wren <= '1';
        TB_Data_writeAddr <= TempAddresses;
        TB_DataMem_Data_in <= linetomem;
        wait until rising_edge(clk);
        TempAddresses := TempAddresses + 1;
    end loop;
    TB_Data_wren <= '0';
    doneDmemIn <= true;
    file_close(inDmemfile);
    wait;
end process;

-- Reading from text file and initializing the program memory instructions
LoadProgramMem: process
    file inPmemfile : text open read_mode is progMemLocation;
    variable linetomem: std_logic_vector(bus_size-1 downto 0);
    variable good: boolean;
    variable L: line;
    variable TempAddresses: std_logic_vector(Awidth-1 downto 0); 
begin
    donePmemIn <= false;
    TempAddresses := (others => '0');
    while not endfile(inPmemfile) loop
        readline(inPmemfile, L);
        hread(L, linetomem, good);
        next when not good;
        Prog_wren <= '1';    
        ProgMem_writeAddr <= TempAddresses;
        ProgMem_Data_in <= linetomem;
        wait until rising_edge(clk);
        TempAddresses := TempAddresses + 1;
    end loop;
    Prog_wren <= '0';
    donePmemIn <= true;
    file_close(inPmemfile);
    wait;
end process;

-- Writing from Data memory to external text file, after the program ends (done_TB = 1)
WriteToDataMem: process
    file outDmemfile : text open write_mode is dataMemResult;
    variable linetomem: std_logic_vector(bus_size-1 downto 0);
    variable good: boolean;
    variable L: line;
    variable TempAddresses: std_logic_vector(Awidth-1 downto 0); 
    variable counter: integer;
begin 
    wait until done_TB = '1';
    TempAddresses := (others => '0');
    counter := 0;
    while counter < 11 loop -- 11 lines in file
        TB_Data_readAddr <= TempAddresses;
        wait until rising_edge(clk);   
        wait until rising_edge(clk); 
        linetomem := DataMem_Data_out;   
        hwrite(L, linetomem);
        writeline(outDmemfile, L);
        TempAddresses := TempAddresses + 1;
        counter := counter + 1;
    end loop;
    file_close(outDmemfile);
    wait;
end process;


--------- Start Test Bench ---------------------
StartTb : process
	begin
	
		wait until donePmemIn and doneDmemIn;  

------------- Reset ------------------------		
	 --reset
		wait until clk'EVENT and clk='1';
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; -- ALU unaffected
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "00";   -- RF unaffected
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "11";  -- PC = zeros 
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
---------------------- Instruction For Load - D202-----------------------------		
------------- Fetch ------------------------
		
		wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01"; 
		PCsel	 <= "01";		
		IRin 	 <= '0';
		PCin	 <= '0';	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Load  ------------------------
-- Istate0
		wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0'; 
		Cin	 	 <= '1';
		OPC	 	 <= "0000"; 	
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "10";  		 
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '1';
		Mem_out	 <= '0';			
		done_TB  <= '0';
		Mem_in	 <= '1';
------------- Load  ------------------------
-- Istate1
		wait until clk'EVENT and clk='1'; 
		
		Cout	 <= '1'; 
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';				
		done_TB  <= '0';
		Mem_out	 <= '0';  
		RFin	 <= '0'; 
		RFout	 <= '0'; 
		Mem_wr	 <= '0';
		Mem_in	 <= '0';
------------- Load  ------------------------
-- Istate2
		wait until clk'EVENT and clk='1'; 
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';	
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
		Mem_wr	 <= '0'; 
		Mem_out	 <= '1';  
		RFin	 <= '1';
		RFout 	 <= '0';
-----------------------------------------------------------------------------
---------------------- Instruction For Load - D303-----------------------------	
------------- Fetch ------------------------		
		wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01"; 
		PCsel	 <= "01";		
		IRin 	 <= '0';
		PCin	 <= '0';	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				

------------- Load  ------------------------
-- Istate0
		wait until clk'EVENT and clk='1'; 
		
		Mem_wr	 <= '0';
		Cout	 <= '0'; 
		Cin	 	 <= '1';
		OPC	 	 <= "0000"; 	
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "10";  		 
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '1';
		Mem_out	 <= '0';			
		done_TB  <= '0';
		Mem_in	 <= '1';
------------- Load  ------------------------
-- Istate1
		wait until clk'EVENT and clk='1'; 
		
		Cout	 <= '1'; 
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';				
		done_TB  <= '0';
		Mem_out	 <= '0';  
		RFin	 <= '0'; 
		RFout	 <= '0'; 
		Mem_wr	 <= '0';
		Mem_in	 <= '0';
------------- Load  ------------------------
-- Istate2
		wait until clk'EVENT and clk='1'; 
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';	
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
		Mem_wr	 <= '0'; 
		Mem_out	 <= '1';  
		RFin	 <= '1';
		RFout 	 <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Load - D404-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01"; 
		PCsel	 <= "01";		
		IRin 	 <= '0';
		PCin	 <= '0';	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				

------------- Load  ------------------------
-- Istate0
		wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0'; 
		Cin	 	 <= '1';
		OPC	 	 <= "0000"; 	
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "10";  		 
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '1';
		Mem_out	 <= '0';			
		done_TB  <= '0';
		Mem_in	 <= '1';
------------- Load  ------------------------
-- Istate1
		wait until clk'EVENT and clk='1'; 		
		Cout	 <= '1'; 
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';				
		done_TB  <= '0';
		Mem_out	 <= '0';  
		RFin	 <= '0'; 
		RFout	 <= '0'; 
		Mem_wr	 <= '0';
		Mem_in	 <= '0';
------------- Load  ------------------------
-- Istate2
		wait until clk'EVENT and clk='1'; 
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';	
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
		Mem_wr	 <= '0'; 
		Mem_out	 <= '1';  
		RFin	 <= '1';
		RFout 	 <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Load - D505-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01"; 
		PCsel	 <= "01";		
		IRin 	 <= '0';
		PCin	 <= '0';	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				

------------- Load  ------------------------
-- Istate0
		wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0'; 
		Cin	 	 <= '1';
		OPC	 	 <= "0000"; 	
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "10";  		 
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '1';
		Mem_out	 <= '0';			
		done_TB  <= '0';
		Mem_in	 <= '1';
------------- Load  ------------------------
-- Istate1
		wait until clk'EVENT and clk='1'; 		
		Cout	 <= '1'; 
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';				
		done_TB  <= '0';
		Mem_out	 <= '0';  
		RFin	 <= '0'; 
		RFout	 <= '0'; 
		Mem_wr	 <= '0';
		Mem_in	 <= '0';
------------- Load  ------------------------
-- Istate2
		wait until clk'EVENT and clk='1'; 
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';	
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
		Mem_wr	 <= '0'; 
		Mem_out	 <= '1';  
		RFin	 <= '1';
		RFout 	 <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Mov - C101 -----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode - Mov ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0'; 
		RFin	 <= '1';
		RFout	 <= '0';  
		RFaddr	 <= "10";  
		IRin 	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";				
		Imm1_in	 <= '1';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
-------------------------------------------------------------------------------
---------------------- Instruction For Add - 0223-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01";  
		IRin 	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";				
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Add -----------------------------	
--Rstate0
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
        Cout	 <= '0';
        Cin	 	 <= '1'; 
        Ain	 	 <= '0';
        RFin	 <= '0';
        RFout	 <= '1'; 
        RFaddr	 <= "00";
        IRin	 <= '0';
        PCin	 <= '0';
        PCsel	 <= "01";
        Imm1_in	 <= '0';
        Imm2_in	 <= '0';
        Mem_out	 <= '0';
        Mem_in	 <= '0';
        done_TB  <= '0';
		OPC <= "0000";
------------- Add -----------------------------	
--Rstate1
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
		Cout	 <= '1';  
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '1';
		RFout	 <= '0';
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For sub - 1342-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01";  
		IRin 	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";				
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Add -----------------------------	
--Rstate0
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
        Cout	 <= '0';
        Cin	 	 <= '1'; 
        Ain	 	 <= '0';
        RFin	 <= '0';
        RFout	 <= '1'; 
        RFaddr	 <= "00";
        IRin	 <= '0';
        PCin	 <= '0';
        PCsel	 <= "01";
        Imm1_in	 <= '0';
        Imm2_in	 <= '0';
        Mem_out	 <= '0';
        Mem_in	 <= '0';
        done_TB  <= '0';
		OPC <= "0000";
------------- Add -----------------------------	
--Rstate1
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
		Cout	 <= '1';  
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '1';
		RFout	 <= '0';
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For and - 2645-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01";  
		IRin 	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";				
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Sub -----------------------------	
--Rstate0
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
        Cout	 <= '0';
        Cin	 	 <= '1'; 
        Ain	 	 <= '0';
        RFin	 <= '0';
        RFout	 <= '1'; 
        RFaddr	 <= "00";
        IRin	 <= '0';
        PCin	 <= '0';
        PCsel	 <= "01";
        Imm1_in	 <= '0';
        Imm2_in	 <= '0';
        Mem_out	 <= '0';
        Mem_in	 <= '0';
        done_TB  <= '0';
		OPC 	 <= "0001";
------------- Sub -----------------------------	
--Rstate1
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
		Cout	 <= '1';  
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '1';
		RFout	 <= '0';
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Or - 3745 -----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01";  
		IRin 	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";				
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Add -----------------------------	
--Rstate0
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
        Cout	 <= '0';
        Cin	 	 <= '1'; 
        Ain	 	 <= '0';
        RFin	 <= '0';
        RFout	 <= '1'; 
        RFaddr	 <= "00";
        IRin	 <= '0';
        PCin	 <= '0';
        PCsel	 <= "01";
        Imm1_in	 <= '0';
        Imm2_in	 <= '0';
        Mem_out	 <= '0';
        Mem_in	 <= '0';
        done_TB  <= '0';
		OPC 	 <= "0000";
------------- Add -----------------------------	
--Rstate1
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
		Cout	 <= '1';  
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '1';
		RFout	 <= '0';
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

-------------------------------------------------------------------------------
---------------------- Instruction For Xor - 4845 -----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01";  
		IRin 	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";				
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				
------------- Add -----------------------------	
--Rstate0
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
        Cout	 <= '0';
        Cin	 	 <= '1'; 
        Ain	 	 <= '0';
        RFin	 <= '0';
        RFout	 <= '1'; 
        RFaddr	 <= "00";
        IRin	 <= '0';
        PCin	 <= '0';
        PCsel	 <= "01";
        Imm1_in	 <= '0';
        Imm2_in	 <= '0';
        Mem_out	 <= '0';
        Mem_in	 <= '0';
        done_TB  <= '0';
		OPC 	 <= "0000";
------------- Add -----------------------------	
--Rstate1
    	wait until clk'EVENT and clk='1'; 
		Mem_wr	 <= '0';
		Cout	 <= '1';  
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '1';
		RFout	 <= '0';
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
-------------------------------------------------------------------------------
---------------------- Instruction For Store - E70E-----------------------------
------------- Fetch ------------------------	
		wait until clk'EVENT and clk='1';		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "11";   
		IRin	 <= '1';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';

------------- Decode ------------------------	
    	wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '1'; 
		RFin	 <= '0';
		RFout	 <= '1';  
		RFaddr	 <= "01"; 
		PCsel	 <= "01";		
		IRin 	 <= '0';
		PCin	 <= '0';	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';				

------------- Store  ------------------------
-- Istate0
		wait until clk'EVENT and clk='1'; 		
		Mem_wr	 <= '0';
		Cout	 <= '0'; 
		Cin	 	 <= '1';
		OPC	 	 <= "0000"; 	
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "10";  		 
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '1';
		Mem_out	 <= '0';			
		done_TB  <= '0';
		Mem_in	 <= '0';
------------- Store  ------------------------
-- Istate1
		wait until clk'EVENT and clk='1'; 		
		Cout	 <= '1'; 
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '0';
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';				
		done_TB  <= '0';
		RFout	 <= '0'; 
		Mem_wr	 <= '0'; 
		RFin	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '1';  
------------- Store  ------------------------
-- Istate2
		wait until clk'EVENT and clk='1'; 
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; 
		Ain	 	 <= '0';				
		RFaddr	 <= "10";   
		IRin	 <= '0';
		PCin	 <= '1';	
		PCsel	 <= "01";	
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '0';
		Mem_out	 <= '0';	
		RFout	 <= '1'; 
		Mem_wr	 <= '1'; 
		RFin	 <= '0';

--******************************************************************

------------- End: emulates done TB ---------------------------------	
------------- Reset ------------------------		
		wait until clk'EVENT and clk='1';
		Mem_wr	 <= '0';
		Cout	 <= '0';
		Cin	 	 <= '0';
		OPC	 	 <= "0110"; -- ALU unaffected
		Ain	 	 <= '0';
		RFin	 <= '0';
		RFout	 <= '0';
		RFaddr	 <= "00";   -- RF unaffected
		IRin	 <= '0';
		PCin	 <= '1';
		PCsel	 <= "11";  -- PC = zeros 
		Imm1_in	 <= '0';
		Imm2_in	 <= '0';
		Mem_out	 <= '0';
		Mem_in	 <= '0';
		done_TB  <= '1';
		wait;
		
	end process;	
	
	
	


end dfl;
