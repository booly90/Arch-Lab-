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

    COMPONENT AdderSub
        GENERIC (n : INTEGER := 8); --bit size of input and outputs signals, default is 8
        PORT (
            x_adderSub_in, y_adderSub_in: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0); --2 inputs to Add / Sub
            ALUFN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            adderSub_cout: OUT STD_LOGIC;
            adderSub_out: OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0)
        );
    END COMPONENT;

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

    COMPONENT top
        GENERIC (
            n : INTEGER := 8;
            k : INTEGER := 3;   -- k=log2(n)
            m : INTEGER := 4    -- m=2^(k-1)
        );
        PORT (
            Y_i, X_i: IN std_logic_vector (n-1 DOWNTO 0);
            ALUFN_i : IN std_logic_vector (4 DOWNTO 0);
            ALUout_o: OUT std_logic_vector (n-1 DOWNTO 0);
            Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT std_logic
        );
    END COMPONENT;

END PACKAGE aux_package;
