--------------- Basic Timer Module 
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE work.aux_package.ALL;
-------------- ENTITY --------------------
ENTITY BTIMER IS
	GENERIC(DataBusSize	: integer := 32);
	PORT( 
		Addr	: IN	STD_LOGIC_VECTOR(11 DOWNTO 0);
		BTRead	: IN	STD_LOGIC;
		BTWrite	: IN	STD_LOGIC;
		MCLK	: IN 	STD_LOGIC;
		reset	: IN 	STD_LOGIC;
		BTCTL	: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
		BTCCR0	: IN 	STD_LOGIC_VECTOR(31 DOWNTO 0);
		BTCCR1	: IN	STD_LOGIC_VECTOR(31 DOWNTO 0);
		BTCNT_io: INOUT	STD_LOGIC_VECTOR(31 DOWNTO 0);
		IRQ_OUT : IN	STD_LOGIC;
		BTIFG	: OUT 	STD_LOGIC;
		BTOUT	: OUT	STD_LOGIC
		);
END BTIMER;
------------ ARCHITECTURE ----------------
ARCHITECTURE structure OF BTIMER IS
	SIGNAL CLK		: STD_LOGIC;
	SIGNAL DIV		: STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL BTCNT	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL BTCL0	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL BTCL1	: STD_LOGIC_VECTOR(31 DOWNTO 0);
	
	SIGNAL PWM		: STD_LOGIC;

	ALIAS BTIPx		IS BTCTL(2 DOWNTO 0);
	ALIAS BTSSEL	IS BTCTL(4 DOWNTO 3);
	ALIAS BTHOLD	IS BTCTL(5);
	ALIAS BTOUTEN	IS BTCTL(6);
	
BEGIN
	---------- Read Write Section ----------
	-- if BTCNT came as OUTPUT (Load Word)
	-- BTCNT_io <= (OTHERS => 'Z');	
	BTCNT_io <= BTCNT WHEN (Addr = X"820" AND BTRead = '1') ELSE (OTHERS => 'Z');	

	PROCESS (MCLK) BEGIN
		IF (falling_edge(MCLK)) THEN
				BTCL0 <= BTCCR0;
				BTCL1 <= BTCCR1;
		END IF;
	END PROCESS;
	---------- Basic Timer Signal Generation Section ----------
	-- CCR0 responsible for the `Time Period`
	-- CCR1 responsible for the `Duty Cycle`
	
	PROCESS (CLK, Addr) BEGIN
		IF reset = '1' THEN
			PWM <= '1';
		ELSIF (falling_edge(CLK)) THEN
			IF (BTOUTEN = '0') THEN
				PWM	<= '1';
			ELSIF (BTCNT = BTCL0 OR BTCNT = BTCL1) THEN
				PWM	<= NOT PWM;
			END IF;
		END IF;
	END PROCESS;
	BTOUT	<= PWM;

	
	---------- Basic Timer Interrupt Section ----------
	-- Select the devision in the clk in CLKCNT
	WITH BTSSEL SELECT DIV	<=
		"0001"	WHEN "00", -- 1
		"0010"	WHEN "01", -- 2
		"0100"	WHEN "10", -- 4
		"1000"	WHEN "11", -- 8
		"0001"	WHEN OTHERS;
		
	-- Calculate the CLK input to the CLKCNT that is fed by MCLK division
	PROCESS(MCLK, reset, CLK)
		VARIABLE DIV_CNT	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	BEGIN
		IF reset = '1' THEN
			CLK 	<= '0';
			DIV_CNT := "0000";
		ELSIF(rising_edge(MCLK)) THEN
			IF(DIV = X"1") THEN
				DIV_CNT := "0000";
				CLK <= NOT CLK;
			ELSE
			DIV_CNT := DIV_CNT + 1;
				IF (DIV_CNT = DIV) THEN
					DIV_CNT := "0000";
					CLK <= NOT CLK;	
				END IF;
			END IF;
		END IF;
	END PROCESS;
		
	PROCESS(MCLK, CLK, reset, Addr)
	BEGIN
		IF (reset = '1' OR IRQ_OUT = '1') THEN
			BTCNT <= X"00000000";
		ELSIF (rising_edge(CLK)) THEN
			--IF (IRQ_OUT = '1') THEN
			--	BTCNT <= X"00000000";
			--ELSIF(BTCNT = BTCL0 AND BTOUTEN = '1') THEN
		--		BTCNT <= X"00000000";
			IF(Addr = X"820" AND BTWrite = '1') THEN
				-- if BTCNT came as an INPUT (Store Word)
				BTCNT <= BTCNT_io;
			ELSIF(BTHOLD = '0') THEN 
				BTCNT <= BTCNT + 1;
			END IF;
		END IF;
	END PROCESS;
	
	--BTCNT <= BTCNT_io WHEN Addr = X"820" AND BTWrite = '1' ELSE 
	-- Select the Basic Timer IFG from BTCNT
	WITH BTIPx SELECT BTIFG <= 
		BTCNT(25)	WHEN	"111",
		BTCNT(23) 	WHEN	"110",
		BTCNT(19) 	WHEN	"101",
		BTCNT(15) 	WHEN	"100",
		BTCNT(11) 	WHEN	"011",
		BTCNT(7) 	WHEN	"010",
		BTCNT(3) 	WHEN	"001", 
		BTCNT(0) 	WHEN	"000",
		'0'		  	WHEN	OTHERS;

END structure;