LIBRARY ieee;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;

entity top is
    generic (
        n : positive := 8;
        m : positive := 7;
        k : positive := 3
    );
    port(
        rst, ena, clk : in std_logic;
        x : in std_logic_vector(n-1 downto 0);
        DetectionCode : in integer range 0 to 3;
        detector : out std_logic;
        out1 : out std_logic_vector(n-1 downto 0);
        out2 : out std_logic_vector(n-1 downto 0);
        valid_out : in std_logic
    );
end top;

architecture arc_sys of top is
    signal internal_SR : std_logic_vector(m-1 downto 0);
    signal out1_int, out2_int : std_logic_vector(n-1 downto 0);
    signal valid_int : std_logic;
    signal adder_in : std_logic_vector(n-1 downto 0);
    signal sum_2_DetCode : std_logic_vector(n-1 downto 0);
    signal carry : std_logic;
begin

    process(clk, rst)
        variable prev_x, prev_prev_x : std_logic_vector(n-1 downto 0);
    begin
        if rst = '1' then
            out1_int <= (others => '0');
            out2_int <= (others => '0');
            prev_x := (others => '0');
            prev_prev_x := (others => '0');
        elsif rising_edge(clk) then
            if ena = '1' then
                prev_prev_x := prev_x;
                prev_x := x;

                out2_int <= prev_prev_x;
                out1_int <= prev_x;
            else
                out1_int <= (others => '0');
                out2_int <= (others => '0');
            end if;
        end if;
    end process;

    out1 <= out1_int;
    out2 <= out2_int;

    process(DetectionCode)
    begin
        case DetectionCode is
            when 0 =>
                adder_in <= (n-1 downto 1 => '0') & '1';
            when 1 =>
                adder_in <= (n-1 downto 2 => '0') & '1' & '0';
            when 2 =>
                adder_in <= (n-1 downto 2 => '0') & '1' & '1';
            when 3 =>
                adder_in <= (n-1 downto 3 => '0') & '1' & '0' & '0';
            when others =>
                adder_in <= (others => '0');
        end case;
	end process;
	
	sum: Adder GENERIC MAP(n) 
		PORT MAP(out2_int, adder_in, '0', sum_2_DetCode, carry);
	
	
	process(out1_int, out2_int)
	begin


        if sum_2_DetCode = out1_int then
            valid_int <= '1';
        else
            valid_int <= '0';
        end if;
    end process;




-- process 3

    process (clk, rst, ena, valid_int)
        variable counter : integer := 0;
    begin
        if rst = '1' then
            detector <= '0';
            counter := 0;
        elsif rising_edge(clk) and ena = '1' then
            if valid_int = '1' then
                counter := counter + 1;
            else
                counter := 0;
            end if;

            if counter >= m then
                detector <= '1';
            else
                detector <= '0';
            end if;
        end if;
    end process;
end arc_sys;

