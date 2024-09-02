-- Execute module (implements the data ALU and Branch Address Adder  
-- for the MIPS computer)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.aux_package.ALL;

ENTITY Execute IS
    PORT(   Read_data_1     : IN    STD_LOGIC_VECTOR( 31 DOWNTO 0 );
            Read_data_2     : IN    STD_LOGIC_VECTOR( 31 DOWNTO 0 );
            Sign_extend     : IN    STD_LOGIC_VECTOR( 31 DOWNTO 0 );
            Function_opcode : IN    STD_LOGIC_VECTOR( 5 DOWNTO 0 );
            ALUSrc          : IN    STD_LOGIC;
            Zero            : OUT   STD_LOGIC;
            ALU_Result      : OUT   STD_LOGIC_VECTOR( 31 DOWNTO 0 );
            Add_Result      : OUT   STD_LOGIC_VECTOR( 7 DOWNTO 0 );
            PC_plus_4       : IN    STD_LOGIC_VECTOR( 9 DOWNTO 0 );
            clock, reset    : IN    STD_LOGIC ;
            opcode          : IN    STD_LOGIC_VECTOR( 5 DOWNTO 0 )
			--***Ainput_out, Binput_out		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
            );
END Execute;

ARCHITECTURE behavior OF Execute IS
    SIGNAL Ainput, Binput       : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL ALU_output_mux       : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Branch_Add           : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
    SIGNAL ALU_ctl              : STD_LOGIC_VECTOR( 3 DOWNTO 0 );
BEGIN
    -- ALU input mux
    Ainput <=  Read_data_2 when (ALU_ctl = "0101" or ALU_ctl = "0110") else Read_data_1; 
    Binput <= Read_data_2 WHEN (ALUSrc = '0') ELSE Sign_extend;

	--***Ainput_out <= Ainput;
	--***Binput_out <= Binput;
	
    -- Generate ALU control bits
    PROCESS(opcode, Function_opcode)
    BEGIN
        IF opcode = "000000" THEN -- R-type instructions
            CASE Function_opcode IS
                WHEN "100000" => ALU_ctl <= "0000"; -- ADD
                WHEN "100010" => ALU_ctl <= "0001"; -- SUB, slt (needs to sub between 2 registers
                when "101010" => ALU_ctl <= "0001"; --sub for slt
				WHEN "100100" => ALU_ctl <= "0010"; -- AND
                WHEN "100101" => ALU_ctl <= "0011"; -- OR
                WHEN "100110" => ALU_ctl <= "0100"; -- XOR
                WHEN "000000" => ALU_ctl <= "0101"; -- SLL
                WHEN "000010" => ALU_ctl <= "0110"; -- SRL
                WHEN "001000" => ALU_ctl <= "0111"; -- JR

				
                WHEN OTHERS   => ALU_ctl <= "0000"; -- Default
            END CASE;
        ELSIF opcode = "001000" THEN -- ADDI
            ALU_ctl <= "0000";
        ELSIF opcode = "001100" THEN -- ANDI
            ALU_ctl <= "0010";
        ELSIF opcode = "001101" THEN -- ORI
            ALU_ctl <= "0011";
        ELSIF opcode = "001110" THEN -- XORI
            ALU_ctl <= "0100";
        ELSIF opcode = "100011" OR opcode = "101011" THEN -- LW or SW
            ALU_ctl <= "0000"; -- ADD
        ELSIF opcode = "001111" THEN -- LUI
            ALU_ctl <= "1001";
        ELSIF opcode = "000100" THEN -- BEQ
            ALU_ctl <= "0001"; -- SUB
        ELSIF opcode = "000101" THEN -- BNE
            ALU_ctl <= "0001"; -- SUB
        ELSIF opcode = "001010" THEN -- SLTI
            ALU_ctl <= "0001"; -- SUB
        ELSIF opcode = "011100" THEN -- MULT
            ALU_ctl <= "1000";
        ELSE
            ALU_ctl <= "0001"; -- Default
        END IF;
    END PROCESS;

    -- Generate Zero Flag
    Zero <= '1' WHEN (ALU_output_mux = X"00000000") ELSE '0';
		-- Select ALU output        
	ALU_result <= X"0000000" & B"000"  & ALU_output_mux( 31 ) 
		WHEN  opcode = "001010" or  (Function_opcode = "101010" and opcode = "000000") --those are for slt and SLTI
		ELSE  	ALU_output_mux( 31 DOWNTO 0 );
						-- Adder to compute Branch Address
		Branch_Add <= std_logic_vector(unsigned(PC_plus_4(9 DOWNTO 2)) + unsigned(Sign_extend(7 DOWNTO 0)));
		Add_result 	<= Branch_Add( 7 DOWNTO 0 );

    -- ALU operations
    PROCESS(ALU_ctl, Ainput, Binput)
        VARIABLE product : signed(63 DOWNTO 0);
    BEGIN
        CASE ALU_ctl IS
            WHEN "0000" => ALU_output_mux <= std_logic_vector(signed(Ainput) + signed(Binput)); -- ADD, ADDI,lw,SW
            WHEN "0001" => ALU_output_mux <= std_logic_vector(signed(Ainput) - signed(Binput)); -- SUB,beq,bnq,slt,SLTI
            WHEN "0010" => ALU_output_mux <= Ainput AND Binput; -- AND,ANDI
            WHEN "0011" => ALU_output_mux <= Ainput OR Binput; -- OR,ORI
            WHEN "0100" => ALU_output_mux <= Ainput XOR Binput; -- XOR,XORI
            WHEN "0101" => ALU_output_mux <= std_logic_vector(shift_left(unsigned(Ainput), to_integer(unsigned(Binput(10 DOWNTO 6))))); -- SLL
            WHEN "0110" => ALU_output_mux <= std_logic_vector(shift_right(unsigned(Ainput), to_integer(unsigned(Binput(10 DOWNTO 6))))); -- SRL
            WHEN "0111" => ALU_output_mux <= X"00000000"; -- JR it does not do anything
            WHEN "1000" => 
                product := signed(Ainput) * signed(Binput); -- MULT
                ALU_output_mux <= std_logic_vector(product(31 DOWNTO 0)); -- Lower 32 bits of product
            when "1001" => ALU_output_mux <= Binput (15 downto 0) & X"0000"; --LUI
			
			WHEN OTHERS => ALU_output_mux <= X"00000000"; -- Default
			
        END CASE;
    END PROCESS;


END behavior;

