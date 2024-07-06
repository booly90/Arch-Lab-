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
    Y_PWM_in, X_PWM_in : IN STD_LOGIC_vector (n-1 DOWNTO 0);
    ENA, RST, CLK: in STD_LOGIC;
    ALUFN : IN  STD_LOGIC_vector (2 DOWNTO 0);
    PWM_OUT : out STD_LOGIC
  );

end PWM;

ARCHITECTURE PWM_MOUDLE OF PWM IS 
    subtype vector IS STD_LOGIC_vector(n-1 DOWNTO 0);
    
	SIGNAL X_PWM_in: vector;
    SIGNAL Y_PWM_in: vector;
    SIGNAL COUNTER_PWM: std_logic_vector(n-1 downto 0);
    --SIGNAL PWM_0: STD_LOGIC; --IF ALUFN IS 00000, WE WILL GET OUT THIS SIGNAL
    --SIGNAL PWM_1: STD_LOGIC; --IF ALUFN IS 00001, WE WILL GET OUT THIS SIGNAL, WHICH IN NOT(PWM_0)
  
begin
	
	--gate inputs to PWM module when active
    Y_PWM    <= Y_PWM_in when ALUFN_i(4 DOWNTO 3) = "00" else (others => '0');
    X_PWM    <= X_PWM_in when ALUFN_i(4 DOWNTO 3) = "00" else (others => '0');
	
process(CLK, RST)
variable PWM_0: STD_LOGIC; --IF ALUFN IS 00000, WE WILL GET OUT THIS SIGNAL
variable PWM_1: STD_LOGIC; --IF ALUFN IS 00001, WE WILL GET OUT THIS SIGNAL, WHICH IN NOT(PWM_0)

begin
    if RST = '1' then
        COUNTER_PWM <= (others => '0');
    elsif rising_edge(CLK) then
        if ENA = '1' then
			if (COUNTER_PWM = Y_PWM) then 
			--counter counts only upto Y
				COUNTER_PWM <= (others => '0');
			else
				COUNTER_PWM <= COUNTER_PWM + 1;
			end if;
            
            if COUNTER_PWM >= X_PWM then
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
			else 
				PWM_OUT <= '0';
			end if;
        end if;
    end if;
end process;

end PWM_MOUDLE;
