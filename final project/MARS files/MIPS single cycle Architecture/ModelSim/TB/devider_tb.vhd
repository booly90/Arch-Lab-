library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Divider_tb is
end Divider_tb;

architecture Behavioral of Divider_tb is

    -- Signals to connect to the Divider entity
    signal dividend   : std_logic_vector(31 downto 0);
    signal divisor    : std_logic_vector(31 downto 0);
    signal divclk     : std_logic := '0';
    signal rst        : std_logic := '0';
    signal ena        : std_logic := '0';
    signal div_ifg      : std_logic := '0';
    signal result     : std_logic_vector(31 downto 0);
    signal remainder  : std_logic_vector(31 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Divider entity
    uut: entity work.Divider
        port map (
            dividend   => dividend,
            divisor    => divisor,
            divclk     => divclk,
            rst        => rst,
            ena        => ena,
            div_ifg      => div_ifg,
            result     => result,
            remainder  => remainder
        );

    -- Clock generation process
    clk_process :process
    begin
        divclk <= '0';
        wait for clk_period/2;
        divclk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Reset the system
        rst <= '1';
        ena <= '0';
        wait for 20 ns;
        rst <= '0';
        wait for 20 ns;

        -- Test case 1: 100 / 5 = 20, remainder = 0
        dividend <= "00000000000000000000000001100100"; -- 100
        divisor <= "00000000000000000000000000000101";  -- 5
        ena <= '1';
        wait for 20 ns;
        ena <= '0';
        wait for 1000 ns;

        -- Test case 2: 1234 / 7 = 176, remainder = 2
        dividend <= "00000000000000000000010011010010"; -- 1234
        divisor <= "00000000000000000000000000000111";  -- 7
        ena <= '1';
        ena <= '1';
        wait for 10 ns;
        ena <= '0';
        wait for 1000 ns;

        -- Test case 3: 1024 / 8 = 128, remainder = 0
        dividend <= "00000000000000000000010000000000"; -- 1024
        divisor <= "00000000000000000000000000001000";  -- 8
        ena <= '1';
        ena <= '1';
        wait for 10 ns;
        ena <= '0';
        wait for 1000 ns;

        -- Wait for final result
        wait;

    end process;

end Behavioral;
