library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- For std_logic_vector arithmetic

entity ALU_tb is
end ALU_tb;

architecture behavior of ALU_tb is
    constant bus_size : integer := 16;
    
    signal A, B : std_logic_vector(bus_size-1 downto 0);
    signal OPC : std_logic_vector(3 downto 0);
    signal Cflag, Zflag, Nflag : std_logic;
    signal C : std_logic_vector(bus_size-1 downto 0);

    -- Component Declaration for the ALU
    component ALU
        generic(bus_size : integer := 16);
        port(
            A, B : in std_logic_vector(bus_size-1 downto 0);
            OPC : in std_logic_vector(3 downto 0);
            Cflag, Zflag, Nflag : out std_logic;
            C : out std_logic_vector(bus_size-1 downto 0)
        );
    end component;

begin
    -- Instantiate the ALU
    uut: ALU
        generic map(bus_size => bus_size)
        port map(
            A => A,
            B => B,
            OPC => OPC,
            Cflag => Cflag,
            Zflag => Zflag,
            Nflag => Nflag,
            C => C
        );

    -- Test Process
    stim_proc: process
    begin
        -- Test case 1: A + B
        A <= std_logic_vector(to_unsigned(10, bus_size));  -- 10
        B <= std_logic_vector(to_unsigned(5, bus_size));   -- 5
        OPC <= "0000";  -- A + B
        wait for 10 ns;

        -- Test case 2: A - B
        A <= std_logic_vector(to_unsigned(10, bus_size));  -- 10
        B <= std_logic_vector(to_unsigned(5, bus_size));   -- 5
        OPC <= "0001";  -- A - B
        wait for 10 ns;

        -- Test case 3: A and B
        A <= std_logic_vector(to_unsigned(10, bus_size));  -- 1010 in binary
        B <= std_logic_vector(to_unsigned(5, bus_size));   -- 0101 in binary
        OPC <= "0010";  -- A and B
        wait for 10 ns;

        -- Test case 4: A or B
        A <= std_logic_vector(to_unsigned(10, bus_size));  -- 1010 in binary
        B <= std_logic_vector(to_unsigned(5, bus_size));   -- 0101 in binary
        OPC <= "0011";  -- A or B
        wait for 10 ns;

        -- Test case 5: A xor B
        A <= std_logic_vector(to_unsigned(10, bus_size));  -- 1010 in binary
        B <= std_logic_vector(to_unsigned(5, bus_size));   -- 0101 in binary
        OPC <= "0100";  -- A xor B
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end behavior;
