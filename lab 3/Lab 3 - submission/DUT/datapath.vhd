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
		 dept:    integer:=64); -- Program Memory Size
port(	
		-- Op Status Signals --
		st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, CFlag, ZFlag, NFlag : out std_logic;	
		-- st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, CFlag, ZFlag, NFlag, neg, jz : out std_logic; -- Real time 
		-- Control Signals --
		IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in : in std_logic;
		OPC : in std_logic_vector(3 downto 0);
		PCsel, RFaddr : in std_logic_vector(1 downto 0);	
		-- Test Bench Signals --
		TBactive, clk, rst : in std_logic;
		TBWrEnProgMem, TBWrEnDataMem : in std_logic;
		TBdataInProgMem    : in std_logic_vector(m-1 downto 0);
		TBdataInDataMem    : in std_logic_vector(Dwidth-1 downto 0);
		TBWrAddrProgMem, TBWrAddrDataMem, TBRdAddrDataMem :	in std_logic_vector(Awidth-1 downto 0);
		TBdataOutDataMem   : out std_logic_vector(Dwidth-1 downto 0);
		-- Debug Signal --
		DebugSignal		 : out std_logic_vector(Dwidth-1 downto 0)
);

end Datapath;
--------------------------------------------------------------
architecture behav of Datapath is
---- Program Memory --
--signal dataOutProgMem : std_logic_vector(Dwidth-1 downto 0);
--signal RdAddrProgMem : std_logic_vector(Awidth-1 downto 0) := "000000";
--
---- Data Memory --
--
--
---- Reg File --
--signal WDataRF, RDataRF : std_logic_vector(Dwidth-1 downto 0);
--signal RWAddrRF 		: std_logic_vector(RFAddrWidth-1 downto 0);	  -- Was AWidth
--	
---- ALU --
--signal A, B, C : std_logic_vector(Dwidth-1 downto 0);
--Signal CregOut : std_logic_vector(Dwidth-1 downto 0);
--
---- IR --
--signal IR_OffsetAddr : std_logic_vector(OffsetSize-1 downto 0);
--signal IR_Immid	     : std_logic_vector(ImmidSize-1 downto 0);
--signal IROp		 : std_logic_vector(RFAddrWidth-1 downto 0);
--
---- General Purpose Signals
--signal Immidiate	: std_logic_vector(Dwidth-1 downto 0);
--
---- Bus Signal 
--signal DataBUS 		: std_logic_vector(Dwidth-1 downto 0);

begin 

