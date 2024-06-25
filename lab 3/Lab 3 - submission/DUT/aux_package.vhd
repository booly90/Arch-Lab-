LIBRARY ieee;
USE ieee.std_logic_1164.all;

package aux_package is
-----------------------------------------------------------------
component control_fsm is
	generic(Awidth 	  : integer := 16;
			OPsize    : integer := 4);
	port   (clk, ena, rst 	: IN std_logic;
	--input status signals from datapath
			mov,done_DTCM,and_op,or_op,xor_op : IN std_logic;
			jnc,jc,jmp,sub,add,Nflag,Zflag,Cflag,ld,st : IN std_logic;
	--output control signals to datapath
			mem_wr, mem_out, mem_in, c_out, C_in, RFin, PCin, Imm1_in, Imm2_in,Ain, RFout, IRin: OUT std_logic;
			PCsel, RFaddr	: OUT std_logic_vector (1 downto 0);
			OPC 			: OUT std_logic_vector (3 downto 0);
	--output TB control signal to specify program has ended
			done_TB   			: OUT std_logic
			);
end component;
-----------------------------------------------------------------
component Adder IS
		GENERIC (length : INTEGER := 8);
		PORT ( a, b: IN STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cin: IN STD_LOGIC;
            s: OUT STD_LOGIC_VECTOR (length-1 DOWNTO 0);
			cout: OUT STD_LOGIC);
END component;
-----------------------------------------------------------------
component dataMem is
generic( Dwidth: integer:=16;
		 Awidth: integer:=6;
		 dept:   integer:=64);
port(	clk,memEn: in std_logic;	
		WmemData:	in std_logic_vector(Dwidth-1 downto 0);
		WmemAddr,RmemAddr:	
					in std_logic_vector(Awidth-1 downto 0);
		RmemData: 	out std_logic_vector(Dwidth-1 downto 0));
end component;
-----------------------------------------------------------------
component BidirPin is
	generic( width: integer:=16 );
	port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
			en:		in 		std_logic;
			Din:	out		std_logic_vector(width-1 downto 0);
			IOpin: 	inout 	std_logic_vector(width-1 downto 0));
end component;
-----------------------------------------------------------------
component ALU_UNIT IS
  GENERIC (BusSize : INTEGER := 16);
  PORT ( A, B          : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
         OPC           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         CFlag, Zflag, Nflag : OUT STD_LOGIC := '0';
         C             : OUT STD_LOGIC_VECTOR(BusSize-1 DOWNTO 0);
         Ain           : IN STD_LOGIC;
         Cout          : IN STD_LOGIC;
		 clk		   : in std_logic;
		 Cin           : in std_logic);
END component;
-----------------------------------------------------------------
component IR IS
  generic (
    bus_size : integer := 16
  );
  port (
    bus_in : in std_logic_vector(bus_size-1 downto 0);
    IRin : in std_logic;
    RFaddr : in std_logic_vector(1 downto 0);
    reg_address : out std_logic_vector(3 downto 0);
    Op : out std_logic_vector(3 downto 0);
    Imm1 : out std_logic_vector(bus_size-1 downto 0);
    Imm2 : out std_logic_vector(bus_size-1 downto 0);
    offset_addr : out std_logic_vector(7 downto 0)
  );
END component;
----------------------------------------------------------------
component RF IS
generic( Dwidth: integer:=16;
		 Awidth: integer:=4);
port(	clk,rst,WregEn: in std_logic;	
		WregData:	in std_logic_vector(Dwidth-1 downto 0);
		WregAddr,RregAddr:	
					in std_logic_vector(Awidth-1 downto 0);
		RregData: 	out std_logic_vector(Dwidth-1 downto 0));
END component;
----------------------------------------------------------------
component OPCdecode IS
	generic(RFAddrWidth: integer:=4); 	-- Register Size
	port(	IRopBits	:IN std_logic_vector (RFAddrWidth - 1 downto 0);
			mov, done_DTCM, and_op, or_op, xor_op : OUT std_logic;
			jnc, jc, jmp, sub, add, ld, st : OUT std_logic);
END component;
----------------------------------------------------------------
component progMem IS
	generic( Dwidth: integer:=16;
			 Awidth: integer:=6;
			 dept:   integer:=64);
	port(	clk,memEn: in std_logic;	
			WmemData:	in std_logic_vector(Dwidth-1 downto 0);
			WmemAddr,RmemAddr:	
						in std_logic_vector(Awidth-1 downto 0);
			RmemData: 	out std_logic_vector(Dwidth-1 downto 0));
END component;
----------------------------------------------------------------
component PC_wrap IS
	GENERIC(Awidth			:INTEGER := 6;
			OffsetWidth		:INTEGER := 8);
	PORT(	clk 			:IN std_logic;
			IRoffset 		:IN std_logic_vector(OffsetWidth-1 DOWNTO 0);
			PCout			:OUT std_logic_vector(Awidth-1 downto 0) := "000000";
--control signals
			PCin     		:IN std_logic;
			PCsel			:IN std_logic_vector(1 DOWNTO 0));
END component;
----------------------------------------------------------------
component datapath is
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
		TB_DataMem_Data_in: in std_logic_vector(m-1 downto 0);
		TB_Data_writeAddr, TB_Data_readAddr : in std_logic_vector(prog_addr_size-1 downto 0);
		
		 -- outputs to control unit
		mov, done, and_bit, or_bit, xor_bit, jnc, jc, jmp, sub, add, ld, st : out std_logic; -- out from OPCdecoder
		Nflag, Zflag, Cflag : out std_logic := '0'; -- out from ALU
		-- outputs to tb, DATA
		DataMem_Data_out : out std_logic_vector(m-1 downto 0));
END component;
----------------------------------------------------------------		
component datamem_wrap is
generic( 
		Dwidth: integer:=16;
		Awidth: integer:=6;
		dept:   integer:=64);
    port(
--DUT signals		
		clk, rst :in std_logic;	

		dataBUS: in std_logic_vector(Dwidth-1 downto 0);
--control signals
		mem_wr, mem_in, mem_out: in std_logic;
--TB signals	
		TBactive, TB_wren: in std_logic;
		TB_wAddr, TB_rAddr	: in std_logic_vector(Awidth-1 downto 0);
		TB_wData 			: in std_logic_vector(Dwidth-1 downto 0);
		TB_rData  			: out std_logic_vector(Dwidth-1 downto 0));
end component;
-----------------------------------------------------------------
end aux_package;
