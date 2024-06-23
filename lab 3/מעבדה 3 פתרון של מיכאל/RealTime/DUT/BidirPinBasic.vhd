library ieee;
use ieee.std_logic_1164.all;
USE work.aux_package.all;
-----------------------------------------------------------------
entity BidirPinBasic is
	port(   writePin: in 	std_logic;
			readPin:  out 	std_logic;
			bidirPin: inout std_logic
	);
end BidirPinBasic;  -- Was BidirPin

architecture comb of BidirPinBasic is
begin 

	readPin  <= bidirPin;
	bidirPin <= writePin;
	
end comb;
