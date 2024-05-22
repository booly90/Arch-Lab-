library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
entity tb_top is
    constant n : integer := 8;
    constant k : integer := 3;   -- k=log2(n)
    constant m : integer := 4;   -- m=2^(k-1)
end tb_top;
------------------------------------------------------------------------------
architecture rtb of tb_top is
signal 	Y_i,X_i: STD_LOGIC_VECTOR (n-1 DOWNTO 0);	
signal ALUFN_i : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal ALUout_o:  STD_LOGIC_VECTOR(n-1 downto 0);
signal Nflag_o,Cflag_o,Zflag_o,Vflag_o:  STD_LOGIC;


begin
    --------- start of stimulus section ---------------------------------------        
    tb_top_inputs : process
    begin
        ------- NOT testing -------
        X_i <= (others => '0');
        Y_i <= (others => '1');
        for i in 0 to 255 loop
			wait for 50 ns;   ---- Output: "00000000"
			Y_i <= Y_i + 3;
			X_i <= X_i + 2;
        end loop;      
        wait;
    end process;
         
    tb_ALUFN_i : process
    begin
        ALUFN_i <= (others => '0');
        for i in 0 to 31 loop
            wait for 400 ns;
            ALUFN_i <= ALUFN_i + 1;
        end loop;
        wait;
    end process;

    UUT: top    
        GENERIC MAP (n => 8)
        PORT MAP (
            X_i => X_i,
            Y_i => Y_i,
            ALUFN_i => ALUFN_i,
			Vflag_o => Vflag_o,
			Cflag_o => Cflag_o,
			Nflag_o => Nflag_o,
			Zflag_o => Zflag_o,
			ALUout_o => ALUout_o
        );

end architecture rtb;
