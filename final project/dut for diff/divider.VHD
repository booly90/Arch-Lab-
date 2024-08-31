library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider is
    Port (
        dividend : in std_logic_vector(31 downto 0);
        divisor  : in std_logic_vector(31 downto 0);
        divclk   : in std_logic;
        rst      : in std_logic;
        ena      : in std_logic;
        div_ifg    : out std_logic;
        result   : out std_logic_vector(31 downto 0);
        remainder : out std_logic_vector(31 downto 0)
    );
end Divider;

architecture Behavioral of Divider is
    signal temp_dividend : std_logic_vector(31 downto 0);
    signal temp_result   : std_logic_vector(31 downto 0);
    signal temp_remainder: std_logic_vector(31 downto 0);
    signal temp_divisor  : std_logic_vector(31 downto 0);
    signal count         : integer := 0;
    signal busy          : std_logic := '0';
	signal monkey_place_holder        : std_logic_vector(31 downto 0);
	signal toggle		 : std_logic := '0';
begin

process(divclk, rst)
begin
    if rst = '1' then
        temp_dividend <= (others => '0');
        temp_result   <= (others => '0');
        temp_remainder<= (others => '0');
        count         <= 0;
        busy          <= '0';
		monkey_place_holder <= (others => '0');
		div_ifg  <= '0';
    elsif rising_edge(divclk) then
        if ena = '1' and busy = '0' then
			-- Initialize for division
			temp_dividend <= (others => '0');  -- Start with zero
			temp_divisor  <= divisor;
			temp_result   <= (others => '0');
			count         <= 31;  -- Start from the most significant bit
			busy          <= '1';
			monkey_place_holder <= (others => '0');
			toggle <= '1';
			div_ifg  <= '0';
        elsif busy = '1' then
            if count >= 0 then
                if toggle = '1' then
					-- Shift temp_dividend left by 1 and bring in the next bit from the dividend
					monkey_place_holder<= temp_dividend(30 downto 0) & dividend(count);
					toggle <= '0';
				else	
					-- Compare and subtract if temp_dividend >= temp_divisor
					if unsigned(monkey_place_holder) >= unsigned(temp_divisor) then
						temp_dividend <= std_logic_vector(unsigned(monkey_place_holder) - unsigned(temp_divisor));
						temp_result <= temp_result(30 downto 0) & '1';  -- Set the corresponding bit in the result to '1'
					else
						temp_result <= temp_result(30 downto 0) & '0';  -- Set the corresponding bit in the result to '0'
						temp_dividend <= monkey_place_holder;
					end if;

					count <= count - 1;
					toggle <= '1';
				end if;
            else
                busy <= '0';  -- Division completed
				result <= temp_result;
				remainder <= temp_dividend;
				toggle <= '0';
				div_ifg <= '1';
			end if;

		end if;

	end if;

end process;

-- Output assignments


end Behavioral;
