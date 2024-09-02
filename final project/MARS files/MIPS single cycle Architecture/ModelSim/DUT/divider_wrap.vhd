library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
USE work.aux_package.ALL;


entity divider_wrap is
    Port (
        dividend : in std_logic_vector(31 downto 0);
        divisor  : in std_logic_vector(31 downto 0);
        PIN_AF14   : in std_logic;
        rst      : in std_logic;
        ena      : in std_logic;
        div_ifg    : out std_logic;
        result   : out std_logic_vector(31 downto 0);
        remainder : out std_logic_vector(31 downto 0)
    );
end divider_wrap;

architecture Behavioral of divider_wrap is
    signal temp_dividend : std_logic_vector(31 downto 0);
    signal temp_result   : std_logic_vector(31 downto 0);
    signal temp_remainder: std_logic_vector(31 downto 0);
    signal temp_divisor  : std_logic_vector(31 downto 0);
	signal result_temp, remainder_temp :std_logic_vector(31 downto 0);
	signal divclk,pll_clock : std_logic;

begin

divclk <= pll_clock;

process (divclk,rst)
begin
	if rst = '1' then
		temp_dividend 	<= (others => '0');
		temp_result   	<= (others => '0');
		temp_remainder	<= (others => '0');
		temp_divisor  	<= (others => '0');
	elsif rising_edge(divclk) then
		temp_dividend 	<= dividend ;
		temp_result   	<= result_temp   ;
		temp_remainder	<= remainder_temp;
		temp_divisor  	<= divisor  ;
	end if;
end process;

div: Divider port map (	dividend  	=> temp_dividend,
                        divisor   	=> temp_divisor ,
                        divclk    	=> divclk       ,
                        rst       	=> rst          ,
                        ena       	=> ena          ,
                        div_ifg   	=> div_ifg      ,
                        result    	=> result_temp,
                        remainder 	=> remainder_temp
);

pll_1: div_pll port map(
	refclk => PIN_AF14,
	outclk_0 => pll_clock
);



end Behavioral;
