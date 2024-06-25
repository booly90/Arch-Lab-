library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;

--
--------------------------------------------------------------
entity datapath is
generic( Dwidth: integer:=16;	-- Bus Size
		 RFAddrWidth: integer:=4; 	-- Register Size
		 m: 	  integer:=16;  -- Program Memory In Data Size
		 Awidth:  integer:=6;  	-- Address Size
		 OffsetSize 	: integer := 8;
		 ImmidSize	: integer := 8;		 
		 dept:    integer:=64;
		 prog_data_size : integer := 16;
		 prog_addr_size : integer := 6
		); 
	port(clk, rst: in std_logic;
		-- inputs from control unit
		Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in : in std_logic;
		OPC : in std_logic_vector(3 downto 0);
		RFaddr, PCsel : in std_logic_vector(1 downto 0);
		 -- inputs from tb
		 -- PROGRAM
		Prog_wren : in std_logic; -- enable bit
		ProgMem_Data_in : in std_logic_vector(prog_data_size-1 downto 0);
		ProgMem_writeAddr : in std_logic_vector(prog_addr_size-1 downto 0);
		-- DATA
		TB_Data_wren, TBactive: in std_logic := '0';
		TB_DataMem_Data_in: in std_logic_vector(RFAddrWidth-1 downto 0);
		TB_Data_writeAddr, TB_Data_readAddr : in std_logic_vector(prog_addr_size-1 downto 0);
		
		 -- outputs to control unit
		mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st : out std_logic; -- out from OPCdecoder
		Nflag, Zflag, Cflag : out std_logic := '0'; -- out from ALU
		-- outputs to tb, DATA
		DataMem_Data_out : out std_logic_vector(RFAddrWidth-1 downto 0)
);

end Datapath;
--------------------------------------------------------------
architecture behav of Datapath is
    subtype bus_wire IS std_logic_vector(Dwidth-1 DOWNTO 0);
    
    --main board
    signal main_BUS : bus_wire;
    signal Imm_1, Imm_2 : bus_wire;
    
    --RF Signals
    signal RF2Bus, Bus2RF : bus_wire;
    
    --IR unit
    signal Immid_1,Immid_2 : bus_wire;
    signal IR2RF           : std_logic_vector(3 downto 0) := (others => '0');
    signal offset          : std_logic_vector(7 downto 0) := (others => '0');
    signal IR_OPC          : std_logic_vector(3 downto 0) := (others => '0');
    
    --ALU unit
    signal A, B, C : bus_wire;
    
    --Data Memory unit
    signal DataMem2Bus : std_logic_vector(Dwidth-1 downto 0) := (others => '0');
    alias Bus2Data_readAddr is main_BUS(prog_addr_size-1 downto 0);
    alias Bus2Data_writeAddr is main_BUS(prog_addr_size-1 downto 0);
    signal Data_wren : std_logic := '0';
    signal DataMem_Data_in: std_logic_vector(m-1 downto 0) := (others => '0');
    signal Data_writeAddr, Data_readAddr, FF2writeAddr : std_logic_vector(prog_addr_size-1 downto 0) := (others => '0');
    
    --Program Memory unit
    signal ProgMem_readAddr : std_logic_vector(prog_addr_size-1 downto 0) := (others => '0');
    signal ProgMem_DataOut : std_logic_vector(prog_data_size-1 downto 0) := (others => '0');
