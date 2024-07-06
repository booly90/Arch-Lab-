LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
-------------------------------------
ENTITY PWM IS
  GENERIC (n : INTEGER := 8;
           k : integer := 3;   -- k=log2(n)
           m : integer := 4 ); -- m=2^(k-1)

  PORT
  (
    Y_PWM, X_PWM : IN STD_LOGIC_vector (n-1 DOWNTO 0);
    ENA, RST, CLK: in STD_LOGIC;
    ALUFN : IN  STD_LOGIC_vector (2 DOWNTO 0);
    PWM_OUT : out STD_LOGIC
  );

end PWM;

ARCHITECTURE PWM_MOUDLE OF PWM IS 
    SIGNAL COUNTER_PWM: std_logic_vector(n-1 downto 0);
    SIGNAL PWM_0: STD_LOGIC; --IF ALUFN IS 00000, WE WILL GET OUT THIS SIGNAL
    SIGNAL PWM_1: STD_LOGIC; --IF ALUFN IS 00001, WE WILL GET OUT THIS SIGNAL, WHICH IN NOT(PWM_0)
  
begin

process(CLK, RST)
begin
    if RST = '1' then
        COUNTER_PWM <= (others => '0');
    elsif rising_edge(CLK) then
        if ENA = '1' then
            COUNTER_PWM <= COUNTER_PWM + 1;
            if COUNTER_PWM < X_PWM then
                if COUNTER_PWM < Y_PWM then    
                    PWM_0 <= '1';
                else
                    PWM_0 <= '0';
                end if;
            end if;
            PWM_1 <= not PWM_0;
            if ALUFN = "00000" then
                PWM_OUT <= PWM_0;
            elsif ALUFN = "00001" then
                PWM_OUT <= PWM_1;
            end if;
        end if;
    end if;
end process;

end PWM_MOUDLE;
