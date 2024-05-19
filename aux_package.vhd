LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------

COMPONENT FA IS
	PORT (xi, yi, cin: IN std_logic;
			  s, cout: OUT std_logic);
END FA;

--------------------------------------------------------

COMPONENT AdderSub IS
  GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
  PORT (    x_adderSub_in,y_adderSub_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --2 inputs to Add / Sub
			ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            adderSub_cout: OUT STD_LOGIC;
            adderSub_out: OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
END AdderSub;

--------------------------------------------------------

COMPONENT Logic IS 
	GENERIC (n: INTEGER :=8;   --bit size of input and outputs signals, default is 8
			 OP : INTEGER :=8);--number of logical operations plus 1 (for  zeros), default is 8
	PORT (x_logic,y_logic : IN std_logic_vector (n-1 Downto 0);
		  ALUFN : IN std_logic_vector (2 Downto 0);
		  Logic_out : OUT std_logic_vector (n-1 Downto 0));
END Logic

--------------------------------------------------------

COMPONENT Shifter

END Shifter
--------------------------------------------------------

component top is
	GENERIC (n : INTEGER := 8;
		   /* k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1) */
	PORT 
	(  
		Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC 
	); 
	end top;