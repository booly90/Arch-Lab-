LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
--------------------------------------------------------------

component top is
	GENERIC (n : INTEGER := 8;
		   /* k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1) */
	PORT 
	(  
		Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		Nflag_out,Cflag_out,Zflag_out,Vflag_out: OUT STD_LOGIC 
	); 
	end top;
	
--------------------------------------------------------------
 ARCHITECTURE top of top IS 
 