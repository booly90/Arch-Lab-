library IEEE;
USE IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_1164.all;
USE work.aux_package.ALL;

---------------------------------
ENTITY GPI IS
	GENERIC(DataBusSize	: integer := 32);
	PORT( 
		MemRead		: IN	STD_LOGIC;
		ChipSelect	: IN 	STD_LOGIC;
		Data		: OUT	STD_LOGIC_VECTOR(DataBusSize-1 DOWNTO 0);
		GPInput		: IN	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
END GPI;
----------------------------
ARCHITECTURE structure OF GPI IS
BEGIN	
	-- read bus Tri-State controller
	Data		<= X"000000" & GPInput WHEN (MemRead AND ChipSelect) = '1' ELSE (OTHERS => 'Z');
	
END structure;