library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

----------------------------------
ENTITY interupt_FSM IS
	PORT( 
		INT_FSM		:	out STD_LOGIC_VECTOR(1 downto 0);
		INTA		:	in std_logic;
		rst,clk		:	in std_logic
		);

END interupt_FSM;
----------------------------
ARCHITECTURE structure OF interupt_FSM IS
signal	state, next_state : STD_LOGIC_VECTOR( 1 DOWNTO 0 ) ;
BEGIN

	next_state <=   "00" when rst = '1' else 
					"01" when state = "00" and INTA = '0' else
					"10" when state = "00" and INTA = '0' else
					"11" when state = "00" and INTA = '0' else
					"00";
process(clk, rst)
begin
	if rst = '1' then
		state <= "00";
	elsif rising_edge(clk) then
		state <= next_state;
	end if;

end process;
	
END ARCHITECTURE;                                   