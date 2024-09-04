LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

ENTITY PWM IS
  PORT (
    BTCCR0 : IN STD_LOGIC_vector (31 DOWNTO 0);
	BTCCR1 : IN STD_LOGIC_vector (31 DOWNTO 0);
    BTOUTEN, RST, CLK: in STD_LOGIC;
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
	SIGNAL COUNT_DIVIDER_0 : STD_LOGIC_vector(3 DOWNTO 0); 
	SIGNAL COUNT_DIVIDER_1 : STD_LOGIC_vector(3 DOWNTO 0); 
	SIGNAL COUNT_LIMIT : STD_LOGIC_vector(3 DOWNTO 0);  
	signal CHOSEN_CLK  : STD_LOGIC:= '0';
	signal bt_counter  : std_logic_vector(4 downto 0);
	signal bt_counter_limit  : std_logic_vector(4 downto 0);
	signal select_counter    : STD_LOGIC:= '0';
	--signal old_btssel        : STD_LOGIC_vector(1 DOWNTO 0); 
	--signal btssel_changed   : STD_LOGIC:= '0';
BEGIN
    BTCL0 <= BTCCR0 WHEN BTOUTEN = '1' else (others => '0');
    BTCL1 <= BTCCR1 WHEN BTOUTEN = '1' else (others => '0');

	COUNT_LIMIT <= "0001" when unsigned (BTSSEL) = 1 else "0011" WHEN unsigned (BTSSEL) = 2 ELSE "0111" WHEN unsigned (BTSSEL) = 3;
	bt_counter_limit <= "00001" when unsigned(BTIPx) = 0 else "00100" when unsigned(BTIPx) = 1 else "01000" when unsigned(BTIPx) = 2 else "01100" when unsigned(BTIPx) = 3
						else "10000" when unsigned(BTIPx) = 4 else "10100" when unsigned(BTIPx) = 5 else "11000" when unsigned(BTIPx) = 6
						else "11010" when unsigned(BTIPx) = 7 ;

    process(CLK, RST, btssel)
    begin
	--creating mclk/2, mclk/4, mclk/8
--		if rising_edge(clk) or falling_edge(clk) then
--			if old_btssel /= btssel then
--				btssel_changed <= '1';
--				if clk ='1' then
--					select_counter <= '1';
--				ELSE
--					select_counter <= '0';
--				end if;
--			ELSE
--				btssel_changed <= '0';
--			end if;
--			old_btssel <= btssel;
--		end if;
		
--		if rising_edge(BTSSEL(0)) or rising_edge(BTSSEL(1)) then
--			if clk = '1' then
--				select_counter <= '1';
--			ELSE
--				select_counter <= '0';
--			end if;
--		end if;
		
		if unsigned (BTSSEL) = 0 then
			CHOSEN_CLK <= clk;
		
		else 
			if  (unsigned(COUNT_DIVIDER_0)) >= (unsigned(COUNT_LIMIT)) then
				CHOSEN_CLK <= '1';
				COUNT_DIVIDER_0 <= x"0";
				select_counter <= '1';	
			elsif ( unsigned(COUNT_DIVIDER_1)) >= (unsigned(COUNT_LIMIT)) then
				CHOSEN_CLK <= '0';
				COUNT_DIVIDER_1 <= x"0";	
				select_counter <= '0';	
			end if;
			
			if select_counter = '0' then
				COUNT_DIVIDER_0 <= COUNT_DIVIDER_0 + 1;
			ELSE
				COUNT_DIVIDER_1 <= COUNT_DIVIDER_1 + 1;
			end if;
		end if;

	--
		if rising_edge(CLK) then
			if CHOSEN_CLK = '1' then
				if bt_counter = bt_counter_limit then
					Set_BTIFG <= '1';
					bt_counter <= "00000";
				else
					bt_counter <= bt_counter + 1;
					Set_BTIFG <= '0';
				end if;
			end if;
		end if;

        if RST = '1' then
            BTCNT <= (others => '0');
            PWM_OUT_REG <= '0';
			COUNT_DIVIDER_0 <= (others => '0');
			COUNT_DIVIDER_1 <= (others => '0');
			bt_counter <= (others => '0');
			select_counter <= '0';
        elsif rising_edge(CLK) then	
			if CHOSEN_CLK = '1' then
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
