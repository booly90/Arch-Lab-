library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
-- A test bench which checks the Control unit. 
---------------------------------------------------------
entity tbControl is

end tbControl;
---------------------------------------------------------
architecture dfl of tbControl is
	signal 	clk, rst, ena, mov, done_DTCM, and_op, or_op, xor_op	: STD_LOGIC;
	signal	jnc, jc, jmp, sub, add, Nflag, Zflag, Cflag, ld, st		: STD_LOGIC;
	signal	mem_wr, mem_out, mem_in, Cout, C_in, RFin, PCin		: STD_LOGIC;
	signal	Imm1_in, Imm2_in, Ain, RFout, IRin						: STD_LOGIC;
	signal	OPC 													: std_logic_vector(3 downto 0);  -- Ensure 4-op length
	signal 	PCsel 													: std_logic_vector(1 downto 0);  -- Changed to 2-op vector
	signal 	RFaddr 													: std_logic_vector(1 downto 0);  -- Changed to 2-op vector
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

--	signal		clk, rst, ena, mov, done, and_op, or_op, xor_op, jnc, jc, jmp, sub, add, ld, st, Nflag, Zflag, Cflag: std_logic;
--	signal		IRin, Imm1_in, Imm2_in, RFin, RFout, PCin, Ain, Cin, Cout, Mem_wr, Mem_out, Mem_in :  std_logic;
--	signal		OPC :  std_logic_vector(3 downto 0);
--	signal 		PCsel, RFaddr :  std_logic_vector(1 downto 0);
--	SIGNAL 		tb_done:			STD_LOGIC := '0';
--	
-----------------------------------------------------------
--begin
--	Control_Unit : control_fsm port map(mov, done, and_op, or_op, xor_op, jnc, jc, jmp, sub, add, ld, st,
--									Nflag, Zflag, Cflag,
--									rst, ena, clk,
--									Mem_wr, Mem_out, Mem_in, Cout, Cin, Ain, RFin, RFout, IRin, PCin, Imm1_in, Imm2_in,
--									OPC, RFaddr, PCsel, tb_done);
--
	--------- start of stimulus section ------------------	
	
		gen_rst : process	-- reset process
        begin
		  rst <='1','0' after 100 ns;	-- reset at the begining of the system
		  wait;
        end process; 
		
        gen_clk : process	-- Clk process (duty cycle of 50% and period of 100 ns)
        begin
		  clk <= '1';
		  wait for 50 ns;
		  clk <= not clk;
		  wait for 50 ns;
        end process;
		
		ena <= '1';

		--------------- Commands ---------------------
		
		mov_cmd : process
        begin
		  mov <='0', '1' after 100 ns, '0' after 400 ns;
		  wait;
        end process; 
		
		done_cmd : process
        begin
		  done_DTCM <='0','1' after 400 ns, '0' after 700 ns;
		  wait;
        end process;
		
		and_cmd : process
        begin
		  and_op <='0','1' after 700 ns, '0' after 1100 ns;
		  wait;
        end process;
		
		or_cmd : process
        begin
		  or_op <='0','1' after 1100 ns, '0' after 1500 ns;
		  wait;
        end process;
		
		xor_cmd : process
        begin
		  xor_op <='0','1' after 1500 ns, '0' after 1900 ns;
		  wait;
        end process;

		Cflag_cmd : process
        begin
		  Cflag <='0','1' after 2200 ns, '0' after 2800 ns; -- check jnc & jc with Cflag 0 or 1
		  wait;
        end process;
		
		jnc_cmd : process
        begin
		  jnc <='0','1' after 1900 ns, '0' after 2500 ns;
		  wait;
        end process;
		
		jc_cmd : process
        begin
		  jc <='0','1' after 2500 ns, '0' after 3100 ns;
		  wait;
        end process;
		
		jmp_cmd : process
        begin
		  jmp <='0','1' after 3100 ns, '0' after 3400 ns;
		  wait;
        end process;
		
		sub_cmd : process
        begin
		  sub <='0','1' after 3400 ns, '0' after 3800 ns;
		  wait;
        end process;
		
		add_cmd : process
        begin
		  add <='0','1' after 3800 ns, '0' after 4200 ns;
		  wait;
        end process;
		
		ld_cmd : process
        begin
		  ld <='0','1' after 4200 ns, '0' after 4700 ns;
		  wait;
        end process;

		st_cmd : process
        begin
		  st <='0','1' after 4700 ns, '0' after 5200 ns;
		  wait;
        end process;
-- full TB : 5200 ns
end architecture dfl;
