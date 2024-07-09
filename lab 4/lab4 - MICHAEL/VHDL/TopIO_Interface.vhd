LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
--------- System Top IO interface with FPGA ---------------
-- Hardware Test Case: Digital System (ALU) Interface IO with FPGA board
-- ALU Inputs (Y,X,ALUFN) are outputs of three registers with KEYX enable and Switches[7:0] as register input
-- KEY0, KEY1, KEY2 - Y, ALUFN, X registers enable respectively
-- Switches[7:0] - Input for registers
-- Y connected to HEX3-HEX2
-- X connected to HEX0-HEX1
-- ALUFN connected to LEDR9-LEDR5
-- ALU Outputs goes to Leds and Hex
-------------------------------------
ENTITY TopIO_Interface IS
  GENERIC (	HEX_num : integer := 7;
			n : INTEGER := 8
			); 
  PORT (
		  clk  : in std_logic; -- for single tap
		  -- Switch Port
		  SW_i : in std_logic_vector(n-1 downto 0);
		  -- Keys Ports
		  KEY0, KEY1, KEY2 : in std_logic;
		  -- 7 segment Ports
		  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(HEX_num-1 downto 0);
		  -- Leds Port
		  LEDs : out std_logic_vector(9 downto 0)  
  );
END TopIO_Interface;
------------------------------------------------
ARCHITECTURE struct OF TopIO_Interface IS 
	-- ALU Inputs
	signal ALUout, X, Y : 	std_logic_vector(n-1 downto 0);
	signal Nflag, Cflag, Zflag: STD_LOGIC;
	signal ALUFN: std_logic_vector(4 downto 0);
BEGIN

	-------------------ALU Module -----------------------------
	ALUModule: 				ALU				port map(Y, X, ALUFN, ALUout, Nflag, Cflag, Zflag);
	---------------------7 Segment Decoder-----------------------------
	-- Display X on 7 segment
	DecoderModuleXHex0: 	SevenSegDecoder	port map(X(3 downto 0) , HEX0);
	DecoderModuleXHex1: 	SevenSegDecoder	port map(X(7 downto 4) , HEX1);
	-- Display Y on 7 segment
	DecoderModuleYHex2: 	SevenSegDecoder	port map(Y(3 downto 0) , HEX2);
	DecoderModuleYHex3: 	SevenSegDecoder	port map(Y(7 downto 4) , HEX3);
	-- Display ALU output on 7 segment
	DecoderModuleOutHex4: 	SevenSegDecoder	port map(ALUout(3 downto 0) , HEX4);
	DecoderModuleOutHex5: 	SevenSegDecoder	port map(ALUout(7 downto 4) , HEX5);
	--------------------LEDS Binding-------------------------
	LEDs(0) <= Nflag;
	LEDs(1) <= Cflag;
	LEDs(2) <= Zflag;
	LEDs(9 downto 5) <= ALUFN;
	-------------------Keys Binding--------------------------
	process(KEY0, KEY1, KEY2) 
	begin
	--	if rising_edge(clk) then
			if KEY0 = '0' then
				Y     <= SW_i;
			elsif KEY1 = '0' then
				ALUFN <= SW_i(4 downto 0);
			elsif KEY2 = '0' then
				X	  <= SW_i;	
			end if;
--		end if;
	end process;
	 
END struct;

