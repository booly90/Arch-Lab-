LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
USE work.aux_package.all;
-------------------------------------
ENTITY PCLogic IS
	GENERIC(AddrSize		:INTEGER := 6;
			OffsetSize		:INTEGER := 5);
	PORT(	IRoffset 		:IN STD_LOGIC_VECTOR(OffsetSize-1 DOWNTO 0);
			PCsel			:IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			PCin, clk		:IN STD_LOGIC;
			PCout			:OUT std_logic_vector(AddrSize-1 downto 0) := "000000"
			);
END PCLogic;
------------------------------------------------
ARCHITECTURE dfl OF PCLogic IS
	SIGNAL currPC, nextPC	:STD_LOGIC_VECTOR(AddrSize-1 DOWNTO 0) := (others =>'0');
	constant rstAddr		:std_logic_vector(AddrSize-1 downto 0) := (others => '0');
	SIGNAL offset_addr  		:STD_LOGIC_VECTOR(OffsetSize-1 DOWNTO 0);
	

BEGIN

PC_reg: process (clk) begin
		if(clk'event and clk='1') then
			if(PCin = '1') then
				currPC <= nextPC;
				report "nextPC = " & to_string(nextPC);  -- debug next pc state
			end if;
		end if;

end process;

inc_PC: with PCsel select
	nextPC <= 	currPC + 1 									when "00",   -- PC + 1
				currPC + 1 + SXT(offset_addr, AddrSize) 	when "01",   -- PC + 1 + offset
				rstAddr										when "10",   -- zeros
				unaffected when others;
				
				
PCout <= currPC;
offset_addr <= IRoffset;

END dfl;