
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
USE work.aux_package.all;
-------------------------------------
ENTITY PC_wrap IS
	GENERIC(Awidth			:INTEGER := 6;
			OffsetWidth		:INTEGER := 8);
	PORT(	clk 			:IN std_logic;
			IRoffset 		:IN std_logic_vector(OffsetWidth-1 DOWNTO 0);
			PCout			:OUT std_logic_vector(Awidth-1 downto 0) := "000000";
--control signals
			PCin     		:IN std_logic;
			PCsel			:IN std_logic_vector(1 DOWNTO 0)
			);
END PC_wrap;
------------------------------------------------
ARCHITECTURE dfl OF PC_wrap IS
	SIGNAL PC_current, PC_next 	:std_logic_vector(Awidth-1 DOWNTO 0) := (others =>'0');
	constant rst_Addr			:std_logic_vector(Awidth-1 downto 0) := (others => '0');
	--SIGNAL offsetAddr  		:std_logic_vector(OffsetWidth-1 DOWNTO 0);
	
BEGIN
	process (clk) 
	BEGIN
		if (clk'event and clk ='1') then
			if(PCin = '1') then
				PC_current <= pc_next;
			end if;
		end if;
	end process;

	with PCsel select
	PC_next <= 	PC_current + 1							when "00",  -- PC++
				PC_current + 1 + SXT(IRoffset,Awidth)	when "01",  -- PC += Imm1 + 1
				rst_Addr								when "10",  -- PC = 0
				unaffected when others;

	PCout <= PC_current;
END dfl;