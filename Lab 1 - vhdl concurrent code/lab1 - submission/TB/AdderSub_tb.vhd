library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
entity tb_AddSub is
    constant n : integer := 8;
    constant k : integer := 3;   -- k=log2(n)
    constant m : integer := 4;   -- m=2^(k-1)
end tb_AddSub;
------------------------------------------------------------------------------
architecture rtb of tb_AddSub is

    COMPONENT AdderSub IS 
        GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
        PORT (    
            x_adderSub_in, y_adderSub_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --inputs for adderSub
            ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            adderSub_cout: OUT STD_LOGIC;
            adderSub_out: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
        );
    END COMPONENT;

    subtype vector IS STD_LOGIC_VECTOR(n-1 DOWNTO 0);
    signal ALUFN : STD_LOGIC_VECTOR (2 DOWNTO 0);
    signal x_adderSub_in : vector; --can be inverted with cin signal for sub op
    signal y_adderSub_in : vector; --gated to be 'b0 for neg op
    signal adderSub_out : vector;
    signal adderSub_cout : STD_LOGIC;
begin
    --------- start of stimulus section ---------------------------------------        
    tb_AddSub_inputs : process
    begin
        ------- NOT testing -------
        x_adderSub_in <= (others => '0');
        y_adderSub_in <= (others => '1');
        for i in 0 to 255 loop
			wait for 50 ns;   ---- Output: "00000000"
			y_adderSub_in <= y_adderSub_in + 3;
			x_adderSub_in <= x_adderSub_in + 2;
        end loop;      
        wait;
    end process;
         
    tb_ALUFN : process
    begin
        ALUFN <= (others => '0');
        for i in 0 to 63 loop
            wait for 200 ns;
            ALUFN <= ALUFN + 1;
        end loop;
        wait;
    end process;

    UUT: AdderSub    
        GENERIC MAP (n => 8)
        PORT MAP (
            x_adderSub_in => x_adderSub_in,
            y_adderSub_in => y_adderSub_in,
            ALUFN => ALUFN,
            adderSub_cout => adderSub_cout,
            adderSub_out => adderSub_out
        );

end architecture rtb;
