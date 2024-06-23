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
	signal 	clk,rst,ena,mov,done_DTCM,and_op,or_op,xor_op		:	STD_LOGIC;
	signal	jnc,jc,jmp,sub,add,Nflag,Zflag,Cflag,ld,st			: 	STD_LOGIC;
	signal	mem_wr, mem_out, mem_in, C_out, C_in, RFin, PCin	: 	STD_LOGIC;
	signal	Imm1_in, Imm2_in,Ain, RFout, IRin					:	STD_LOGIC;
	signal	OPC 												:	std_logic_vector(3 downto 0);
	signal 	PCsel, RFaddr 										:  	std_logic_vector(1 downto 0);
	signal	done_TB												:	STD_LOGIC;
	
begin
Control_instance: control_fsm port map (
			clk, ena, rst,
			mov, done_DTCM, and_op, or_op, xor_op,
			jnc, jc, jmp, sub, add, Nflag, Zflag, Cflag, ld, st,
			mem_wr, mem_out, mem_in, C_out, C_in, RFin, PCin,
			Imm1_in, Imm2_in, Ain, RFout, IRin,
			PCsel, RFaddr,
			OPC,
			done_TB
			);


	--------- start of stimulus section ------------------	
    
	
		process	-- reset process
        begin
		  rst <='1','0' after 100 ns;	-- start by resetting everything
		  wait;
        end process; 
		
		
        process	-- Clk generating process - period of 100 ns
        begin
		  clk <= '1';
		  wait for 50 ns;
		  clk <= not clk;
		  wait for 50 ns;
        end process;
		
		ena <= '1';

		--------------- control signal operation check ---------------------
		
		process
        begin
			add		<='0', '1' after 100 ns, '0' after 500 ns; -- add
	
			sub 	<='0','1' after 500 ns, '0' after 900 ns;  -- sub
			
			and_op 	<='0','1' after 900 ns, '0' after 1300 ns; -- and
	
			or_op 	<='0','1' after 1300 ns, '0' after 1700 ns; --or
	
			xor_op 	<='0','1' after 1700 ns, '0' after 2100 ns; -- xor
	
			jnc		<='0','1' after 2100 ns, '0' after 2300 ns; --jnc
			Cflag 	<='0','1' after 2100 ns, '0' after 2500 ns;
	
			jc 		<='0','1' after 2300 ns, '0' after 2500 ns; -- jc
	
			jmp 	<='0','1' after 2500 ns, '0' after 2700 ns;  --jmp
	
			mov 	<='0','1' after 2700 ns, '0' after 2900 ns;  -- mov
			
			ld 		<='0','1' after 2900 ns, '0' after 3400 ns;  -- ld
			
			st 		<='0','1' after 3400 ns, '0' after 3900 ns;  -- st
	
			done_DTCM <='0','1' after 3900 ns, '0' after 4100 ns;  -- done
		  wait;
        end process;
		
		
		
end architecture controlTB;
