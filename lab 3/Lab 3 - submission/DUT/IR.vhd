LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use work.aux_package.all;
----------------------------------------
entity IR is
	generic(Awidth 	  : integer := 16;
			RFAdWidth   : integer := 4;
			offsetSize: integer := 8;
			immSize   : integer := 8
			);
	port(
	----inputs
	--
	----outputs
	--		IR_op 		: std_logic_vector
	--		
	--		PMdataOut
	--		
	----control signals
	--		IRin
	--		RFaddr
	--	);
end IR
	
	