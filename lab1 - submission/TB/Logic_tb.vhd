library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.aux_package.all;

entity tb_Logic is
    constant n : integer := 8;
    constant k : integer := 3;
    constant m : integer := 4;
end entity tb_Logic;

architecture rtb of tb_Logic is

    component Logic is
        generic (
            n: integer := 8;
            OP: integer := 8
        );
        port (
            x_logic, y_logic: inout std_logic_vector(n-1 downto 0);
            ALUFN: in std_logic_vector(2 downto 0);
            Logic_out: out std_logic_vector(n-1 downto 0)
        );
    end component;

    signal y_logic, x_logic, Logic_out: std_logic_vector(n-1 downto 0);
    signal ALUFN: std_logic_vector(2 downto 0);

begin

    L0: Logic
        generic map (n => n)
        port map (
            y_logic => y_logic,
            x_logic => x_logic,
            ALUFN => ALUFN,
            Logic_out => Logic_out
        );

    tb_xy_inputs: process
    begin
        x_logic <= (others => '0');
        y_logic <= (others => '1');
        for j in 0 to 127 loop
            wait for 50 ns;
            y_logic <= std_logic_vector(unsigned(y_logic) + to_unsigned(3, y_logic'length));
            x_logic <= std_logic_vector(unsigned(x_logic) + to_unsigned(2, x_logic'length));
        end loop;
        wait;
    end process tb_xy_inputs;

    tb_ALUFN: process
    begin
        ALUFN <= (others => '0');
        for i in 0 to 15 loop
            wait for 200 ns;
            ALUFN <= std_logic_vector(unsigned(ALUFN) + to_unsigned(1, ALUFN'length));
        end loop;
        wait;
    end process tb_ALUFN;

end architecture rtb;
