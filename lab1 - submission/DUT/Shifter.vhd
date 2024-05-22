LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE work.aux_package.all;

--------------------------------------------------------------

ENTITY Shifter IS 
    GENERIC (
        n: INTEGER := 8; -- IO bit size, default 8
        k: INTEGER := 3  -- k=log2(n), default 3
    );
    PORT (
        y_Shifter_in: IN std_logic_vector(n-1 downto 0);
        x_Shifter_in: IN std_logic_vector(k-1 downto 0); -- Correct size for shift amount input
        ALUFN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Shifter_cout: OUT std_logic;
        Shifter_out: OUT std_logic_vector(n-1 downto 0)
    );
END Shifter;

--------------------------------------------------------------

ARCHITECTURE dataflow OF Shifter IS
    SUBTYPE vector IS std_logic_vector(n-1 downto 0);
    TYPE matrix IS ARRAY(0 TO n-1) OF vector;
    SIGNAL Shifter_cout_vector_left: std_logic_vector(n-1 downto 0);
    SIGNAL Shifter_cout_vector_right: std_logic_vector(n-1 downto 0);
    SIGNAL row_left: matrix;
    SIGNAL row_right: matrix;

BEGIN
    row_left(0) <= y_Shifter_in;
    row_right(0) <= y_Shifter_in;
	Shifter_cout_vector_left(0) <= '0';
	Shifter_cout_vector_right(0) <='0';
    SHL: for i IN 1 to n-1 generate
        row_left(i) <= row_left(i-1)(n-2 downto 0) & '0'; -- Shift left
        Shifter_cout_vector_left(i) <= row_left(i-1)(n-1); -- Collect shifted out bit
    END generate;

    SHR: for i IN 1 to n-1 generate
        row_right(i) <= '0' & row_right(i-1)(n-1 downto 1); -- Shift right
        Shifter_cout_vector_right(i) <= row_right(i-1)(0); -- Collect shifted out bit
    END generate;

    Shifter_out <= row_left(TO_INTEGER(unsigned(x_Shifter_in))) when ALUFN = "000" else
                   row_right(TO_INTEGER(unsigned(x_Shifter_in))) when ALUFN = "001" else
                   (others => '0');

    Shifter_cout <= Shifter_cout_vector_left(TO_INTEGER(unsigned(x_Shifter_in))) when ALUFN = "000" else
                    Shifter_cout_vector_right(TO_INTEGER(unsigned(x_Shifter_in))) when ALUFN = "001" else
                    '0';
END dataflow;

