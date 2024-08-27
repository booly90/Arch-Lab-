LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_Execute IS
END tb_Execute;

ARCHITECTURE behavior OF tb_Execute IS
    -- Signal declarations
    signal Read_data_1      : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    signal Read_data_2      : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    signal Sign_extend      : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    signal Function_opcode  : STD_LOGIC_VECTOR( 5 DOWNTO 0 );
    signal ALUOp            : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
    signal ALUSrc           : STD_LOGIC;
    signal Zero             : STD_LOGIC;
    signal ALU_Result       : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    signal Add_Result       : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
    signal PC_plus_4        : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
    signal clock, reset     : STD_LOGIC;
    signal opcode           : STD_LOGIC_VECTOR( 5 DOWNTO 0 );

BEGIN
    -- Instantiate the Execute module
    UUT: entity work.Execute
    PORT MAP (
        Read_data_1     => Read_data_1,
        Read_data_2     => Read_data_2,
        Sign_extend     => Sign_extend,
        Function_opcode => Function_opcode,
        ALUOp           => ALUOp,
        ALUSrc          => ALUSrc,
        Zero            => Zero,
        ALU_Result      => ALU_Result,
        Add_Result      => Add_Result,
        PC_plus_4       => PC_plus_4,
        clock           => clock,
        reset           => reset,
        opcode          => opcode
    );
	
    -- Clock generation
    gen_clk: process
    begin
        clock <= '0';
        wait for 50 ns;
        clock <= '1';
        wait for 50 ns;
    end process;

    -- Reset generation
    gen_reset: process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize signals
        PC_plus_4 <= (others => '0');
        Read_data_1 <= X"00000000";
        Read_data_2 <= X"00000000";
        Sign_extend <= X"00000000";
        ALUSrc <= '0';
        ALUOp <= "00";
        Function_opcode <= "000000";
        opcode <= "000000";

        wait for 100 ns;

        -- Test Case 1: ADD R-type (opcode = 000000, function = 100000)
        Read_data_1 <= X"00000005";
        Read_data_2 <= X"00000003";
        Function_opcode <= "100000"; -- ADD
        opcode <= "000000";          -- R-type
        wait for 100 ns;
        assert (ALU_Result = X"00000008") report "Test Case 1 Failed" severity error;

        -- Test Case 2: SUB R-type (opcode = 000000, function = 100010)
        Function_opcode <= "100010"; -- SUB
        wait for 100 ns;
        assert (ALU_Result = X"00000002") report "Test Case 2 Failed" severity error;

        -- Test Case 3: ADDI I-type (opcode = 001000)
        opcode <= "001000"; -- ADDI
        ALUSrc <= '1';
        Sign_extend <= X"00000003";
        wait for 100 ns;
        assert (ALU_Result = X"00000008") report "Test Case 3 Failed" severity error;

        -- Test Case 4: MULT R-type (opcode = 011100, function = N/A)
        opcode <= "011100"; -- MULT
        ALUSrc <= '0';
        wait for 100 ns;
        assert (ALU_Result = X"0000000F") report "Test Case 4 Failed" severity error;

        -- Test Case 5: AND R-type (opcode = 000000, function = 100100)
        Read_data_1 <= X"0000000F";
        Read_data_2 <= X"000000F0";
        Function_opcode <= "100100"; -- AND
        opcode <= "000000";          -- R-type
        wait for 100 ns;
        assert (ALU_Result = X"00000000") report "Test Case 5 Failed" severity error;

        -- Test Case 6: OR R-type (opcode = 000000, function = 100101)
        Function_opcode <= "100101"; -- OR
        wait for 100 ns;
        assert (ALU_Result = X"000000FF") report "Test Case 6 Failed" severity error;

        -- Test Case 7: XOR R-type (opcode = 000000, function = 100110)
        Function_opcode <= "100110"; -- XOR
        wait for 100 ns;
        assert (ALU_Result = X"000000FF") report "Test Case 7 Failed" severity error;
		
		
		ALUSrc <='1';
		wait for 100 ns;
		
        -- Test Case 8: ANDI I-type (opcode = 001100)
        opcode <= "001100"; -- ANDI
        Sign_extend <= X"0000000F";
        wait for 100 ns;
        assert (ALU_Result = X"0000000F") report "Test Case 8 Failed" severity error;
 
        -- Test Case 9: ORI I-type (opcode = 001101)
        opcode <= "001101"; -- ORI
        Sign_extend <= X"000000F0";
        wait for 100 ns;
        assert (ALU_Result = X"000000FF") report "Test Case 9 Failed" severity error;

        -- Test Case 10: XORI I-type (opcode = 001110)
        opcode <= "001110"; -- XORI
        Sign_extend <= X"000000F0";
        wait for 100 ns;
        assert (ALU_Result = X"000000FF") report "Test Case 10 Failed" severity error;

        -- Test Case 11: SLL R-type (opcode = 000000, function = 000000)
        Read_data_1 <= X"00000001";
        Read_data_2 <= X"00000002";
        Function_opcode <= "000000"; -- SLL
        opcode <= "000000";          -- R-type
        wait for 100 ns;
        assert (ALU_Result = X"00000010") report "Test Case 11 Failed" severity error;

        -- Test Case 12: SRL R-type (opcode = 000000, function = 000010)
        Function_opcode <= "000010"; -- SRL
		Read_data_2 <= X"abcd1234";
        wait for 100 ns;
        assert (ALU_Result = X"1579a246") report "Test Case 12 Failed" severity error;

        -- Test Case 13: LW I-type (opcode = 100011)
        opcode <= "100011"; -- LW
        Sign_extend <= X"00000004";
        ALUSrc <= '1';
        wait for 100 ns;
        assert (ALU_Result = X"00000005") report "Test Case 13 Failed" severity error;

        -- Test Case 14: SW I-type (opcode = 101011)
        opcode <= "101011"; -- SW
        wait for 100 ns;
        assert (ALU_Result = X"00000005") report "Test Case 14 Failed" severity error;

        -- Test Case 15: LUI I-type (opcode = 001111)
        opcode <= "001111"; -- LUI
        Sign_extend <= X"00001234";
        wait for 100 ns;
        assert (ALU_Result = X"12340000") report "Test Case 15 Failed" severity error;
		
		
		ALUSrc <= '0' ;
		wait for 100 ns;
        -- Test Case 16: BEQ I-type (opcode = 000100)
        Read_data_1 <= X"0000000A";
        Read_data_2 <= X"0000000A";
        opcode <= "000100"; -- BEQ
        wait for 100 ns;
        assert (Zero = '1') report "Test Case 16 Failed" severity error;

        -- Test Case 17: BNE I-type (opcode = 000101)
        Read_data_2 <= X"0000000B";
        opcode <= "000101"; -- BNE
        wait for 100 ns;
        assert (Zero = '0') report "Test Case 17 Failed" severity error;

        
		ALUSrc <= '1';
		wait for 100 ns;
		-- Test Case 18: SLT R-type (opcode = 000000, function = 101010)
        Read_data_1 <= X"00000001";
        Read_data_2 <= X"00000002";
        Function_opcode <= "101010"; -- SLT
        opcode <= "000000";          -- R-type
        wait for 100 ns;
        assert (ALU_Result(0) = '1') report "Test Case 18 Failed" severity error;

        -- Test Case 19: SLTI I-type (opcode = 001010)
        opcode <= "001010"; -- SLTI
        Sign_extend <= X"00000003";
        wait for 100 ns;
        assert (ALU_Result(0) = '1') report "Test Case 19 Failed" severity error;

        wait;
    end process;
END behavior;
