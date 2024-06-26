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
signal tb_done : std_logic;

-- reading from files flags
signal donePmemIn, doneDmemIn: BOOLEAN;
constant lab3path:		string (1 to 48) :=
"C:\Users\barmu\Documents\GitHub\Arch-Lab-\lab 3\";
constant dataMemResult:	 	string(1 to 95) :=
lab3path & "Lab 3 - submission\memory files\DTCMcontent.txt";

constant dataMemLocation: 	string(1 to 92) :=
lab3path & "Lab 3 - submission\memory files\DTCMinit.txt";

constant progMemLocation: 	string(1 to 92) :=
lab3path & "Lab 3 - submission\memory files\ITCMinit.txt";

--constant dataMemResult: string(1 to 101) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\DTCMcontent.txt"; -- our url
--constant dataMemLocation: string(1 to 98) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\DTCMinit.txt";-- our url
--constant progMemLocation: string(1 to 98) := "C:\Users\user\Documents\GitHub\Arch-Lab-\lab 3\Lab 3 - submission\TB_RESAULT\DATAPATH\ITCMinit.txt";-- our url

begin 

DataPathUnit: datapath
    generic map(bus_size, RFAddrWidth, Awidth, OffsetSize, ImmidSize, dept, prog_data_size, prog_addr_size)
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
    wait until done = '1';
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

-- Writing from Data memory to external text file, after the program ends (tb_done = 1)
WriteToDataMem: process
    file outDmemfile : text open write_mode is dataMemResult;
    variable linetomem: std_logic_vector(bus_size-1 downto 0);
    variable good: boolean;
    variable L: line;
    variable TempAddresses: std_logic_vector(Awidth-1 downto 0); 
    variable counter: integer;
begin 
    wait for 6500 ns;
    TempAddresses := (others => '0');
    counter := 1;
    while counter < 16 loop -- 15 lines in file
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

-- Start Test Bench
StartTb: process
begin
    wait until donePmemIn and doneDmemIn;  

    -- Reset
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

    -- Sample instructions, update based on your specific instruction set
    -- Example: Load Instruction D104
    -- Fetch
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

    -- Decode
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
    
    -- Add more instructions following the same pattern as needed for your test

end process;

end dfl;
