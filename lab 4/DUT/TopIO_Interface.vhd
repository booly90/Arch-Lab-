LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
--------- System Top IO interface with FPGA ---------------
ENTITY TopIO_Interface IS
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
END TopIO_Interface;
------------------------------------------------
ARCHITECTURE struct OF TopIO_Interface IS 
	signal ALUout, X, Y : 	std_logic_vector(n-1 downto 0);
	signal Nflag, Cflag, Zflag,Vflag, PWMout: STD_LOGIC;
	signal ALUFN: std_logic_vector(4 downto 0);
	
BEGIN

	TOPModule: 				Top				
	port map  (  
    Y_i => Y,X_i => X,
    ALUFN_i => ALUFN,
    ALUout_o => ALUout,
    Nflag_o => Nflag, Cflag_o => Cflag,Zflag_o => Zflag,Vflag_o => Vflag,
    ENA => SW8, RST => KEY3, CLK=> PIN_AF14,
    PWM_OUT => PWM_OUT 
  );
  
	
	-------------------Keys Binding--------------------------
	process(clk) 
	begin
		if rising_edge(clk) then
			if KEY0 = '0' then
				Y     <= SW_i;
			END if;
			
			if KEY1 = '0' then
				ALUFN <= SW_i(4 downto 0);
			END if;
			
			if KEY2 = '0' then
				X	  <= SW_i;	
			end if;
	end process;
	--------------------LEDS Binding-------------------------
	LEDs(0) <= Nflag;
	LEDs(1) <= Cflag;
	LEDs(2) <= Zflag;
	LEDs(9 downto 5) <= ALUFN;
	
	------------------hex------------------------------------
	HEX0 (3 DOWNTO 0) <= X (3 downto 0);
	HEX1 (3 DOWNTO 0) <= X (7 downto 4);	
	HEX2 (3 DOWNTO 0) <= Y (3 downto 0);
	HEX3 (3 DOWNTO 0) <= Y (7 downto 4);
	HEX4 (3 DOWNTO 0) <= ALUout (3 downto 0);
	HEX5 (3 DOWNTO 0) <= ALUout (7 downto 4);
	
	 
END struct;