begin
    IR_unit : IR generic map (Dwidth)  port map(ProgMem_DataOut, IRin, RFaddr, IR2RF, IR_OPC, Imm_1, Imm_2, offset);
    RF_unit : RF generic map (Dwidth, RFAddrWidth) port map(clk, rst, RFin, Bus2RF, IR2RF, IR2RF, RF2Bus);
    OPCdecoder_unit : OPCdecode port map (IR_OPC, mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st);
    ALU_Module : ALU_UNIT generic map (Dwidth) port map(A, B, OPC, Cflag, Zflag, Nflag, C, Ain, Cout, clk ,Cin);
    ProgMem_unit : progMem generic map (prog_data_size, prog_addr_size, dept) port map(clk, Prog_wren, ProgMem_Data_in, ProgMem_writeAddr, ProgMem_readAddr, ProgMem_DataOut);
    PC_unit : PC_wrap generic map (Dwidth, prog_addr_size) port map(clk, offset,ProgMem_readAddr,PCin, PCsel);
    DataMem_Module : dataMem generic map (Dwidth, prog_addr_size, dept) port map(clk, Data_wren, DataMem_Data_in, Data_writeAddr, Data_readAddr, DataMem2Bus);
    
    --Outputs
    DataMem_Data_out <= DataMem2Bus;
    
    --MUXES
    process(TBactive, Mem_wr, main_BUS, Bus2Data_readAddr, FF2writeAddr, TB_Data_wren, TB_DataMem_Data_in, TB_Data_readAddr, TB_Data_writeAddr)
    begin
        if TBactive = '1' then
            Data_wren <= TB_Data_wren;
            DataMem_Data_in <= TB_DataMem_Data_in;
            Data_readAddr <= TB_Data_readAddr;
            Data_writeAddr <= TB_Data_writeAddr;
        else
            Data_wren <= Mem_wr;
            DataMem_Data_in <= main_BUS;
            Data_readAddr <= Bus2Data_readAddr;
            Data_writeAddr <= FF2writeAddr;
        end if;
    end process;
    
    writeAddr: process(Mem_in)
        begin
            if(falling_edge(Mem_in)) then
                    FF2writeAddr <= Bus2Data_writeAddr;
            end if;
        end process;
    
    
    --bidirpins
    Bus_Cout:       BidirPin        generic map(Dwidth) port map(C, Cout, B, main_BUS);
    Bus_RF_out:     BidirPin        generic map(Dwidth) port map(RF2Bus, RFout, Bus2RF, main_BUS);
    Bus_Mem_out:    BidirPin        generic map(Dwidth) port map(DataMem2Bus, Mem_out, Bus2RF, main_BUS);
    Bus_Imm1_in:    BidirPin        generic map(Dwidth) port map(Imm_1, Imm1_in, Bus2RF, main_BUS);
    Bus_Imm2_in:    BidirPin        generic map(Dwidth) port map(Imm_2, Imm2_in, B, main_BUS);
    
    process(clk)
    begin
        if rising_edge(clk) then
            report "****Datapath Debug Section******" &
                   LF & "time =      " & to_string(now) &
                   LF & "A =     " & to_string(A) &
                   LF & "B =         " & to_string(B) &
                   LF & "C =  " & to_string(C) &
                   LF & "Cflag =     " & to_string(CFlag) &
                   LF & "Nflag =     " & to_string(NFlag) &
                   LF & "Zflag =     " & to_string(ZFlag) &
                   LF & "OPC =       " & to_string(OPC) &
                   LF & "FULL INSTRUCTION = " & to_hstring(ProgMem_DataOut) &
                   LF & "*****************" &
                   LF & "IR2RF =              " & to_string(IR2RF) &
                   LF & "Bus2RF =  " & to_string(Bus2RF) &
                   LF & "RF2Bus = " & to_string(RF2Bus) &
                   LF & "Data_readAddr = " & to_string(Data_readAddr) &
                   LF & "DataMem2Bus = " & to_string(DataMem2Bus) &
                   LF & "TBactive = " & to_string(TBactive) &
                   LF & "main_BUS =           " & to_string(main_BUS) &
                   LF & "Bus2Data_readAddr = " & to_string(Bus2Data_readAddr) &
                   LF & "Bus2Data_writeAddr = " & to_string(Bus2Data_writeAddr) &
                   LF & "FF2writeAddr =     " & to_string(FF2writeAddr) &
                   LF & "****** Status *********" &
                   LF & "Mem_wr =    " & to_string(Mem_wr) &
                   LF & "Mem_in =    " & to_string(Mem_in) &
                   LF & "Mem_out =   " & to_string(Mem_out) &
                   LF & "Cout =      " & to_string(Cout) &
                   LF & "Cin =       " & to_string(Cin) &
                   LF & "OPC =       " & to_string(OPC) &
                   LF & "Ain =       " & to_string(Ain) &
                   LF & "RFin =      " & to_string(RFin) &
                   LF & "RFout =     " & to_string(RFout) &
                   LF & "RFaddr =    " & to_string(RFaddr) &
                   LF & "IRin =      " & to_string(IRin) &
                   LF & "PCin =      " & to_string(PCin) &
                   LF & "PCsel =     " & to_string(PCsel) &
                   LF & "Imm1_in =   " & to_string(Imm1_in) &
                   LF & "Imm2_in =   " & to_string(Imm2_in);
                   -- & LF & "st =        " & to_string(store);
            assert not(st)
            report "I AM IN STORE OPCODE"
            severity note;
        end if;
    end process;
end behav;
