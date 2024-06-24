library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;
---------------------------------------------------------
-- A test bench which checks the Control unit's proper function. 
---------------------------------------------------------
entity controlTB is
end controlTB;

---------------------------------------------------------
architecture controlTB of controlTB is
	signal 	clk, rst, ena, mov, done_DTCM, and_op, or_op, xor_op	: STD_LOGIC;
	signal	jnc, jc, jmp, sub, add, Nflag, Zflag, Cflag, ld, st		: STD_LOGIC;
	signal	mem_wr, mem_out, mem_in, Cout, C_in, RFin, PCin		: STD_LOGIC;
	signal	Imm1_in, Imm2_in, Ain, RFout, IRin						: STD_LOGIC;
	signal	OPC 													: std_logic_vector(3 downto 0);  -- Ensure 4-bit length
	signal 	PCsel 													: std_logic_vector(1 downto 0);  -- Changed to 2-bit vector
	signal 	RFaddr 													: std_logic_vector(1 downto 0);  -- Changed to 2-bit vector
	signal	done_TB													: std_logic;  -- Changed to std_logic

begin
	Control_instance: control_fsm port map (
		clk, ena, rst,
	--input status signals from datapath
			mov,done_DTCM,and_op,or_op,xor_op, 
			jnc,jc,jmp,sub,add,Nflag,Zflag,Cflag,ld,st ,
	--output control signals to datapath
			mem_wr, mem_out, mem_in, Cout, C_in, RFin, PCin, Imm1_in, Imm2_in, Ain, RFout, IRin,
			PCsel, RFaddr	,
			OPC ,
	--output TB control signal to specify program has ended
			done_TB   		
	);

	--------- start of stimulus section ------------------	
	
	process	-- reset process
	begin
		rst <= '1', '0' after 100 ns;	-- start by resetting everything
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
	add_process: process begin
		add		<= '0', '1' after 100 ns, '0' after 500 ns; -- add
		wait;
	end process;
	
	sub_process: process begin
		sub 	<= '0', '1' after 500 ns, '0' after 900 ns;  -- sub
		wait;
	end process;
	
	and_process: process begin
		and_op 	<= '0', '1' after 900 ns, '0' after 1300 ns; -- and
		wait;
	end process;
	
	or_process: process begin
		or_op 	<= '0', '1' after 1300 ns, '0' after 1700 ns; --or
		wait;
	end process;
	
	xor_process: process
	begin 
		xor_op 	<= '0', '1' after 1700 ns, '0' after 2100 ns; -- xor
		wait;
	end process;
	
	jnc_process: process begin
		jnc		<= '0', '1' after 2100 ns, '0' after 2300 ns; --jnc
		wait;
	end process;
	
	cflag_process: process begin
		Cflag 	<= '0', '1' after 2100 ns, '0' after 2500 ns;
		wait;
	end process;
	
	jc_process: process begin
		jc 		<= '0', '1' after 2300 ns, '0' after 2500 ns; -- jc
		wait;
	end process;
	
	jmp_process: process begin
		jmp 	<= '0', '1' after 2500 ns, '0' after 2700 ns;  --jmp
		wait;
	end process;
	
	mov_process: process begin
		mov 	<= '0', '1' after 2700 ns, '0' after 2900 ns;  -- mov
		wait;
	end process;
	
	ld_process: process begin
		ld 		<= '0', '1' after 2900 ns, '0' after 3400 ns;  -- ld
		wait;
	end process;
	
	st_process: process	begin
		st 		<= '0', '1' after 3400 ns, '0' after 3900 ns;  -- st
		wait;
	end process;
	
	done_process: process	begin
		done_DTCM <= '0', '1' after 3900 ns, '0' after 4100 ns;  -- done
		wait;
	end process;
		
end architecture controlTB;

