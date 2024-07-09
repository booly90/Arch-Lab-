library IEEE;
use ieee.std_logic_1164.all;

package aux_package is
--------------------------------------------------------
	component ALU is
	GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
	PORT 
	(  
		Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		Nflag_o,Cflag_o,Zflag_o: OUT STD_LOGIC
	); 
	end component;
------------Full-Adder component-------------------------------  
	component FA is
		PORT (xi, yi, cin: IN std_logic;
			      s, cout: OUT std_logic);
	end component;
-------------Adder/Subtractor component------------------------
	component AdderSub IS
	GENERIC (n : INTEGER := 8);
	PORT (x,y	  :	IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		 sub_cont :	IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         cout	  :	OUT STD_LOGIC;
         s		  :	OUT STD_LOGIC_VECTOR(n-1 downto 0));
	END component;
-----------Shifter component-----------------------------------
	component Shifter IS
	GENERIC (	n	: INTEGER := 8;
			k	: INTEGER := 3);
	PORT (X,Y	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		  dir	: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
          cout	: OUT STD_LOGIC;
          res	: OUT STD_LOGIC_VECTOR(n-1 downto 0));
	END component;
------------Logic component-------------------------------------
	component Logic IS
	  GENERIC (	n	: INTEGER := 8);
	  PORT (X,Y	: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			FN	: IN STD_LOGIC_VECTOR (2 DOWNTO 0);
			res	: OUT STD_LOGIC_VECTOR(n-1 downto 0));
	END component;
------------Top IO Interface component-------------------------------------
	component TopIO_Interface IS
	GENERIC (	HEX_num : integer := 7;
				n : INTEGER := 8
				); 
	PORT (
			clk  : in std_logic; 
			SW_i : in std_logic_vector(n-1 downto 0);
			KEY0, KEY1, KEY2 : in std_logic;
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(HEX_num-1 downto 0);
			LEDs : out std_logic_vector(9 downto 0)  
	);
	END component;
------------7 Segment component-------------------------------------
	component SevenSegDecoder IS
	GENERIC (	n			: INTEGER := 4;
				SegmentSize	: integer := 7);
	PORT (data		: in STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			seg			: out STD_LOGIC_VECTOR (0 to SegmentSize-1));
	END component;
------------ALU Performance Test Case component-------------------------------------
	component topPureLogicWithoutPLL IS
	GENERIC (	
				n : INTEGER := 8
				); 
	PORT (
			clk  : in std_logic; 
			X, Y : in std_logic_vector(n-1 downto 0);
			ALUFN: in std_logic_vector(4 downto 0);
			ALUout : out std_logic_vector(n-1 downto 0);
			Zflag, Cflag, Nflag : out std_logic
	);
	END component;
	
----------------- ALU Performance Test Case component with PLL ------
	component topPureLogic IS
	  GENERIC (	
				n : INTEGER := 8
				); 
	  PORT (
			  clk_i  : in std_logic; 
			  X, Y : in std_logic_vector(n-1 downto 0);
			  ALUFN: in std_logic_vector(4 downto 0);
			  ALUout : out std_logic_vector(n-1 downto 0);
			  Zflag, Cflag, Nflag : out std_logic
	  );
	END component;

-----------------------------------------------------------------------------------

end aux_package;

