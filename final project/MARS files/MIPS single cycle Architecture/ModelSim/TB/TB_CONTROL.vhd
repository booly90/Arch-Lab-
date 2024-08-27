LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY tb_control IS
END tb_control;

ARCHITECTURE behavior OF tb_control IS
    -- Signal declarations
    signal Opcode       : STD_LOGIC_VECTOR( 5 DOWNTO 0 );
    signal Funct        : STD_LOGIC_VECTOR( 5 DOWNTO 0 );
    signal RegDst       : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
    signal ALUSrc       : STD_LOGIC;
    signal MemtoReg     : STD_LOGIC_VECTOR( 1 DOWNTO 0 );
    signal RegWrite     : STD_LOGIC;
    signal MemRead      : STD_LOGIC;
    signal MemWrite     : STD_LOGIC;
    signal BranchEq     : STD_LOGIC;
    signal BranchNe     : STD_LOGIC;
    signal Jump         : STD_LOGIC;
    signal Jal          : STD_LOGIC;
    signal Jr           : STD_LOGIC;
    signal clock, reset : STD_LOGIC;

BEGIN
    -- Instantiate the Control module
    UUT: entity work.control
    PORT MAP (
        Opcode      => Opcode,
        Funct       => Funct,
        RegDst      => RegDst,
        ALUSrc      => ALUSrc,
        MemtoReg    => MemtoReg,
        RegWrite    => RegWrite,
        MemRead     => MemRead,
        MemWrite    => MemWrite,
        BranchEq    => BranchEq,
        BranchNe    => BranchNe,
        Jump        => Jump,
        Jal         => Jal,
        Jr          => Jr,
        clock       => clock,
        reset       => reset
    );

   ---- Clock generation
   --gen_clk: process
   --begin
   --    clock <= '0';
   --    wait for 50 ns;
   --    clock <= '1';
   --    wait for 50 ns;
   --end process;
   --
   ---- Reset generation
   --gen_reset: process
   --begin
   --    reset <= '1';
   --    wait for 100 ns;
   --    reset <= '0';
   --    wait;
   --end process;

    -- Stimulus process
    stimulus: process
    begin
        -- Initialize signals
        Opcode <= (others => '0');
        Funct  <= (others => '0');

        wait for 100 ns;

        -- Test R-format (opcode = 000000)
        Opcode <= "000000";
        
        -- ADD (function = 100000)
        Funct <= "100000";
        wait for 100 ns;
        assert (RegDst = "01" and ALUSrc = '0' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case ADD Failed" severity error;

        -- SUB (function = 100010)
        Funct <= "100010";
        wait for 100 ns;
        assert (RegDst = "01" and ALUSrc = '0' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case SUB Failed" severity error;

        -- JR (function = 001000)
        Funct <= "001000";
        wait for 100 ns;
        assert (RegDst = "00" and ALUSrc = '0' and RegWrite = '0' and Jump = '1' and Jr = '1')
            report "Test Case JR Failed" severity error;


        -- SLL (function = 000000)
        Funct <= "000000";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case SLL Failed" severity error;

        -- SRL (function = 000010)
        Funct <= "000010";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case SRL Failed" severity error;

        -- Test I-format
        -- LW (opcode = 100011)
        Opcode <= "100011";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and MemRead = '1' and MemWrite = '0' and MemtoReg = "01" and Jump = '0' and Jr = '0')
            report "Test Case LW Failed" severity error;

        -- SW (opcode = 101011)
        Opcode <= "101011";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '0' and MemRead = '0' and MemWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case SW Failed" severity error;

        -- BEQ (opcode = 000100)
        Opcode <= "000100";
        wait for 100 ns;
        assert (BranchEq = '1' and BranchNe = '0' and Jump = '0' and Jr = '0')
            report "Test Case BEQ Failed" severity error;

        -- BNE (opcode = 000101)
        Opcode <= "000101";
        wait for 100 ns;
        assert (BranchEq = '0' and BranchNe = '1' and Jump = '0' and Jr = '0')
            report "Test Case BNE Failed" severity error;

        -- ADDI (opcode = 001000)
        Opcode <= "001000";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case ADDI Failed" severity error;

        -- ANDI (opcode = 001100)
        Opcode <= "001100";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case ANDI Failed" severity error;

        -- ORI (opcode = 001101)
        Opcode <= "001101";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case ORI Failed" severity error;

        -- XORI (opcode = 001110)
        Opcode <= "001110";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case XORI Failed" severity error;

        -- LUI (opcode = 001111)
        Opcode <= "001111";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case LUI Failed" severity error;

        -- SLTI (opcode = 001010)
        Opcode <= "001010";
        wait for 100 ns;
        assert (ALUSrc = '1' and RegWrite = '1' and Jump = '0' and Jr = '0')
            report "Test Case SLTI Failed" severity error;

        -- Test J-format
        -- JUMP (opcode = 000010)
        Opcode <= "000010";
        wait for 100 ns;
        assert (Jump = '1' and Jal = '0' and Jr = '0')
            report "Test Case JUMP Failed" severity error;

        -- JAL (opcode = 000011)
        Opcode <= "000011";
        wait for 100 ns;
        assert (Jump = '1' and Jal = '1' and Jr = '0' and RegWrite = '1')
            report "Test Case JAL Failed" severity error;

        -- Final Wait Statement to Complete the Simulation
        wait;
    end process;
END behavior;
