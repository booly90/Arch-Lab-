library ieee;
use ieee.std_logic_1164.all;
use work.aux_package.all;
---------------------------------------------------------------
ENTITY top IS
	generic( BusSize: integer:=16;	-- Data Memory In Data Size
		 m: 	  integer:=16;  -- Program Memory In Data Size
		 Awidth:  integer:=6;
		 RegSize:  integer:=4);  	-- Address Size
	PORT(
		clk, rst, ena  : in STD_LOGIC;
		done_FSM : out std_logic;	
		
		-- Test Bench
		TBdataInProgMem  : in std_logic_vector(m-1 downto 0);
		TBdataInDataMem  : in std_logic_vector(BusSize-1 downto 0);
		TBdataOutDataMem : out std_logic_vector(BusSize-1 downto 0);
		TBactive	   : in std_logic;
		TBWrEnProgMem, TBWrEnDataMem : in std_logic;
		TBWrAddrProgMem, TBWrAddrDataMem, TBRdAddrDataMem :	in std_logic_vector(Awidth-1 downto 0)
	);
END top;
---------------------------------------------------------------
ARCHITECTURE behav OF top IS

signal		st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, Cflag, Zflag, Nflag:  std_logic;
signal		IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in :  std_logic;
signal		OPC :  std_logic_vector(3 downto 0);
signal 		PCsel, RFaddr :  std_logic_vector(1 downto 0);
signal 		DebugSignal:	std_logic_vector(BusSize-1 downto 0);

BEGIN
------------ Debug
process(clk)
    begin
		if rising_edge(clk) then
		--	report "*********New Time Section*****************";
		--	report "time = " & to_string(now)
		--	& LF &  "Mem_wr	= "& to_string(Mem_wr)
		--	& LF &  "Cout	 	= "& to_string(Cout) 
		--	& LF &  "Cin	 	= "& to_string(Cin) 
		--	& LF &  "OPC	 	= "& to_string(OPC) 
		--	& LF &  "Ain	 	= "& to_string(Ain) 
		--	& LF &  "RFin	 	= "& to_string(RFin) 
		--	& LF &  "RFout	= "& to_string(RFout) 
		--	& LF &  "RFaddr 	= "& to_string(RFaddr) 
		--	& LF &  "IRin	 	= "& to_string(IRin)  
		--	& LF &  "PCin	 	= "& to_string(PCin) 
		--	& LF &  "PCsel	= "& to_string(PCsel) 
		--	& LF &  "Imm1_in	= "& to_string(Imm1_in) 
		--	& LF &  "Imm2_in	= "& to_string(Imm2_in) 
		--	& LF &  "Mem_out	= "& to_string(Mem_out) 
		--	& LF &  "done_FSM = "& to_string(done_FSM) 
		--	& LF &"**********End Section**************";
		end if;
end process;


ControlUnit: Control 	port map(st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, Cflag, Zflag, Nflag,
								IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in,
								OPC, PCsel, RFaddr,
								clk, rst, ena, done_FSM
								);

DataPathUnit: Datapath generic map(BusSize)  port map(st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, Cflag, Zflag, Nflag, 
													IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in,
													OPC, PCsel, RFaddr,
													TBactive, clk, rst, 
													TBWrEnProgMem, TBWrEnDataMem,
													TBdataInProgMem, TBdataInDataMem, TBWrAddrProgMem, TBWrAddrDataMem, TBRdAddrDataMem,
													TBdataOutDataMem, DebugSignal);
								

end behav;
