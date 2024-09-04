LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY clocks IS
    PORT(
		rst   : IN std_logic;
        CLOCK : IN std_logic;
		CLK   : out std_logic;
		CLK_2 : out std_logic;
		CLK_4 : out std_logic;
		CLK_8 : out std_logic;
        );
END ENTITY clocks;

ARCHITECTURE CLOCKS_MOUDLE OF clocks IS
	signal counter    : std_logic_vector(2 downto 0) := (others => '0');
	
begin
	process(CLOCK)
	begin
	if rst = '1' then
		counter <= (others => '0');
	elsif rising_edge(clock) then
		counter <= counter + 1;
	end if;
END process;
CLK   <= clock;
CLK_2 <= counter(0);
CLK_4 <= counter(1);
CLK_8 <= counter(2);

END ARCHITECTURE CLOCKS_MOUDLE;