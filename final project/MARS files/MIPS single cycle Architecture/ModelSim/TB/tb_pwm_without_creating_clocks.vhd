LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_PWM IS
END ENTITY tb_PWM;

ARCHITECTURE behavior OF tb_PWM IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PWM
    PORT(
        BTCCR0 : IN std_logic_vector(31 downto 0);
        BTCCR1 : IN std_logic_vector(31 downto 0);
        BTOUTEN : IN std_logic;
        RST : IN std_logic;
        CLK : IN std_logic;
        clk_2 : IN std_logic;
        clk_4 : IN std_logic;
        clk_8 : IN std_logic;
        BTOUTMD : IN std_logic;
        PWM_OUT : OUT std_logic;
        BTSSEL : IN std_logic_vector(1 downto 0);
        BTIPx : IN std_logic_vector(2 downto 0);
        Set_BTIFG : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal BTCCR0 : std_logic_vector(31 downto 0) := (others => '0');
    signal BTCCR1 : std_logic_vector(31 downto 0) := (others => '0');
    signal BTOUTEN : std_logic := '0';
    signal RST : std_logic := '0';
    signal CLK : std_logic := '0';
    signal clk_2 : std_logic := '0';
    signal clk_4 : std_logic := '0';
    signal clk_8 : std_logic := '0';
    signal BTOUTMD : std_logic := '0';
    signal BTSSEL : std_logic_vector(1 downto 0) := (others => '0');
    signal BTIPx : std_logic_vector(2 downto 0) := (others => '0');

    -- Outputs
    signal PWM_OUT : std_logic;
    signal Set_BTIFG : std_logic;

    -- Clock period definitions
    constant CLK_period : time := 10 ns;
    constant CLK2_period : time := 20 ns;
    constant CLK4_period : time := 40 ns;
    constant CLK8_period : time := 80 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: PWM PORT MAP (
        BTCCR0 => BTCCR0,
        BTCCR1 => BTCCR1,
        BTOUTEN => BTOUTEN,
        RST => RST,
        CLK => CLK,
        clk_2 => clk_2,
        clk_4 => clk_4,
        clk_8 => clk_8,
        BTOUTMD => BTOUTMD,
        PWM_OUT => PWM_OUT,
        BTSSEL => BTSSEL,
        BTIPx => BTIPx,
        Set_BTIFG => Set_BTIFG
    );

    -- Clock process definitions
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    clk_2_process :process
    begin
        clk_2 <= '0';
        wait for CLK2_period/2;
        clk_2 <= '1';
        wait for CLK2_period/2;
    end process;

    clk_4_process :process
    begin
        clk_4 <= '0';
        wait for CLK4_period/2;
        clk_4 <= '1';
        wait for CLK4_period/2;
    end process;

    clk_8_process :process
    begin
        clk_8 <= '0';
        wait for CLK8_period/2;
        clk_8 <= '1';
        wait for CLK8_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize Inputs
        BTCCR0 <= x"00000010"; -- Set some initial compare values
        BTCCR1 <= x"00000008";
        BTOUTEN <= '1';
        BTOUTMD <= '0';
        BTSSEL <= "00";
        BTIPx <= "000";
        RST <= '1';
        wait for 20 ns;

        -- Release Reset
        RST <= '0';
        wait for 100 ns;

        -- Test Case 1: BTSSEL = "00", BTIPx = "000"
        BTSSEL <= "00";
        BTIPx <= "000";
        wait for 1000 ns;

        -- Test Case 2: BTSSEL = "01", BTIPx = "001"
        BTSSEL <= "01";
        BTIPx <= "001";
        wait for 1000 ns;

        -- Test Case 3: BTSSEL = "10", BTIPx = "010"
        BTSSEL <= "10";
        BTIPx <= "010";
        wait for 1000 ns;

        -- Test Case 4: BTSSEL = "11", BTIPx = "011"
        BTSSEL <= "11";
        BTIPx <= "011";
        wait for 1000 ns;

        -- Test Case 5: BTOUTMD = '1' (Toggle output mode)
        BTOUTMD <= '1';
        wait for 1000 ns;

        -- Test Case 6: BTOUTEN = '0' (Disable output)
        BTOUTEN <= '0';
        wait for 1000 ns;

        -- Test Case 7: Change BTCCR0 and BTCCR1
        BTOUTEN <= '1';
        BTCCR0 <= x"00000020"; -- Increase BTCCR0
        BTCCR1 <= x"00000010"; -- Increase BTCCR1
        wait for 1000 ns;

        -- Test Case 8: Change BTIPx to "100" (Increasing interval)
        BTIPx <= "100";
        wait for 1000 ns;

        -- Test Case 9: Simulate a reset during operation
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 100 ns;

        -- Test Case 10: Change BTSSEL to "00" and BTIPx to "000" for normal operation
        BTSSEL <= "00";
        BTIPx <= "000";
        wait for 1000 ns;

        -- End simulation
        wait;
    end process;

END ARCHITECTURE behavior;
