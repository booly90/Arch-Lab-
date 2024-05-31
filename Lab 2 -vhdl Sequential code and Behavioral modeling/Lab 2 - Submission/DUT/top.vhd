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
        out1 : out std_logic_vector(n-1 downto 0); -- x[j-1]
        out2 : out std_logic_vector(n-1 downto 0); -- x[j-2]
        valid : out std_logic
    );
end top;

architecture arc_sys of top is
    signal internal_SR : std_logic_vector(m-1 downto 0);
    signal out1_int, out2_int : std_logic_vector(n-1 downto 0);
    signal valid_int : std_logic;
	signal adder_in : std_logic_vector(n-1 downto 0);
	signal sum_2_DetCode : std_logic_vector(n-1 downto 0); --sum of adder_in and out_2
	signal carry : std_logic;
begin

    process1 : process(clk, rst)
	variable prev_x, prev_prev_x : std_logic_vector(n-1 downto 0);
    begin
	
        if rst = '1' then
            out1_int <= (others => '0');
            out2_int <= (others => '0');
            prev_x := (others => '0');
			prev_prev_x:= (others => '0');
			
        elsif rising_edge(clk) then
            if ena = '1' then
                -- Update previous values
                prev_prev_x:= prev_x;
				prev_x := x;

                -- Update outputs
				out2_int <= prev_prev_x; -- x[j-2]
				out1_int <= prev_x; -- x[j-1]
                    
                else
                    out1_int <= (others => '0');
                    out2_int <= (others => '0');
                end if;
                
            end if;
        end if;
    end process;

    -- Assign internal signals to output ports
    out1 <= out1_int;
    out2 <= out2_int;

    -- Process2: Detection Logic
	

		
    process2 : process(out1_int, out2_int, DetectionCode)
    begin
		case DetectionCode is
            when 0 =>
                adder_in <= (n-1 downto 1 => '0') & '1';
            when 1 =>
                adder_in <= (n-1 downto 2 => '0') & '1' & '0';
            when 2 =>
                adder_in <= (n-1 downto 2 => '0') & '1' & '0';
            when 3 =>
                adder_in <= (n-1 downto 2 => '0') & '1' & '1';
            when others =>
                adder_in <= (others => '0');
        end case;

		
		sum: Adder GENERIC MAP(n) 
			PORT MAP(out2, adder_in, '0', sum_2_DetCode, carry);
			


        if sum_2_DetCode = Q1 then
            valid <= '1';  -- x(j-1) - x(j-2) = DetectionCode 
        else
            valid <= '0';  --x(j-1) - x(j-2) != DetectionCode 
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
