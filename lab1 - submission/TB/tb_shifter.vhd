library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;  -- שימוש בחבילה הנכונה לפונקציות ההמרה
use work.aux_package.all;

entity tb_shifter is
    constant n : integer := 8;
    constant k : integer := 3;
    constant m : integer := 4;
end entity tb_shifter;

architecture sim of tb_shifter is

    component Shifter is
        generic (n : integer := 8);
    PORT (
        y_Shifter_in: IN std_logic_vector(n-1 downto 0);
        x_Shifter_in: IN std_logic_vector(k-1 downto 0);
        ALUFN : IN std_logic_vector(2 downto 0);
        Shifter_cout: OUT std_logic;
        Shifter_out: OUT std_logic_vector(n-1 downto 0)
    );
    end component;

    subtype vector is std_logic_vector(n-1 downto 0);
    signal ALUFN : std_logic_vector(2 downto 0);
    signal x_Shifter_in : std_logic_vector(k-1 downto 0);
    signal y_Shifter_in : vector;
    signal Shifter_cout: std_logic;
    signal Shifter_out: std_logic_vector(n-1 downto 0);

begin

    stim_proc : process
    begin
        x_Shifter_in <= (others => '0');
        y_Shifter_in <= (others => '1');
        
        for j in 0 to 63 loop
            wait for 50 ns;
            y_Shifter_in <= std_logic_vector(unsigned(y_Shifter_in) + to_unsigned(3, n));
            x_Shifter_in <= std_logic_vector(unsigned(x_Shifter_in) + to_unsigned(2, k));
        end loop;
        
        wait;
    end process stim_proc;

    ALUFN_proc : process
    begin
        ALUFN <= (others => '0');
        
        for i in 0 to 31 loop
            wait for 100 ns;
            ALUFN <= std_logic_vector(unsigned(ALUFN) + to_unsigned(1, 3));
        end loop;
        
        wait;
    end process ALUFN_proc;

    uut: Shifter
        generic map (n => 8)
        port map (
            x_Shifter_in => x_Shifter_in,
            y_Shifter_in => y_Shifter_in,
            ALUFN => ALUFN,
            Shifter_cout => Shifter_cout,
            Shifter_out => Shifter_out
        );

end architecture sim;
