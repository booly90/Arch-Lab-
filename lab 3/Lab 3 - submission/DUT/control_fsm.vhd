library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
----------------------------------------
entity control_fsm is
	generic(Awidth 	  : integer := 16;
			OPsize    : integer := 4
			);
	port   (clk, ena, rst 	: IN std_logic;
			mov, done_DTCM, and_op, or_op, xor_op : IN std_logic;
			jnc, jc, jmp, sub, add, Nflag, Zflag, Cflag, ld, st : IN std_logic;
			mem_wr, mem_out, mem_in, C_out, C_in, RFin, PCin,
			Imm1_in, Imm2_in, Ain, RFout, IRin: OUT std_logic;
			PCsel, RFaddr	: OUT std_logic_vector (1 downto 0);
			OPC 			: OUT std_logic_vector (3 downto 0);
	
			done_TB   			: OUT std_logic										
			
			
			);
end control_fsm; 
	--input status signals from datapath

	--output control signals to datapath

--output TB control signal to specify program has ended
architecture dft of control_fsm is
type state is (reset, fetch, decode, Rstate0, Rstate1, Istate0, Istate1, Istate2);

signal current_state, next_state 	: 	state ;

begin

	process (clk, rst,ena) begin
		if (rst ='1') then	
			current_state <= reset;
		elsif (ena ='1' and (clk'event and clk ='1')) then
			current_state <= next_state;
--			report 	"current_state = " 	& to_string(current_state) &
--					"next_state = "    	& to_string(next_state) &
--					"time = " 			& to_string(now) &
--					"#####################################";
		end if;
	end process;
	
--next_state update comb. logic	
	process begin
		case current_state is
			when reset		=> 
				if (done_DTCM = '0') then
					next_state <= fetch;
				else
					next_state <= reset;
				end if;
				
			when fetch		=> 
				next_state <= decode;
				
			when decode		=> 
				if (mov = '1' or jmp ='1' or jc='1' or jnc = '1' ) then
					next_state <= fetch;
				elsif (ld ='1' or st ='1') then
					next_state <= Istate0;
				elsif (add ='1' or sub ='1' or xor_op ='1' or or_op ='1' or and_op ='1') then
					next_state <= Rstate0;
				end if;
				
			when Rstate0	=> 
				next_state <= Rstate1;
				
			when Rstate1	=> 
				next_state <= fetch;
				
			when Istate0	=> 
				next_state <= Istate1;
				
			when Istate1	=> 
				next_state <= Istate2;
				
			when Istate2	=> 
				next_state <= fetch;
				
			when others => 
				next_state <= next_state;
		end case;
	end process;

--control signals update logic
	process (mov,done_DTCM,and_op,or_op,xor_op, jnc,jc,jmp,sub,add,Nflag,Zflag,Cflag,ld,st)
	begin
		case current_state is
--reset state
			when reset =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '0';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  		<= '0';
				PCsel  		<= "10";		--zeroes
				RFaddr 		<= "11";		--unused
				OPC			<= "0110";    	--unused
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0';     
		
--fetch state
			when fetch =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '0';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  		<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "11";		--unused
				OPC			<= "0110";    	--unused
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '1';   

--decode state
			when decode =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '0';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  		<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "01";		-- r_b
				OPC			<= "0110";    	--unused
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0';  
			
				if ((jc ='1' and Cflag = '1') or (jnc ='1' and Cflag ='0') or jmp ='1') then
					PCin <='1';
					PCsel <="10";  --pc += 1 + Imm1
				
				elsif (mov = '1') then
					RFin <='1';
					RFaddr <="10";  			--r_a
					Imm1_in <= '1';
					PCin <='1';
					
				elsif (ld ='1' or st ='1') then
					Ain <='1';
					RFout <='1';
				
				elsif (add ='1' or sub ='1' or or_op ='1' or and_op ='1' or xor_op ='1') then
					Ain <='1';
					RFout <='1';
					
				end if;
					
--Rstate0 state
			when Rstate0 =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '1';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  	<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "00";		-- r_c
				Ain			<= '0';
				RFout		<= '1';
				IRin		<= '0';
				
				if (add ='1') then
					OPC <= "0000";
				elsif (sub ='1') then
					OPC <= "0001";
				elsif (and_op ='1') then
					OPC <= "0010";
				elsif (or_op ='1') then
					OPC <= "0011";
				elsif (xor_op ='1') then
					OPC <= "0100";
				end if;
--				OPC			<= 	"0000" when add		='1' else
--								"0001" when sub   	='1' else
--								"0010" when and_op	='1' else
--								"0011" when or_op 	='1' else
--								"0100" when xor_op	='1' else
--								"0110" when others;

				
--Rstate1 state
			when Rstate1 =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '1';
				C_in   		<= '0';
				RFin   		<= '1';
				PCin   		<= '1';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  	<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "10";		-- r_a
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0'; 
--Istate0 state
			when Istate0 =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '1';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '1';
				done_TB  	<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "10";		-- r_a
				OPC			<= "0000";    	--add
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0';  
--Istate1 state
			when Istate1 =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '1';
				C_in   		<= '0';
				RFin   		<= '0';
				PCin   		<= '0';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  		<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "10";		-- r_a
				OPC			<= "0110";    	-- unused
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0'; 
				
				
--Istate2 state
			when Istate2 =>
				mem_wr		<= '0'; 
				mem_out		<= '0';
				mem_in 		<= '0';
				C_out  		<= '0';
				C_in   		<= '0';
				RFin   		<= '0';
				PCin   		<= '1';
				Imm1_in		<= '0';
				Imm2_in		<= '0';
				done_TB  		<= '0';
				PCsel  		<= "00";		-- PC<=PC+1
				RFaddr 		<= "10";		-- r_a
				OPC			<= "0110";    	-- unused
				Ain			<= '0';
				RFout		<= '0';
				IRin		<= '0'; 
				
				if (ld ='1') then
					mem_out <='1';
					RFin <='1';
				elsif (st <='1') then
					mem_in <='1';
					RFout <='1';
					mem_wr  <='1';
				end if;
		end case;
	end process;

end dft;
