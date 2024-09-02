library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_GPIO_handler is
end tb_GPIO_handler;

architecture sim of tb_GPIO_handler is

    -- Component declaration for the GPIO_handler
    component GPIO_handler
        generic(
            AddrBusSize : integer := 32;
            DataBusSize : integer := 32
        );
        port(
            MemRead_Signal : in STD_LOGIC;
            clock : in STD_LOGIC;
            reset : in STD_LOGIC;
            MemWrite_Signal : in STD_LOGIC;
            AddressBus : in STD_LOGIC_VECTOR(AddrBusSize-1 DOWNTO 0);
            DataBus : inout STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
            HEX0 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX1 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX2 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX3 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX4 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            HEX5 : out STD_LOGIC_VECTOR(6 DOWNTO 0);
            LEDR : out STD_LOGIC_VECTOR(7 DOWNTO 0);
            SW : in STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    end component;

    -- Signal declarations
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal memRead : STD_LOGIC := '0';
    signal memWrite : STD_LOGIC := '0';
    signal address : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal dataBus : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
    signal hex0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal hex1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal hex2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal hex3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal hex4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal hex5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    signal ledR : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal sw : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');

    -- Clock period constant
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the GPIO_handler
    uut: GPIO_handler
        generic map (
            AddrBusSize => 32,
            DataBusSize => 32
        )
        port map (
            MemRead_Signal => memRead,
            clock => clk,
            reset => rst,
            MemWrite_Signal => memWrite,
            AddressBus => address,
            DataBus => dataBus,
            HEX0 => hex0,
            HEX1 => hex1,
            HEX2 => hex2,
            HEX3 => hex3,
            HEX4 => hex4,
            HEX5 => hex5,
            LEDR => ledR,
            SW => sw
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize inputs
        rst <= '1';
        memRead <= '0';
        memWrite <= '0';
        dataBus <= (others => '0');
        address <= (others => '0');
        sw <= (others => '0');

        -- Apply reset
        wait for clk_period;
        rst <= '0';
        wait for clk_period;

        -- Test write and read for HEX0
        memWrite <= '1';
        address <= x"00000804"; -- HEX0 Address
        dataBus <= x"12345678"; -- Data to write
        wait for clk_period;
        memWrite <= '0';
        
        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for HEX1
        memWrite <= '1';
        address <= x"00000805"; -- HEX1 Address
        dataBus <= x"9ABCDEF0"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for HEX2
        memWrite <= '1';
        address <= x"00000808"; -- HEX2 Address
        dataBus <= x"0FEDCBA9"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for HEX3
        memWrite <= '1';
        address <= x"00000809"; -- HEX3 Address
        dataBus <= x"87654321"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for HEX4
        memWrite <= '1';
        address <= x"0000080C"; -- HEX4 Address
        dataBus <= x"13579BDF"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for HEX5
        memWrite <= '1';
        address <= x"0000080D"; -- HEX5 Address
        dataBus <= x"2468ACE7"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for LEDR
        memWrite <= '1';
        address <= x"00000800"; -- LEDR Address
        dataBus <= x"0FF50005"; -- Data to write
        wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Test write and read for SW
        memWrite <= '1';
        address <= x"00000810"; -- SW Address
        dataBus <= x"F0F0F0F0"; -- Data to write
		SW 		<= X"75";
        wait for clk_period;
		dataBus <= (others => 'Z');
		wait for clk_period;
        memWrite <= '0';

        memRead <= '1';
        wait for clk_period;
        memRead <= '0';

        -- Finish simulation
        wait;
    end process;

end sim;
