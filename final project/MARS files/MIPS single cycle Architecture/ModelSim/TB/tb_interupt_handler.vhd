library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.aux_package.ALL;

ENTITY tb_full_system IS
END tb_full_system;

ARCHITECTURE behavior OF tb_full_system IS

    -- Component Declarations for the Units Under Test (UUTs)
    
    -- Interrupt Handler
    COMPONENT interupt_handler
    GENERIC(
        AddrBusSize : integer := 12;
        DataBusSize : integer := 32;
        IrqSize     : integer := 6
    );
    PORT(
        set_btifg, key_1, key_2, key_3, DIV, clk, rst : IN std_logic;
        INTR                            : OUT std_logic;
        IRQ_OUT                         : OUT std_logic_vector(6 DOWNTO 0);        
        MemReadBus  : IN std_logic;
        MemWriteBus : IN std_logic;
        AddressBus  : IN std_logic_vector(11 DOWNTO 0);
        DataBus     : INOUT std_logic_vector(DataBusSize-1 DOWNTO 0);
        INTA        : IN std_logic;
        GIE         : IN std_logic
    );
    END COMPONENT;

    -- Control Module
    COMPONENT control IS
        PORT( 	
            Opcode 			: IN 	STD_LOGIC_VECTOR( 5  DOWNTO 0 );
            Funct 			: IN 	STD_LOGIC_VECTOR( 5  DOWNTO 0 );
            Instruction 	: IN 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
            RegDst 			: OUT 	STD_LOGIC_VECTOR( 1  DOWNTO 0 );
            ALUSrc 			: OUT 	STD_LOGIC;
            MemtoReg 		: OUT 	STD_LOGIC_VECTOR( 1  DOWNTO 0 );
            RegWrite 		: OUT 	STD_LOGIC;
            MemRead 		: OUT 	STD_LOGIC;
            MemWrite 		: OUT 	STD_LOGIC;
            BranchEq 		: OUT 	STD_LOGIC;
            BranchNe 		: OUT 	STD_LOGIC;
            Jump 			: OUT 	STD_LOGIC;
            Jr 				: OUT 	STD_LOGIC;
            JAL_ISR_out 	: OUT 	STD_LOGIC;
            clr_IRbt		: OUT 	STD_LOGIC;
            clr_IRdiv   	: OUT 	STD_LOGIC;
            INTA			: OUT 	STD_LOGIC;
            INTR			: IN 	STD_LOGIC;
            INT_FSM			: INOUT	STD_LOGIC_VECTOR ( 1  DOWNTO 0 );
            DIV_en	 		: OUT	STD_LOGIC;
            clock, reset	: IN 	STD_LOGIC 
        );
    END COMPONENT;

    -- Interrupt FSM
    COMPONENT interupt_FSM IS
        PORT( 
            INT_FSM : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            INTA    : IN  std_logic;
            rst, clk : IN  std_logic
        );
    END COMPONENT;

    -- Signals to connect to the UUTs
    signal set_btifg, key_1, key_2, key_3, DIV, clk, rst : std_logic := '0';
    signal INTR                            : std_logic;
    signal IRQ_OUT                         : std_logic_vector(6 DOWNTO 0);
    signal MemReadBus  : std_logic := '0';
    signal MemWriteBus : std_logic := '0';
    signal AddressBus  : std_logic_vector(11 DOWNTO 0) := (others => '0');
    signal DataBus     : std_logic_vector(31 DOWNTO 0) := (others => 'Z');
    signal INTA        : std_logic := '0';
    signal GIE         : std_logic := '0';

    signal Opcode 			: std_logic_vector(5 DOWNTO 0) := (others => '0');
    signal Funct 			: std_logic_vector(5 DOWNTO 0) := (others => '0');
    signal Instruction 		: std_logic_vector(31 DOWNTO 0) := (others => '0');
    signal RegDst 			: std_logic_vector(1 DOWNTO 0);
    signal ALUSrc 			: std_logic;
    signal MemtoReg 		: std_logic_vector(1 DOWNTO 0);
    signal RegWrite 		: std_logic;
    signal MemRead 			: std_logic;
    signal MemWrite 		: std_logic;
    signal BranchEq 		: std_logic;
    signal BranchNe 		: std_logic;
    signal Jump 			: std_logic;
    signal Jr 				: std_logic;
    signal JAL_ISR_out 		: std_logic;
    signal clr_IRbt			: std_logic;
    signal clr_IRdiv   		: std_logic;
    signal DIV_en	 		: std_logic;
    signal INT_FSM			: std_logic_vector(1 DOWNTO 0) := (others => '0');

    -- Clock period definition
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Interrupt Handler
    uut_interupt_handler: interupt_handler
    GENERIC MAP (
        AddrBusSize => 12,
        DataBusSize => 32,
        IrqSize     => 6
    )
    PORT MAP (
        set_btifg => set_btifg,
        key_1 => key_1,
        key_2 => key_2,
        key_3 => key_3,
        DIV => DIV,
        clk => clk,
        rst => rst,
        INTR => INTR,
        IRQ_OUT => IRQ_OUT,
        MemReadBus => MemReadBus,
        MemWriteBus => MemWriteBus,
        AddressBus => AddressBus,
        DataBus => DataBus,
        INTA => INTA,
        GIE => GIE
    );

    -- Instantiate the Control Module
    uut_control: control
    PORT MAP (
        Opcode => Opcode,
        Funct => Funct,
        Instruction => Instruction,
        RegDst => RegDst,
        ALUSrc => ALUSrc,
        MemtoReg => MemtoReg,
        RegWrite => RegWrite,
        MemRead => MemRead,
        MemWrite => MemWrite,
        BranchEq => BranchEq,
        BranchNe => BranchNe,
        Jump => Jump,
        Jr => Jr,
        JAL_ISR_out => JAL_ISR_out,
        clr_IRbt => clr_IRbt,
        clr_IRdiv => clr_IRdiv,
        INTA => INTA,
        INTR => INTR,
        INT_FSM => INT_FSM,
        DIV_en => DIV_en,
        clock => clk,
        reset => rst
    );

    -- Instantiate the Interrupt FSM
    uut_interupt_FSM: interupt_FSM
    PORT MAP (
        INT_FSM => INT_FSM,
        INTA => INTA,
        rst => rst,
        clk => clk
    );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Reset the system
        rst <= '1';
        wait for clk_period*2;
        rst <= '0';

        -- Test case 1: Interrupt handling with key_1 and INTA control
        set_btifg <= '0';
        key_1 <= '1';
        wait for clk_period*10;
        key_1 <= '0';


        -- Test case 2: Interrupt handling with key_2
        key_2 <= '1';
        wait for clk_period*10;
        key_2 <= '0';


        -- Test case 3: Interrupt handling with key_3 and DIV
        key_3 <= '1';
        wait for clk_period*10;
        key_3 <= '0';

        -- Add more test cases as necessary to cover all functionalities

        -- Finish simulation
        wait;
    end process;

END behavior;
