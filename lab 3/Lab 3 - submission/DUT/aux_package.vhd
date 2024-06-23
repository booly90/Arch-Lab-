LIBRARY ieee;
USE ieee.std_logic_1164.all;

package aux_package is
-----------------------------------------------------------------
component control_fsm is
	generic(Awidth 	  : integer := 16;
			OPsize    : integer := 4;
			total_cnt_signals_count  : integer := 18
			);
	port   (clk, ena, rst 	: IN std_logic;
	--input status signals from datapath
			mov,done_DTCM,and_op,or_op,xor_op,Ain, RFout, IRin : IN std_logic;
			jnc,jc,jz,jmp,sub,add,Nflag,Zflag,Cflag,ld,st : IN std_logic;
	--output control signals to datapath
			mem_wr, mem_out, mem_in, c_out, C_in, RFin, PCin, Imm1_in, Imm2_in: OUT std_logic;
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
		RmemData: 	out std_logic_vector(Dwidth-1 downto 0)
);
end component;
-----------------------------------------------------------------
component BidirPin is
	generic( width: integer:=16 );
	port(   Dout: 	in 		std_logic_vector(width-1 downto 0);
			en:		in 		std_logic;
			Din:	out		std_logic_vector(width-1 downto 0);
			IOpin: 	inout 	std_logic_vector(width-1 downto 0)
	);
end component;
-----------------------------------------------------------------
component ALU_UNIT IS
  GENERIC (BusSize : INTEGER := 16);
  PORT ( A, B          : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
         OPC           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         CFlag, Zflag, Nflag : OUT STD_LOGIC;
         C             : OUT STD_LOGIC_VECTOR(BusSize-1 DOWNTO 0);
         Ain           : IN STD_LOGIC;
         COUT          : IN STD_LOGIC);
END component;
-----------------------------------------------------------------
component datamem_wrap is
generic( 
		Dwidth: integer:=16;
		Awidth: integer:=6;
		dept:   integer:=64
		);
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
		TB_rData  			: out std_logic_vector(Dwidth-1 downto 0)
	);	
		
	
end component;
-----------------------------------------------------------------

-----------------------------------------------------------------

-----------------------------------------------------------------
  
-----------------------------------------------------------------
  
-----------------------------------------------------------------
  
-----------------------------------------------------------------
  
end aux_package;

