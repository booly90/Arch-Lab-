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






  
  
  
  
end aux_package;

