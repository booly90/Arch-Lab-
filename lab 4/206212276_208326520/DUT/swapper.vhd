LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------------------------------------------------------------

ENTITY swapper IS
  GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
  PORT (    
    x_swapper_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --inputs for swapper
    ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
    --sub_control : IN STD_LOGIC;
    swapper_out: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0)
  );
END swapper;
--------------------------------------------------------------

ARCHITECTURE rtl OF swapper IS
	

begin

end rtl