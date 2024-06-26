LIBRARY ieee;
USE ieee.std_logic_1164.all;
use work.aux_package.all;
--------------------------------------------------------
entity top is
	generic(bus_size : integer := 16;
		Awidth: integer := 4;
		Prog_Data_size : integer := 16;
		Prog_Addr_size : integer := 6;
		data_size : integer := 16;
		data_addr_size : integer := 6;
		OffsetSize := 8;
		ImmidSize	: integer := 8;
		dept:   integer:=64);

	port (rst, clk, ena : in std_logic;
		--Output Signals
		  DataMem_Data_out :  in std_logic_vector(data_size-1 downto 0);
		  tb_done : out stf_logic;
		--Data Memory ports
		  Data_wren, TBactive : in std_logic; --TBactive is for the mux of testbench
		  DataMem_Data_in: in std_logic_vector(data_size-1 downto 0);
		  Data_writeAddr, Data_readAddr : in std_logic_vector(data_addr_size-1 downto 0);
		--Program Memory ports
		  ProgMem_wren : in std_logic;
		  ProgMem_DataIn: in std_logic_vector (Prog_Data_size-1 downto 0);
		  ProgMem_writeAddr : in std_logic_vector(prog_addr_size-1 downto 0);
end top;

architecture proccesor of top is
	signal OPC : std_logic_vector(3 downto 0);
	signal Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in : std_logic;
	signal RFaddr, PCsel : std_logic_vector(1 downto 0);
	signal mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st, Nflag, Zflag, Cflag : std_logic;

begin
	datapath_unit : datapath generic map (bus_size, Awidth,OffsetSize,ImmidSize, dept,Prog_Data_size, Prog_Addr_size);
					port map (clk, rst,Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in
							,OPC, RFaddr, PCsel, ProgMem_wren , ProgMem_DataIn, ProgMem_writeAddr,Data_wren, TBactive,
							DataMem_Data_in,Data_writeAddr, Data_readAddr,mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub,
							add, ld, st,Nflag, Zflag, Cflag,DataMem_Data_out);
							
	control : control_fsm generic map (bus_size,Awidth);
				port map(clk, ena, rst,mov,done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, Nflag, Zflag, Cflag, ld, st
						Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in,
						Ain, RFout,IRin, PCsel,RFaddr,OPC,tb_done);


						
	
end proccesor;