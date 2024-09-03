library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

----------------------------------
ENTITY priotity_encoder IS
	GENERIC (num_intr	: integer := 5);
	PORT( 
		INT_reqs		:	IN STD_LOGIC_VECTOR(num_intr-1 downto 0);
		type_signal		:	OUT STD_LOGIC_VECTOR (5 downto 0)
		);
END priotity_encoder;
----------------------------
ARCHITECTURE structure OF priotity_encoder IS
signal	counter : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
BEGIN

	type_signal  <= 	
				'010000' 	WHEN INT_reqs(1) = '1' ELSE 		-- type = X"10"
				'010100' 	WHEN INT_reqs(2) = '1' ELSE 		-- type = X"14"
				'011000' 	WHEN INT_reqs(3) = '1' ELSE 		-- type = X"18"
				'011100' 	WHEN INT_reqs(4) = '1' ELSE 		-- type = X"1c"
				'100000' 	WHEN INT_reqs(5) = '1' ELSE 		-- type = X"20" 
				'000000'   			
END ARCHITECTURE;                                   