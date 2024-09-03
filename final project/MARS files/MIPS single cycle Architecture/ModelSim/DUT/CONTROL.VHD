		-- control module (implements MIPS control unit)
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
USE work.aux_package.ALL;

--USE IEEE.STD_LOGIC_ARITH.ALL;
--USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY control IS
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
	INTA			: OUT 	STD_LOGIC;
	INTR			: IN 	STD_LOGIC;
	INT_FSM			: INOUT	STD_LOGIC_VECTOR ( 1  DOWNTO 0 );
	DIV_en	 		: OUT	STD_LOGIC;
	clock, reset	: IN 	STD_LOGIC 
	);

END control;

ARCHITECTURE behavior OF control IS
	
	SIGNAL  R_format, Lw, Sw, Beq, Bne,Jr_wire,Jal,jal_ISR		: STD_LOGIC;
	SIGNAL  Addi, Andi, Slti, Ori, Xori, Lui,shift,INTA_reg		: STD_LOGIC;
	SIGNAL  now_dividend,now_divisor : STD_LOGIC;
	SIGNAL	divFSM : STD_LOGIC_VECTOR (1 DOWNTO 0);
	
	
BEGIN           
				-- Code to generate control signals using opcode bits
	R_format 	<=  '1' WHEN Opcode = "000000" OR Opcode = "011100" ELSE '0';
	Lw          <=  '1' WHEN Opcode = "100011" ELSE '0';
 	Sw          <=  '1' WHEN Opcode = "101011" ELSE '0';
   	Beq         <=  '1' WHEN Opcode = "000100" ELSE '0';
	Bne			<=	'1' WHEN Opcode = "000101" ELSE '0';
	Addi		<=  '1' WHEN Opcode = "001000" ELSE '0';
	Andi 		<=  '1' WHEN Opcode = "001100" ELSE '0';
	Slti		<= 	'1' WHEN Opcode = "001010" ELSE '0';
	Ori			<=  '1' WHEN Opcode = "001101" ELSE '0';
	Xori		<=  '1' WHEN Opcode = "001110" ELSE '0';
	Lui			<=	'1' WHEN Opcode = "001111" ELSE '0';
	Jal      	<=	'1' WHEN Opcode = "000011" ELSE '0';
	Jump		<=	'1' WHEN Opcode = "000010" OR  Opcode = "000011" 
						 OR (Opcode = "000000" AND Funct = "001000") ELSE '0';
	Shift		<=  '1' WHEN Opcode = "000000" AND (Funct = "000000" OR Funct = "000010") ELSE '0';
	Jr_wire     <=  '1' WHEN Opcode = "000000" AND Funct = "001000"  ELSE '0';
	jal_ISR     	<=	'1' WHEN Opcode = "111111" ELSE '0';
	
	
  	RegDst(0)    	<=  R_format or jal_ISR ;
	RegDst(1)    	<=  Jal;
 	ALUSrc  	<=  Lw OR Sw OR Addi OR Andi OR Ori OR Xori OR Shift OR Lui OR Slti;  -- when Imm needed
	MemtoReg(0)	<=  Lw;
	MemtoReg(1)	<=  Jal or jal_ISR;
  	RegWrite 	<=  R_format OR Lw OR Jal OR Addi OR Andi OR Ori OR Xori OR Lui OR Slti or jal_ISR;
  	MemRead 	<=  Lw or jal_ISR;
   	MemWrite 	<=  Sw; 
 	BranchEq    <=  Beq;
	BranchNe    <=  Bne;
	Jr 			<=  Jr_wire;
	JAL_ISR_out <=  jal_ISR;
	INTA 		<= 	INTA_reg;
	DIV_en		<=  '1' WHEN Instruction(31 downto 26) = "100011" --if instruction is lw to divisor
					AND Instruction(15 downto 0) = X"0830"        -- then EN = 1
					ELSE '0'; 

	
	
INTA_proc: process (clock,reset)
BEGIN
	if (reset = '1') then
		INTA_reg <= '1';
	elsif rising_edge(clock) then
		if INTR = '1' OR (not (INT_FSM = "01" OR INT_FSM = "10" ))  then
			INTA_reg <= '0';
		else 	
			INTA_reg <= '1';
		end if;
	end if;
end process;

	
INT_FSM_proc: interupt_FSM port map (
			INT_FSM 	=> INT_FSM,
			INTA 		=> INTA_reg,
			rst 		=> reset,
			clk			=> clock
			);
   END behavior;

--check if current instruction is lw to dividend or divisor77


