LIBRARY ieee;
USE ieee.std_logic_1164.all;
----------------Package-------------------------------------
package aux_package is
-------------------------- ALU ----------------------------	
	component ALU IS
	  GENERIC (BusSize : INTEGER := 16);
	  PORT ( A,B	  				  : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
			 OPC 					  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 CFlag, Zflag, Nflag	  :	OUT STD_LOGIC;
			 C		  				  :	OUT STD_LOGIC_VECTOR(BusSize-1 downto 0));
	END component;
---------------------- Bi-Dir Bus Line -----------------------
	component BidirPin is
	generic( width: integer:=16 );
	port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
			en:		in 		std_logic;
			Din:	out		std_logic_vector(width-1 downto 0);
			IOpin: 	inout 	std_logic_vector(width-1 downto 0)
	);
	end component;
---------------------- Bi Direction Pin Basic -----------------------
	component BidirPinBasic is
	port(   writePin: in 	std_logic;
			readPin:  out 	std_logic;
			bidirPin: inout std_logic
	);
	end component;	
---------------------- Control Unit -----------------------
	component Control IS
		PORT(
			st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, Cflag, Zflag, Nflag, shl: in std_logic;
			IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in : out std_logic;
			OPC : out std_logic_vector(3 downto 0);
			PCsel, RFaddr : out std_logic_vector(1 downto 0);
			clk, rst, ena : in STD_LOGIC;
			done_FSM : out std_logic
		);
	END component;	
---------------------- Data Memory -----------------------
	component dataMem is
	generic( Dwidth: integer:=16;
			 Awidth: integer:=6;
			 dept:   integer:=64);
	port(	clk,memEn: in std_logic;	
			WmemData:	in std_logic_vector(Dwidth-1 downto 0);
			WmemAddr,RmemAddr:	
						in std_logic_vector(Awidth-1 downto 0);
			RmemData: 	out std_logic_vector(Dwidth-1 downto 0)
	);
	end component;
---------------------- Data Path -------------------------
	component Datapath is
	generic( BusSize: integer:=16;	-- Bus Size
			 RegSize: integer:=4; 	-- Register Size
			 m: 	  integer:=16;  -- Program Memory In Data Size
			 Awidth:  integer:=6;  	-- Address Size
			 OffsetSize 	: integer := 5;
			 ImmidSize	: integer := 8;		 
			 dept:    integer:=64); -- Program Memory Size
	port(	
			-- Op Status Signals --
			st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, CFlag, ZFlag, NFlag, shl : out std_logic;	
			-- Control Signals --
			IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in : in std_logic;
			OPC : in std_logic_vector(3 downto 0);
			PCsel, RFaddr : in std_logic_vector(1 downto 0);	
			-- Test Bench Signals --
			TBactive, clk, rst : in std_logic;
			TBWrEnProgMem, TBWrEnDataMem : in std_logic;
			TBdataInProgMem    : in std_logic_vector(m-1 downto 0);
			TBdataInDataMem    : in std_logic_vector(BusSize-1 downto 0);
			TBWrAddrProgMem, TBWrAddrDataMem, TBRdAddrDataMem :	in std_logic_vector(Awidth-1 downto 0);
			TBdataOutDataMem   : out std_logic_vector(BusSize-1 downto 0);
			-- Bus Signal --
			DebugSignal : out std_logic_vector(BusSize-1 downto 0)
	);
	end component;	
---------------------- Full Adder -----------------------	
	component FA IS
	PORT (xi, yi, cin: IN std_logic;
			  s, cout: OUT std_logic);
	END component;
---------------------- Instruction Register --------------	
	component IR is 
	generic(BusSize		: integer := 16;
			RegSize		: integer := 4;
			OffsetSize 	: integer := 5;
			ImmidSize	: integer := 8
	);
	port(dataOutProgMem	: in  std_logic_vector(BusSize-1 downto 0);
		IRin			: in  std_logic;
		RFaddr 			: in  std_logic_vector(1 downto 0);
		RWAddrRF		: out std_logic_vector(RegSize-1 downto 0);
		OffsetAddr		: out std_logic_vector(OffsetSize-1 downto 0);
		Immid			: out std_logic_vector(ImmidSize-1 downto 0);
		IROp			: out std_logic_vector(RegSize-1 downto 0)
	);
	end component;
-------------------------- OPC Decoder ----------------------------	
	component OPCdecoder is
		generic( RegSize: integer:=4);
		port(	IROp : in std_logic_vector(RegSize-1 downto 0);
				st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop, shl: out std_logic
	);
	end component;
---------------------- Program Counter -----------------------	
	component PCLogic IS
		GENERIC(AddrSize		:INTEGER := 6;
				OffsetSize		:INTEGER := 5);
		PORT(	IRoffset 		:IN STD_LOGIC_VECTOR(OffsetSize-1 DOWNTO 0);
				PCsel			:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
				PCin, clk		:IN STD_LOGIC;
				PCout			:OUT std_logic_vector(AddrSize-1 downto 0) := "000000"
				);
	END component;
---------------------- Program Memory -----------------------
	component ProgMem is
	generic( Dwidth: integer:=16;
			 Awidth: integer:=6;
			 dept:   integer:=64);
	port(	clk,memEn: in std_logic;	
			WmemData:	in std_logic_vector(Dwidth-1 downto 0);
			WmemAddr,RmemAddr:	
						in std_logic_vector(Awidth-1 downto 0);
			RmemData: 	out std_logic_vector(Dwidth-1 downto 0)
	);
	end component;	
---------------------- Register File -----------------------
	component RF is
	generic( Dwidth: integer:=16;
			 Awidth: integer:=4);
	port(	clk,rst,WregEn: in std_logic;	
			WregData:	in std_logic_vector(Dwidth-1 downto 0);
			WregAddr,RregAddr:	
						in std_logic_vector(Awidth-1 downto 0);
			RregData: 	out std_logic_vector(Dwidth-1 downto 0)
	);
	end component;
---------------------- top -----------------------
	component top IS
		generic( BusSize: integer:=16;	-- Data Memory In Data Size
			 m: 	  integer:=16;  -- Program Memory In Data Size
			 Awidth:  integer:=6);  	-- Address Size
		PORT(
			clk, rst, ena  : in STD_LOGIC;
			done_FSM : out std_logic;	
			
			-- Test Bench
			TBdataInProgMem  : in std_logic_vector(m-1 downto 0);
			TBdataInDataMem  : in std_logic_vector(BusSize-1 downto 0);
			TBdataOutDataMem : out std_logic_vector(BusSize-1 downto 0);
			TBactive	   : in STD_LOGIC;
			TBWrEnProgMem, TBWrEnDataMem : in std_logic;
			TBWrAddrProgMem, TBWrAddrDataMem, TBRdAddrDataMem :	in std_logic_vector(Awidth-1 downto 0)
		);
	END component;
	
end aux_package;

