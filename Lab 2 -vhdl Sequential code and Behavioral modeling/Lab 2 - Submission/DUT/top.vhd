LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity top is
    generic (
        n : positive := 8;
        m : positive := 7;
        k : positive := 3 -- where k=log2(m+1)
    );
    port(
        rst, ena, clk : in std_logic;
        x : in std_logic_vector(n-1 downto 0);
        DetectionCode : in integer range 0 to 3;
        detector : out std_logic;
        out1 : out std_logic; -- x[j-1]
        out2 : out std_logic; -- x[j-2]
        valid : out std_logic
    );
end top;

architecture arc_sys of top is
    subtype vector IS std_logic_vector(n-1 downto 0);
    signal internal_SR : std_logic_vector(m-1 downto 0);
    signal out1_int, out2_int : std_logic;
    signal valid_int : std_logic;
    signal index : integer := 2;
begin

    process1 : process(clk, rst)
    begin
        if rst = '1' then
            index <= 2; -- j-2 is used, we will use for the reason 2 as initioal index.
            out1_int <= '0';
            out2_int <= '0';
        elsif rising_edge(clk) then
            if ena = '1' then
                if index < n-1 then
                    out1_int <= x(index - 1); -- x[j-1]
                    out2_int <= x(index - 2); -- x[j-2]
                    index <= index + 1;
                else
                    index <= 2;
                end if;
            end if;
        end if;
    end process;

    -- Assign internal signals to output ports of process 2
    out1 <= out1_int;
    out2 <= out2_int;

    -- Process2
    process2 : process(out1_int, out2_int, DetectionCode)
    begin
        if rst = '1' then
            valid_int <= '0';
        else
            case DetectionCode is
                when 0 =>
                    if (to_integer(unsigned(out1_int)) - to_integer(unsigned(out2_int))) = 1 then
                        valid_int <= '1';
                    else
                        valid_int <= '0';
                    end if;
                when 1 =>
                    if (to_integer(unsigned(out1_int)) - to_integer(unsigned(out2_int))) = 2 then
                        valid_int <= '1';
                    else
                        valid_int <= '0';
                    end if;
                when 2 =>
                    if (to_integer(unsigned(out1_int)) - to_integer(unsigned(out2_int))) = 3 then
                        valid_int <= '1';
                    else
                        valid_int <= '0';
                    end if;
                when 3 =>
                    if (to_integer(unsigned(out1_int)) - to_integer(unsigned(out2_int))) = 4 then
                        valid_int <= '1';
                    else
                        valid_int <= '0';
                    end if;
                when others =>
                    valid_int <= '0';
            end case;
        end if;
    end process;

    -- Assign internal valid signal to output port
    valid <= valid_int;

    -- Process3: Shift Register
    process3 : process(clk, rst)
    begin
        if rst = '1' then
            internal_SR <= (others => '0');
        elsif ena = '0' then
            internal_SR <= internal_SR;
        elsif rising_edge(clk) then
            internal_SR(0) <= din;
            for i in 0 to n-2 loop
                internal_SR(i+1) <= internal_SR(i);
            end loop;
        end if;
    end process;

    -- Detector Logic
    detector <= (valid & internal_SR) = (m downto 0 => '1');

end arc_sys;