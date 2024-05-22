library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
entity tb_Logic is
	constant n : integer := 8;
	constant k : integer := 3;   -- k=log2(n)
	constant m : integer := 4;   -- m=2^(k-1)
	
end tb_Logic;
------------------------------------------------------------------------------
architecture rtb of tb_Logic is

   COMPONENT Logic IS 
	GENERIC (
				n: INTEGER :=8;   --bit size of input and outputs signals, default is 8
				OP : INTEGER :=8  --number of logical operations plus 1 (for  zeros), default is 8
				);
	PORT(
			x_logic,y_logic : IN std_logic_vector (n-1 Downto 0);
			ALUFN : IN std_logic_vector (2 Downto 0);
			Logic_out : OUT std_logic_vector (n-1 Downto 0)
		);
END Logic
	
	

	signal y_logic, x_logic, Logic_out: std_logic_vector(n-1 DOWNTO 0);
    signal ALUFN: std_logic_vector(k-1 DOWNTO 0);      
    begin
	L0 : Logic generic map (n,k,m) port map(y_logic, x_logic, ALUFN, Logic_out);
    
	--------- start of stimulus section ---------------------------------------		
        tb_xy_inputs : process
        begin
            ------- NOT testing -------
        
		  x_logic <= (others => '0');
		  y_logic <= (others => '1');
          for j in 0 to 7 loop
            for k in 0 to 3 loop
		        wait for 50 ns;   ---- Output: "00000000"
                 y_logic <= y_logic + 3;
                 x_logic <= x_logic + 2;
                end loop;
          end loop;      
        wait;

        end process;
		 
		
		tb_ALUFN : process
        begin

        ALUFN <= (others => '0');
        for i in 0 to 7 loop
        wait for 200 ns;
         ALUFN <= ALUFN + 1;
         end loop;
         wait;
     
--- tb of 1600 ns ---

        end process;
  
end architecture rtb;
