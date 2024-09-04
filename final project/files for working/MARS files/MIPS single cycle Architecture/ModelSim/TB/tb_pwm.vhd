LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY PWM_TB IS
END ENTITY PWM_TB;

ARCHITECTURE behavior OF PWM_TB IS
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT PWM
    PORT(
        BTCCR0 : IN STD_LOGIC_vector (31 DOWNTO 0);
        BTCCR1 : IN STD_LOGIC_vector (31 DOWNTO 0);
        BTOUTEN, RST, CLK: in STD_LOGIC;
        BTOUTMD : IN STD_LOGIC;
        PWM_OUT : out STD_LOGIC;
        BTSSEL  : IN STD_LOGIC_vector (1 DOWNTO 0);
        BTIPx   :  IN STD_LOGIC_vector (2 DOWNTO 0);
        Set_BTIFG: out STD_LOGIC
    );
    END COMPONENT;

    -- Signals to connect to the UUT
    signal BTCCR0 : STD_LOGIC_vector(31 DOWNTO 0) := (others => '0');
    signal BTCCR1 : STD_LOGIC_vector(31 DOWNTO 0) := (others => '0');
    signal BTOUTEN : STD_LOGIC := '0';
    signal RST : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal BTOUTMD : STD_LOGIC := '0';
    signal PWM_OUT : STD_LOGIC;
    signal BTSSEL : STD_LOGIC_vector(1 DOWNTO 0) := (others => '0');
    signal BTIPx : STD_LOGIC_vector(2 DOWNTO 0) := (others => '0');
    signal Set_BTIFG : STD_LOGIC;

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: PWM PORT MAP (
        BTCCR0 => BTCCR0,
        BTCCR1 => BTCCR1,
        BTOUTEN => BTOUTEN,
        RST => RST,
        CLK => CLK,
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
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Reset the system
        RST <= '1';
        wait for 20 ns;
        RST <= '0';
        wait for 20 ns;
        
        -- Set input values for first test case
        BTCCR0 <= x"0000000A";
        BTCCR1 <= x"00000005";
        BTOUTEN <= '1';
        BTOUTMD <= '0';
        BTSSEL <= "01"; -- Select mclk/2
        BTIPx <= "000"; -- Select first option for IPx
        
        -- Wait for the clock periods to see the output
        wait for 10000 ns;
        
        -- Change output mode and observe behavior
        BTOUTMD <= '1';
        wait for 10000 ns;

        -- Change BTSSEL and observe behavior
        BTSSEL <= "10"; -- Select mclk/4
        wait for 10000 ns;
		
		BTIPx <= "010";
		wait for 10000 ns;
		
		
        
        -- Add further test cases as needed
        wait;
    end process;

END ARCHITECTURE behavior;
