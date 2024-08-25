LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

ENTITY tb_PWM IS
END ENTITY tb_PWM;

architecture rtb of tb_PWM is

    signal Y_PWM_in, X_PWM_in : STD_LOGIC_vector (7 DOWNTO 0);
    signal ENA, RST, CLK : STD_LOGIC := '0';
    signal ALUFN : STD_LOGIC_vector (4 DOWNTO 0);
    signal PWM_OUT : STD_LOGIC;
    
begin
    reset_system: process
    begin
        ENA <= '0';
        RST <= '1';
        wait for 100 ns;
        RST <= '0';
        ENA <= '1';
        wait for 100 ns;
        ALUFN <= "00001";
        wait;
    end process reset_system;

    Y_PWM_in <= "01000000";
    X_PWM_in <= "00010000";

    tb_PWM_clock : process
    begin
        while true loop
            CLK <= '0';
            wait for 50 ns;
            CLK <= '1';
            wait for 50 ns;
        end loop;
    end process tb_PWM_clock;

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