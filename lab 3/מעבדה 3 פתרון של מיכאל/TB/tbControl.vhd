library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
-- A test bench which checks the Control unit's proper function. 
---------------------------------------------------------
entity controlTB is

end controlTB;
---------------------------------------------------------
architecture controlTB of controlTB is
	signal		clk, rst, ena, st, ld, mov, done_DTCM, add, sub, jmp, jc, jnc, Cflag, Zflag, Nflag:  std_logic;
	signal		IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, C_in, C_out, Mem_wr, Mem_out, Mem_in :  std_logic;
	signal		OPC :  std_logic_vector(3 downto 0);
	signal 		PCsel, RFaddr :  std_logic_vector(1 downto 0);
	SIGNAL		done_TB:			STD_LOGIC := '0';
	
---------------------------------------------------------
begin
Control instance: control_fsm port map (clk, ena, rst, mov, done_DTCM, and_op, or_op,xor_op
										Ain,RFout,IRin,jnc,jc,jz,sub,add,Nflag,Zflag,Cflag,ld,st,
										mem_wr,Mem_out,Mem_in,c_out,c_in,Pcin,Imm1_in,Imm2_in,PCsel,RFaddr,done_TB


    
	--------- start of stimulus section ------------------	
	
		gen_rst : process	-- reset process
        begin
		  rst <='1','0' after 100 ns;	-- reset at the begining of the system
		  wait;
        end process; 
		
		
        gen_clk : process	-- Clk process (period of 100 ns)
        begin
		  clk <= '1';
		  wait for 50 ns;
		  clk <= not clk;
		  wait for 50 ns;
        end process;
		
		ena <= '1';

		--------------- Commands ---------------------
		
		add_cmd : process
        begin
		  add <='0', '1' after 100 ns, '0' after 500 ns;
		  wait;
        end process; 
		
		nop_cmd : process
        begin
		  nop <='0','1' after 500 ns, '0' after 900 ns;
		  wait;
        end process;
		
		jnc_cmd : process
        begin
		  jnc <='0','1' after 900 ns, '0' after 1100 ns;
		  wait;
        end process;
		
		
		jc_cmd : process
        begin
		  jc <='0','1' after 1100 ns, '0' after 1300 ns;
		  wait;
        end process;
		
		
		jmp_cmd : process
        begin
		  jmp <='0','1' after 1300 ns, '0' after 1500 ns;
		  wait;
        end process;
		
		sub_cmd : process
        begin
		  sub <='0','1' after 1500 ns, '0' after 1900 ns;
		  wait;
        end process;
		
		mov_cmd : process
        begin
		  mov <='0','1' after 1900 ns, '0' after 2100 ns;
		  wait;
        end process;
		
		ld_cmd : process
        begin
		  ld <='0','1' after 2100 ns, '0' after 2600 ns;
		  wait;
        end process;
		
		done_cmd : process
        begin
		  done_DTCM <='0','1' after 2600 ns, '0' after 2800 ns;
		  wait;
        end process;
		
		
		
end architecture controlTB;
