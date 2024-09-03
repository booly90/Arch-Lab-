library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

----------------------------------
ENTITY priotity_encoder IS
	GENERIC (num_intr	: integer := 6);
	PORT( 
		INT_reqs		:	IN STD_LOGIC_VECTOR(5 downto 0);
		type_signal		:	OUT STD_LOGIC_VECTOR (3 downto 0)
		);
END priotity_encoder;
----------------------------
ARCHITECTURE structure OF priotity_encoder IS

BEGIN

	type_signal  <= 	'0000' 	WHEN INT_reqs(0) = '1' ELSE -- type = X"00" 
				'0100' 	WHEN INT_reqs(1) = '1' ELSE 		-- type = X"10"
				'0101' 	WHEN INT_reqs(2) = '1' ELSE 		-- type = X"14"
				'0110' 	WHEN INT_reqs(3) = '1' ELSE 		-- type = X"18"
				'0111' 	WHEN INT_reqs(4) = '1' ELSE 		-- type = X"1c"
				'1000' 	WHEN INT_reqs(5) = '1' ELSE 		-- type = X"20" 
				'0000'                              
END ARCHITECTURE;                                   