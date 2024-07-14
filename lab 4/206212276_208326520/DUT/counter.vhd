LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity counter is 
	generic(L :integer := 6 );
	port (
	clk,enable,rst : in std_logic;	
	q          : out std_logic
	
	);
end counter;

architecture rtl of counter is
    signal q_int : std_logic_vector (31 downto 0):=x"00000000";
begin
    process (clk,rst)
    begin
		if rst ='1' then q_int <= (others => '0');
        elsif (rising_edge(clk)) then
           if enable = '1' then	   
		        q_int <= q_int + 1;
           end if;
	     end if;
    end process;
    q <= q_int(L-1);  -- Output only bit #6, meaning toggle once every 32 pll_clk cycles
					-- or conversely, with frequency which is 1/64 of pll_clk
end rtl;



