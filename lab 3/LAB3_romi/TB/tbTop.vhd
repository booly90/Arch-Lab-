library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use work.aux_package.all;
use IEEE.STD_LOGIC_TEXTIO.all;


---------------------------------------------------------
entity tb_TOP is
	generic(ton : time := 50 ns);
	constant Dwidth : integer := 16;
	constant Awidth : integer := 4;
	constant dept:  integer := 64;
	constant addr_size : integer := 6;
end tb_TOP;
---------------------------------------------------------
architecture rtc of tb_TOP is

	signal clk : std_logic := '1';
	signal 	rst:  std_logic;
	signal	ena:  std_logic;
	signal 	Done: std_logic;
	signal 	Doner1: boolean;
	signal 	Doner2: boolean;
	signal  TBactive:  std_logic;
	signal	TB_ITCM_wren:  std_logic;
	signal	TB_DTCM_wren:  std_logic;
	signal	TB_ITCM_W_Addr:  std_logic_vector(addr_size-1 downto 0);
	signal	TB_DTCM_W_Addr:  std_logic_vector(addr_size-1 downto 0);
	signal	TB_DTCM_R_Addr:  std_logic_vector(addr_size-1 downto 0);
	signal	TB_ITCM_in:  std_logic_vector(15 downto 0);
	signal	TB_DTCM_in:  std_logic_vector(15 downto 0);
	signal	TB_DTCM_out:  std_logic_vector(15 downto 0);

	constant read_file_loc : string(1 to 98) :=  "C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\ITCMinit.txt";
	constant read_file_loc2 : string(1 to 98) := "C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\DTCMinit.txt";
	constant write_file_loc : string(1 to 101) := "C:\Users\Omer Pintel\OneDrive - post.bgu.ac.il\LAB3_romi\Code and binary memory files\DTCMcontent.txt";
	
begin
		L1: entity work.top generic MAP (Dwidth,Awidth,Dwidth,Dwidth,addr_size,addr_size,dept)  port map(
			-- top => tb
			rst=>rst,
			clk=>clk,
			ena=>ena,
			
			Prog_wren=>TB_ITCM_wren, -- program enable
			ProgMem_Data_in=>TB_ITCM_in, -- hex program operations
			ProgMem_writeAddr =>TB_ITCM_W_Addr, -- prog write addr
			
			Data_wren =>TB_DTCM_wren, -- data enable
			TBactive=>TBactive,
			DataMem_Data_in=>TB_DTCM_in, -- hex data
			Data_readAddr=>TB_DTCM_R_Addr, -- data write addr
			Data_writeAddr=>TB_DTCM_W_Addr, -- data read addr
			
			tb_done=>done, --tb done
			DataMem_Data_out=>TB_DTCM_out -- data out to dtcm file
			);


		clk <= not clk after ton; --ton = half clock = 50 ns
		
	rst_1 : process
	begin
	  rst <='1','0' after 100 ns;
	  wait;
	end process;	

	TB_active_1 : process
        begin
		 TBactive <= '1';
		 wait until doner1 and doner2;  
		 TBactive <= '0';
		 wait until done = '1';  
		 TBactive <= '1';	
        end process;	
	

		import_ITC: process	--ITCMinit.txt
			file infile : text open read_mode is read_file_loc;
			variable L2: line;
			variable in_dataIn : std_logic_vector(Dwidth-1 downto 0);
			variable good : boolean;
			variable TB_ITCM_W_Addr_temp : std_logic_vector(addr_size-1 downto 0);
			
		begin
			Doner1 <= false;
			TB_ITCM_W_Addr_temp := (others => '0');
			while not endfile (infile) loop
				readline(infile,L2);
				hread (L2,in_dataIn,good);
				next when not good;
				TB_ITCM_wren <='1';
				TB_ITCM_W_Addr <= TB_ITCM_W_Addr_temp;
				TB_ITCM_in <= in_dataIn;
				wait until (clk'event and clk='1');
				TB_ITCM_W_Addr_temp := TB_ITCM_W_Addr_temp +1;
				
				
			end loop;
		Doner1 <= true;
		TB_ITCM_wren <='0';
		file_close(infile);
		wait;
		end process;
--------------------------------------------------------------------------
		import_DTC: process --DTCMinit.txt
			file infile : text open read_mode is read_file_loc2;
			variable L2: line;
			variable in_dataIn : std_logic_vector(Dwidth-1 downto 0);
			variable good : boolean;
			variable TB_DTCM_W_Addr_temp : std_logic_vector(addr_size-1 downto 0);
			
		begin
			Doner2 <= false;
			TB_DTCM_W_Addr_temp := (others => '0');
			while not endfile (infile) loop
				readline(infile,L2);
				hread (L2,in_dataIn,good);
				next when not good;
				TB_DTCM_wren <='1';
				TB_DTCM_W_Addr <= TB_DTCM_W_Addr_temp;
				TB_DTCM_in <= in_dataIn;
				wait until (clk'event and clk='1');
				TB_DTCM_W_Addr_temp := TB_DTCM_W_Addr_temp +1;
				
				
			end loop;
		Doner2 <= true;
		TB_DTCM_wren <='0';
		file_close(infile);
		wait;
		end process;
		
		ena <='1' when (Doner1 and Doner2) else '0';
-------------------------------------------------------------------------
		Print_at_end: process	--DTCMcontent.txt
			file outfile: text open write_mode is write_file_loc;
			variable L2: line;
			variable TB_DTCM_R_Addr_temp  : std_logic_vector(addr_size-1 downto 0);
			variable counter	: integer;
		begin
		--wait until (done = '1');
		wait for 6500 ns;
		TB_DTCM_R_Addr_temp := (others => '0');
		counter:=1;
			while counter < 16 loop				--we have 15 lines in DTCM.txt
				TB_DTCM_R_Addr <= TB_DTCM_R_Addr_temp;
				wait until rising_edge(clk);
				wait until rising_edge(clk);
				hwrite(L2,TB_DTCM_out);
				writeline (outfile,L2);
				TB_DTCM_R_Addr_temp := TB_DTCM_R_Addr_temp+1;
				counter :=counter+1;
			end loop;				
		file_close(outfile);
		wait;
		end process;
--------------------------------------------------------------------------

end rtc;