LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY PWM IS
  PORT (
    BTCCR0 : IN STD_LOGIC_vector (31 DOWNTO 0);
	BTCCR1 : IN STD_LOGIC_vector (31 DOWNTO 0);
    BTOUTEN, RST, CLK, clk_2, clk_4, clk_8: in STD_LOGIC;
    BTOUTMD : IN   STD_LOGIC;
    PWM_OUT : out STD_LOGIC;
	BTSSEL  : IN STD_LOGIC_vector (1 DOWNTO 0);
	BTIPx   :  IN STD_LOGIC_vector (2 DOWNTO 0);
	Set_BTIFG: out STD_LOGIC
  );
END ENTITY PWM;

ARCHITECTURE PWM_MODULE OF PWM IS
    subtype vector IS STD_LOGIC_vector(31 DOWNTO 0);   
    SIGNAL BTCL0: vector;
    SIGNAL BTCL1: vector;
    SIGNAL BTCNT: std_logic_vector(31 downto 0);
    SIGNAL PWM_OUT_REG: std_logic := '0'; 
	signal CHOSEN_CLK  : STD_LOGIC:= '0';
	signal counter    : std_logic_vector(4 downto 0);
	--signal old_btssel        : STD_LOGIC_vector(1 DOWNTO 0); 
	--signal btssel_changed   : STD_LOGIC:= '0';
	signal bt_counter_limit : std_logic_vector(4 downto 0);
BEGIN
    BTCL0 <= BTCCR0 WHEN BTOUTEN = '1' else (others => '0');
    BTCL1 <= BTCCR1 WHEN BTOUTEN = '1' else (others => '0');

	CHOSEN_CLK <= clk when (BTSSEL) = "00" else clk_2 when  (BTSSEL) = "01" else clk_4 WHEN  (BTSSEL) = "10" ELSE clk_8 WHEN  (BTSSEL) = "11";

		bt_counter_limit <= "00001" when  to_integer(unsigned(BTIPx)) = 0 else "00100" when to_integer(unsigned(BTIPx)) = 1 else "01000"
									when to_integer(unsigned(BTIPx)) = 2 else "01100" when to_integer(unsigned(BTIPx)) = 3
									else "10000" when to_integer(unsigned(BTIPx)) = 4 else "10100" when to_integer(unsigned(BTIPx)) = 5 else "11000" 
									when to_integer(unsigned(BTIPx)) = 6 else "11010" when to_integer(unsigned(BTIPx)) = 7 ;
	
    process(CLK, RST, btssel,CHOSEN_CLK)
    begin
--------------------------------------------------------------------
        if RST = '1' then
            BTCNT <= (others => '0');
            PWM_OUT_REG <= '0';
			counter <= (others => '0');
        else
			if rising_edge (CHOSEN_CLK) then
				counter	<= counter + 1; 
				if counter >= bt_counter_limit then
					counter <= "00000";
					Set_BTIFG <= '1';
				ELSE
					Set_BTIFG <= '0';
				end if;
				if BTCNT >= BTCL0 then --making sure that the counter is from 0 to BTCL0
					BTCNT <= (others => '0');
				else
					BTCNT <= BTCNT + 1;
				end if;
				
				
				if BTOUTEN = '1' then
					if BTOUTMD = '0' then
						if (unsigned (BTCNT) >= unsigned (BTCL1)) and (unsigned (BTCNT) < unsigned (BTCL0)) then -- 
							PWM_OUT_REG <= '1';
						else
							PWM_OUT_REG <= '0';
						end if;
					else --BTOUTMD = '1'
						if (unsigned (BTCNT) < unsigned (BTCL1)) then
							PWM_OUT_REG <= '1';
						else
							PWM_OUT_REG <= '0';
						end if;
					end if;
				else
					PWM_OUT_REG <= '0';
				end if;
			end if;
        end if;
    end process;

    PWM_OUT <= PWM_OUT_REG;

END ARCHITECTURE PWM_MODULE;
