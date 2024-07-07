LIBRARY ieee;
USE ieee.std_logic_1164.all;

--------------------------------------------------------

PACKAGE aux_package IS

    COMPONENT FA
        PORT (
            xi, yi, cin: IN std_logic;
            s, cout: OUT std_logic
        );
    END COMPONENT;
	
------------------------------------------------------------------------------

    COMPONENT AdderSub
        GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
        PORT (
            x_adderSub_in, y_adderSub_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --2 inputs to Add / Sub
            ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            adderSub_cout: OUT STD_LOGIC;
            adderSub_out: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
        );
    END COMPONENT;

------------------------------------------------------------------------------

    COMPONENT Logic
        GENERIC (
            n: INTEGER := 8;   --bit size of input and outputs signals, default is 8
            OP : INTEGER := 8  --number of logical operations plus 1 (for zeros), default is 8
        );
        PORT (
            x_logic, y_logic : IN std_logic_vector (n-1 DOWNTO 0);
            ALUFN : IN std_logic_vector (2 DOWNTO 0);
            Logic_out : OUT std_logic_vector (n-1 DOWNTO 0)
        );
    END COMPONENT;

------------------------------------------------------------------------------

    COMPONENT Shifter
        GENERIC (
            n: INTEGER := 8 ; --IO bit size, default 8
            k: INTEGER := 3   --k=log2(n), default 3
        );
        PORT (
            y_Shifter_in: IN std_logic_vector (n-1 DOWNTO 0);
            x_Shifter_in: IN std_logic_vector (k-1 DOWNTO 0);
            ALUFN : IN std_logic_vector (2 DOWNTO 0);
            Shifter_cout: OUT std_logic;
            Shifter_out: OUT std_logic_vector (n-1 DOWNTO 0)
        );
    END COMPONENT;

------------------------------------------------------------------------------

    COMPONENT top
  GENERIC (n : INTEGER := 8;
           k : integer := 3;   -- k=log2(n)
           m : integer := 4 ); -- m=2^(k-1)
  PORT 
  (  
    Y_i, X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
    ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0); --5 bit vector
    ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
    Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT STD_LOGIC;
    ena, rst, clk : in STD_LOGIC;
    PWM_OUT : out STD_LOGIC
  ); -- Zflag, Cflag, Nflag, Vflag
    END COMPONENT;
	
------------------------------------------------------------------------------	

COMPONENT PWM IS
  GENERIC (n : INTEGER := 8;
           k : integer := 3;   -- k=log2(n)
           m : integer := 4 ); -- m=2^(k-1)

  PORT
  (
    Y_PWM_in, X_PWM_in : IN STD_LOGIC_vector (n-1 DOWNTO 0);
    ena, rst, clk: in STD_LOGIC;
    ALUFN : IN  STD_LOGIC_vector (4 DOWNTO 0);
    PWM_OUT : out STD_LOGIC
  );

end COMPONENT;

------------------------------------------------------------------------------

COMPONENT counter
generic(L :integer := 6 );
port(
	clk,enable : in std_logic;	
	q          : out std_logic);
end COMPONENT;
	
------------------------------------------------------------------------------	
	
	COMPONENT TopIO_Interface
	  GENERIC (	HEX_num : integer := 7;
			n : INTEGER := 8
			); 
  PORT (
		  PIN_AF14, SW8  : in std_logic; 
		  SW_i : in std_logic_vector(n-1 downto 0);
		  KEY0, KEY1, KEY2, KEY3: in std_logic;
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(HEX_num-1 downto 0);
		  LEDs : out std_logic_vector(9 downto 0) ;
		  PWM_OUT : OUT std_logic
  );
	END COMPONENT;

------------------------------------------------------------------------------

COMPONENT ALU IS
  GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
  PORT 
  (  
	Y_i,X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
	ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0);
	ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
	Nflag_o,Cflag_o,Zflag_o,Vflag_o: OUT STD_LOGIC
  ); -- Zflag,Cflag,Nflag,Vflag
END COMPONENT;
------------------------------------------------------------------------------

component pll is
	port (
		locked   : out std_logic;        --  locked.export
		outclk_0 : out std_logic;        -- outclk0.clk
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'  --   reset.reset
	);
end component pll;
	
	------------------------------------------------------------------------------
	
	COMPONENT CounterEnvelope is 
	generic(L :integer := 6 );
	port (
	Clk,En : in std_logic;	
	Qout          : out std_logic
	);
end COMPONENT;
	
	
END PACKAGE ;
