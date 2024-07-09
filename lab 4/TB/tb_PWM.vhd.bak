LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY tb_PWM IS
  GENERIC (n : INTEGER := 8;
           k : integer := 3;   -- k=log2(n)
           m : integer := 4 ); -- m=2^(k-1)
END ENTITY tb_PWM;
-------------------------------------
architecture rtb of tb_PWM is

    signal Y_PWM_in, X_PWM_in : STD_LOGIC_vector (n-1 DOWNTO 0);
    signal ENA, RST, CLK : STD_LOGIC;
    signal ALUFN : STD_LOGIC_vector (4 DOWNTO 0);
    signal PWM_OUT : STD_LOGIC;
-------------------------------------
begin
    reset_system: process
    begin
        ENA <= '1';
        RST <= '1';
        wait for 100 ns;
        RST <= '0';
        ALUFN <= "00000";
        PWM_OUT <= '0';
        wait;
    end process reset_system;
-------------------------------------
    Y_PWM_in <= "01000000";
    X_PWM_in <= "00010000";

    tb_PMW_clock : process
        begin
            for i in 0 to 100000000 loop --SIMULATES FOR 10 SECONDS
                wait for 50 ns;
                CLK <= '1';
                wait for 50 ns;
                CLK <= '0';
            end loop;
            wait;
        end process tb_PMW_clock;

    PWM_module: entity work.PWM
        generic map (n => 8)
        port map (Y_PWM_in => Y_PWM_in,
                  X_PWM_in => X_PWM_in,
                  ENA => ENA,
                  RST => RST,
                  CLK => CLK,
                  ALUFN => ALUFN,
                  PWM_OUT => PWM_OUT
                 );

end architecture rtb;
