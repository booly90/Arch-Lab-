-- Copyright (C) 2021  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "07/07/2024 12:35:37"

-- 
-- Device: Altera 5CSXFC6D6F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	PWM IS
    PORT (
	Y_PWM_in : IN std_logic_vector(7 DOWNTO 0);
	X_PWM_in : IN std_logic_vector(7 DOWNTO 0);
	ENA : IN std_logic;
	RST : IN std_logic;
	CLK : IN std_logic;
	ALUFN : IN std_logic_vector(4 DOWNTO 0);
	PWM_OUT : OUT std_logic
	);
END PWM;

-- Design Ports Information
-- PWM_OUT	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENA	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[0]	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[7]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[3]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[4]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[6]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[5]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[1]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[0]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[3]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[2]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X_PWM_in[4]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[7]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[6]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[5]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[1]	=>  Location: PIN_AC20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[0]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[3]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[2]	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y_PWM_in[4]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[1]	=>  Location: PIN_AK26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RST	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PWM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y_PWM_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_X_PWM_in : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ENA : std_logic;
SIGNAL ww_RST : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_ALUFN : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_PWM_OUT : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \CLK~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ENA~input_o\ : std_logic;
SIGNAL \ALUFN[3]~input_o\ : std_logic;
SIGNAL \ALUFN[2]~input_o\ : std_logic;
SIGNAL \ALUFN[1]~input_o\ : std_logic;
SIGNAL \ALUFN[4]~input_o\ : std_logic;
SIGNAL \PWM_OUT~0_combout\ : std_logic;
SIGNAL \ALUFN[0]~input_o\ : std_logic;
SIGNAL \RST~input_o\ : std_logic;
SIGNAL \PWM_0~1_combout\ : std_logic;
SIGNAL \Y_PWM_in[4]~input_o\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Y_PWM_in[1]~input_o\ : std_logic;
SIGNAL \Y_PWM_in[0]~input_o\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \Y_PWM_in[2]~input_o\ : std_logic;
SIGNAL \Y_PWM_in[3]~input_o\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Y_PWM_in[7]~input_o\ : std_logic;
SIGNAL \Y_PWM_in[6]~input_o\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \Y_PWM_in[5]~input_o\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \X_PWM_in[5]~input_o\ : std_logic;
SIGNAL \X_PWM_in[4]~input_o\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \X_PWM_in[7]~input_o\ : std_logic;
SIGNAL \X_PWM_in[6]~input_o\ : std_logic;
SIGNAL \LessThan0~9_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~10_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \X_PWM_in[3]~input_o\ : std_logic;
SIGNAL \X_PWM_in[2]~input_o\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \X_PWM_in[1]~input_o\ : std_logic;
SIGNAL \X_PWM_in[0]~input_o\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \PWM_0~2_combout\ : std_logic;
SIGNAL \PWM_0~q\ : std_logic;
SIGNAL \PWM_0~0_combout\ : std_logic;
SIGNAL \PWM_OUT~1_combout\ : std_logic;
SIGNAL \PWM_OUT~reg0_q\ : std_logic;
SIGNAL COUNTER_PWM : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_RST~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUFN[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUFN[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Y_PWM_in[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUFN[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUFN[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_X_PWM_in[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_ALUFN[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_ENA~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal1~1_combout\ : std_logic;
SIGNAL \ALT_INV_PWM_0~1_combout\ : std_logic;
SIGNAL \ALT_INV_PWM_OUT~0_combout\ : std_logic;
SIGNAL \ALT_INV_PWM_0~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~8_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~7_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~6_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~5_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~10_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~9_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~8_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~7_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~6_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~5_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~4_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~3_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~2_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~1_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_PWM_0~q\ : std_logic;
SIGNAL \ALT_INV_PWM_OUT~reg0_q\ : std_logic;
SIGNAL ALT_INV_COUNTER_PWM : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_Y_PWM_in <= Y_PWM_in;
ww_X_PWM_in <= X_PWM_in;
ww_ENA <= ENA;
ww_RST <= RST;
ww_CLK <= CLK;
ww_ALUFN <= ALUFN;
PWM_OUT <= ww_PWM_OUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_RST~input_o\ <= NOT \RST~input_o\;
\ALT_INV_ALUFN[2]~input_o\ <= NOT \ALUFN[2]~input_o\;
\ALT_INV_ALUFN[1]~input_o\ <= NOT \ALUFN[1]~input_o\;
\ALT_INV_Y_PWM_in[4]~input_o\ <= NOT \Y_PWM_in[4]~input_o\;
\ALT_INV_Y_PWM_in[2]~input_o\ <= NOT \Y_PWM_in[2]~input_o\;
\ALT_INV_Y_PWM_in[3]~input_o\ <= NOT \Y_PWM_in[3]~input_o\;
\ALT_INV_Y_PWM_in[0]~input_o\ <= NOT \Y_PWM_in[0]~input_o\;
\ALT_INV_Y_PWM_in[1]~input_o\ <= NOT \Y_PWM_in[1]~input_o\;
\ALT_INV_Y_PWM_in[5]~input_o\ <= NOT \Y_PWM_in[5]~input_o\;
\ALT_INV_Y_PWM_in[6]~input_o\ <= NOT \Y_PWM_in[6]~input_o\;
\ALT_INV_Y_PWM_in[7]~input_o\ <= NOT \Y_PWM_in[7]~input_o\;
\ALT_INV_X_PWM_in[4]~input_o\ <= NOT \X_PWM_in[4]~input_o\;
\ALT_INV_X_PWM_in[2]~input_o\ <= NOT \X_PWM_in[2]~input_o\;
\ALT_INV_X_PWM_in[3]~input_o\ <= NOT \X_PWM_in[3]~input_o\;
\ALT_INV_X_PWM_in[0]~input_o\ <= NOT \X_PWM_in[0]~input_o\;
\ALT_INV_X_PWM_in[1]~input_o\ <= NOT \X_PWM_in[1]~input_o\;
\ALT_INV_X_PWM_in[5]~input_o\ <= NOT \X_PWM_in[5]~input_o\;
\ALT_INV_X_PWM_in[6]~input_o\ <= NOT \X_PWM_in[6]~input_o\;
\ALT_INV_ALUFN[4]~input_o\ <= NOT \ALUFN[4]~input_o\;
\ALT_INV_ALUFN[3]~input_o\ <= NOT \ALUFN[3]~input_o\;
\ALT_INV_X_PWM_in[7]~input_o\ <= NOT \X_PWM_in[7]~input_o\;
\ALT_INV_ALUFN[0]~input_o\ <= NOT \ALUFN[0]~input_o\;
\ALT_INV_ENA~input_o\ <= NOT \ENA~input_o\;
\ALT_INV_Equal1~1_combout\ <= NOT \Equal1~1_combout\;
\ALT_INV_PWM_0~1_combout\ <= NOT \PWM_0~1_combout\;
\ALT_INV_PWM_OUT~0_combout\ <= NOT \PWM_OUT~0_combout\;
\ALT_INV_PWM_0~0_combout\ <= NOT \PWM_0~0_combout\;
\ALT_INV_LessThan1~8_combout\ <= NOT \LessThan1~8_combout\;
\ALT_INV_LessThan1~7_combout\ <= NOT \LessThan1~7_combout\;
\ALT_INV_LessThan1~6_combout\ <= NOT \LessThan1~6_combout\;
\ALT_INV_LessThan1~5_combout\ <= NOT \LessThan1~5_combout\;
\ALT_INV_LessThan1~4_combout\ <= NOT \LessThan1~4_combout\;
\ALT_INV_LessThan1~3_combout\ <= NOT \LessThan1~3_combout\;
\ALT_INV_Equal1~0_combout\ <= NOT \Equal1~0_combout\;
\ALT_INV_LessThan1~2_combout\ <= NOT \LessThan1~2_combout\;
\ALT_INV_LessThan1~1_combout\ <= NOT \LessThan1~1_combout\;
\ALT_INV_LessThan1~0_combout\ <= NOT \LessThan1~0_combout\;
\ALT_INV_LessThan0~10_combout\ <= NOT \LessThan0~10_combout\;
\ALT_INV_LessThan0~9_combout\ <= NOT \LessThan0~9_combout\;
\ALT_INV_LessThan0~8_combout\ <= NOT \LessThan0~8_combout\;
\ALT_INV_LessThan0~7_combout\ <= NOT \LessThan0~7_combout\;
\ALT_INV_LessThan0~6_combout\ <= NOT \LessThan0~6_combout\;
\ALT_INV_LessThan0~5_combout\ <= NOT \LessThan0~5_combout\;
\ALT_INV_LessThan0~4_combout\ <= NOT \LessThan0~4_combout\;
\ALT_INV_LessThan0~3_combout\ <= NOT \LessThan0~3_combout\;
\ALT_INV_LessThan0~2_combout\ <= NOT \LessThan0~2_combout\;
\ALT_INV_LessThan0~1_combout\ <= NOT \LessThan0~1_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_PWM_0~q\ <= NOT \PWM_0~q\;
\ALT_INV_PWM_OUT~reg0_q\ <= NOT \PWM_OUT~reg0_q\;
ALT_INV_COUNTER_PWM(4) <= NOT COUNTER_PWM(4);
ALT_INV_COUNTER_PWM(2) <= NOT COUNTER_PWM(2);
ALT_INV_COUNTER_PWM(3) <= NOT COUNTER_PWM(3);
ALT_INV_COUNTER_PWM(0) <= NOT COUNTER_PWM(0);
ALT_INV_COUNTER_PWM(1) <= NOT COUNTER_PWM(1);
ALT_INV_COUNTER_PWM(5) <= NOT COUNTER_PWM(5);
ALT_INV_COUNTER_PWM(6) <= NOT COUNTER_PWM(6);
ALT_INV_COUNTER_PWM(7) <= NOT COUNTER_PWM(7);

-- Location: IOOBUF_X78_Y0_N36
\PWM_OUT~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \PWM_OUT~reg0_q\,
	devoe => ww_devoe,
	o => ww_PWM_OUT);

-- Location: IOIBUF_X89_Y25_N21
\CLK~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: CLKCTRL_G10
\CLK~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK~input_o\,
	outclk => \CLK~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y4_N44
\ENA~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENA,
	o => \ENA~input_o\);

-- Location: IOIBUF_X89_Y4_N78
\ALUFN[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(3),
	o => \ALUFN[3]~input_o\);

-- Location: IOIBUF_X78_Y0_N1
\ALUFN[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(2),
	o => \ALUFN[2]~input_o\);

-- Location: IOIBUF_X76_Y0_N52
\ALUFN[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(1),
	o => \ALUFN[1]~input_o\);

-- Location: IOIBUF_X89_Y4_N61
\ALUFN[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(4),
	o => \ALUFN[4]~input_o\);

-- Location: LABCELL_X79_Y4_N24
\PWM_OUT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PWM_OUT~0_combout\ = ( !\ALUFN[4]~input_o\ & ( (\ENA~input_o\ & (!\ALUFN[3]~input_o\ & (!\ALUFN[2]~input_o\ & !\ALUFN[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ENA~input_o\,
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[2]~input_o\,
	datad => \ALT_INV_ALUFN[1]~input_o\,
	dataf => \ALT_INV_ALUFN[4]~input_o\,
	combout => \PWM_OUT~0_combout\);

-- Location: IOIBUF_X80_Y0_N52
\ALUFN[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(0),
	o => \ALUFN[0]~input_o\);

-- Location: IOIBUF_X78_Y0_N52
\RST~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RST,
	o => \RST~input_o\);

-- Location: LABCELL_X79_Y4_N45
\PWM_0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PWM_0~1_combout\ = ( !\RST~input_o\ & ( \ENA~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_ENA~input_o\,
	dataf => \ALT_INV_RST~input_o\,
	combout => \PWM_0~1_combout\);

-- Location: IOIBUF_X76_Y0_N18
\Y_PWM_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(4),
	o => \Y_PWM_in[4]~input_o\);

-- Location: LABCELL_X80_Y4_N0
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( COUNTER_PWM(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~18\ = CARRY(( COUNTER_PWM(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(0),
	cin => GND,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: IOIBUF_X76_Y0_N1
\Y_PWM_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(1),
	o => \Y_PWM_in[1]~input_o\);

-- Location: IOIBUF_X78_Y0_N18
\Y_PWM_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(0),
	o => \Y_PWM_in[0]~input_o\);

-- Location: LABCELL_X79_Y4_N39
\Equal1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = ( COUNTER_PWM(1) & ( COUNTER_PWM(0) & ( (\Y_PWM_in[1]~input_o\ & (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & \Y_PWM_in[0]~input_o\))) ) ) ) # ( !COUNTER_PWM(1) & ( COUNTER_PWM(0) & ( (!\Y_PWM_in[1]~input_o\ & (!\ALUFN[3]~input_o\ & 
-- (!\ALUFN[4]~input_o\ & \Y_PWM_in[0]~input_o\))) ) ) ) # ( COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( (\Y_PWM_in[1]~input_o\ & (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & !\Y_PWM_in[0]~input_o\))) ) ) ) # ( !COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( 
-- (((!\Y_PWM_in[1]~input_o\ & !\Y_PWM_in[0]~input_o\)) # (\ALUFN[4]~input_o\)) # (\ALUFN[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111100111111010000000000000000000000100000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Y_PWM_in[1]~input_o\,
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datad => \ALT_INV_Y_PWM_in[0]~input_o\,
	datae => ALT_INV_COUNTER_PWM(1),
	dataf => ALT_INV_COUNTER_PWM(0),
	combout => \Equal1~1_combout\);

-- Location: IOIBUF_X76_Y0_N35
\Y_PWM_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(2),
	o => \Y_PWM_in[2]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\Y_PWM_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(3),
	o => \Y_PWM_in[3]~input_o\);

-- Location: LABCELL_X79_Y4_N18
\Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = ( COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (\Y_PWM_in[2]~input_o\ & (\Y_PWM_in[3]~input_o\ & !\ALUFN[3]~input_o\))) ) ) ) # ( !COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (!\Y_PWM_in[2]~input_o\ & 
-- (\Y_PWM_in[3]~input_o\ & !\ALUFN[3]~input_o\))) ) ) ) # ( COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (\Y_PWM_in[2]~input_o\ & (!\Y_PWM_in[3]~input_o\ & !\ALUFN[3]~input_o\))) ) ) ) # ( !COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( 
-- (((!\Y_PWM_in[2]~input_o\ & !\Y_PWM_in[3]~input_o\)) # (\ALUFN[3]~input_o\)) # (\ALUFN[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010111111111001000000000000000001000000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUFN[4]~input_o\,
	datab => \ALT_INV_Y_PWM_in[2]~input_o\,
	datac => \ALT_INV_Y_PWM_in[3]~input_o\,
	datad => \ALT_INV_ALUFN[3]~input_o\,
	datae => ALT_INV_COUNTER_PWM(2),
	dataf => ALT_INV_COUNTER_PWM(3),
	combout => \Equal1~0_combout\);

-- Location: LABCELL_X80_Y4_N12
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( COUNTER_PWM(4) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~30\ = CARRY(( COUNTER_PWM(4) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(4),
	cin => \Add0~22\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: LABCELL_X80_Y4_N15
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( COUNTER_PWM(5) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~10\ = CARRY(( COUNTER_PWM(5) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(5),
	cin => \Add0~30\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X80_Y4_N17
\COUNTER_PWM[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(5));

-- Location: LABCELL_X80_Y4_N18
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( COUNTER_PWM(6) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( COUNTER_PWM(6) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(6),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X80_Y4_N20
\COUNTER_PWM[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(6));

-- Location: LABCELL_X80_Y4_N21
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( COUNTER_PWM(7) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(7),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\);

-- Location: FF_X80_Y4_N23
\COUNTER_PWM[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(7));

-- Location: IOIBUF_X80_Y0_N1
\Y_PWM_in[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(7),
	o => \Y_PWM_in[7]~input_o\);

-- Location: IOIBUF_X80_Y0_N35
\Y_PWM_in[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(6),
	o => \Y_PWM_in[6]~input_o\);

-- Location: LABCELL_X80_Y4_N27
\LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = ( \Y_PWM_in[7]~input_o\ & ( \Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!COUNTER_PWM(6) & ((\ALUFN[4]~input_o\) # (\ALUFN[3]~input_o\)))) # (COUNTER_PWM(7) & (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & COUNTER_PWM(6)))) ) ) ) # 
-- ( !\Y_PWM_in[7]~input_o\ & ( \Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!COUNTER_PWM(6) $ (((!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\))))) ) ) ) # ( \Y_PWM_in[7]~input_o\ & ( !\Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(6) & (!COUNTER_PWM(7) $ 
-- (((!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\))))) ) ) ) # ( !\Y_PWM_in[7]~input_o\ & ( !\Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & !COUNTER_PWM(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000011010100000000000101010100000000010101001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_COUNTER_PWM(7),
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datad => ALT_INV_COUNTER_PWM(6),
	datae => \ALT_INV_Y_PWM_in[7]~input_o\,
	dataf => \ALT_INV_Y_PWM_in[6]~input_o\,
	combout => \LessThan1~0_combout\);

-- Location: IOIBUF_X89_Y4_N95
\Y_PWM_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y_PWM_in(5),
	o => \Y_PWM_in[5]~input_o\);

-- Location: LABCELL_X79_Y4_N30
\LessThan1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = ( COUNTER_PWM(5) & ( \Y_PWM_in[5]~input_o\ & ( (\ALUFN[3]~input_o\) # (\ALUFN[4]~input_o\) ) ) ) # ( !COUNTER_PWM(5) & ( \Y_PWM_in[5]~input_o\ & ( (!\ALUFN[4]~input_o\ & !\ALUFN[3]~input_o\) ) ) ) # ( COUNTER_PWM(5) & ( 
-- !\Y_PWM_in[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111001100000000000011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUFN[4]~input_o\,
	datad => \ALT_INV_ALUFN[3]~input_o\,
	datae => ALT_INV_COUNTER_PWM(5),
	dataf => \ALT_INV_Y_PWM_in[5]~input_o\,
	combout => \LessThan1~1_combout\);

-- Location: LABCELL_X79_Y4_N42
\Equal1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = ( !\LessThan1~1_combout\ & ( (!\LessThan1~3_combout\ & (\Equal1~1_combout\ & (\Equal1~0_combout\ & \LessThan1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan1~3_combout\,
	datab => \ALT_INV_Equal1~1_combout\,
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_LessThan1~0_combout\,
	dataf => \ALT_INV_LessThan1~1_combout\,
	combout => \Equal1~2_combout\);

-- Location: FF_X79_Y4_N26
\COUNTER_PWM[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	asdata => \Add0~17_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	sload => VCC,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(0));

-- Location: LABCELL_X80_Y4_N3
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( COUNTER_PWM(1) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( COUNTER_PWM(1) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(1),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X80_Y4_N5
\COUNTER_PWM[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(1));

-- Location: LABCELL_X80_Y4_N6
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( COUNTER_PWM(2) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~26\ = CARRY(( COUNTER_PWM(2) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(2),
	cin => \Add0~14\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X80_Y4_N8
\COUNTER_PWM[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(2));

-- Location: LABCELL_X80_Y4_N9
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( COUNTER_PWM(3) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( COUNTER_PWM(3) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_COUNTER_PWM(3),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X80_Y4_N11
\COUNTER_PWM[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(3));

-- Location: FF_X80_Y4_N14
\COUNTER_PWM[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \ALT_INV_RST~input_o\,
	sclr => \Equal1~2_combout\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => COUNTER_PWM(4));

-- Location: LABCELL_X79_Y4_N51
\LessThan1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = ( COUNTER_PWM(4) & ( ((!\Y_PWM_in[4]~input_o\) # (\ALUFN[4]~input_o\)) # (\ALUFN[3]~input_o\) ) ) # ( !COUNTER_PWM(4) & ( (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & \Y_PWM_in[4]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000011111111001111111111111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datad => \ALT_INV_Y_PWM_in[4]~input_o\,
	dataf => ALT_INV_COUNTER_PWM(4),
	combout => \LessThan1~3_combout\);

-- Location: LABCELL_X79_Y4_N57
\LessThan1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = ( !COUNTER_PWM(1) & ( COUNTER_PWM(0) & ( (\Y_PWM_in[1]~input_o\ & (!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\)) ) ) ) # ( COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( (\Y_PWM_in[1]~input_o\ & (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & 
-- \Y_PWM_in[0]~input_o\))) ) ) ) # ( !COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & ((\Y_PWM_in[0]~input_o\) # (\Y_PWM_in[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000011000000000000000100000001000000010000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Y_PWM_in[1]~input_o\,
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datad => \ALT_INV_Y_PWM_in[0]~input_o\,
	datae => ALT_INV_COUNTER_PWM(1),
	dataf => ALT_INV_COUNTER_PWM(0),
	combout => \LessThan1~2_combout\);

-- Location: LABCELL_X79_Y4_N0
\LessThan1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = ( !COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (\Y_PWM_in[2]~input_o\ & (\Y_PWM_in[3]~input_o\ & !\ALUFN[3]~input_o\))) ) ) ) # ( COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (\Y_PWM_in[3]~input_o\ 
-- & !\ALUFN[3]~input_o\)) ) ) ) # ( !COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( (!\ALUFN[4]~input_o\ & (!\ALUFN[3]~input_o\ & ((\Y_PWM_in[3]~input_o\) # (\Y_PWM_in[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000000000000010100000000000000010000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUFN[4]~input_o\,
	datab => \ALT_INV_Y_PWM_in[2]~input_o\,
	datac => \ALT_INV_Y_PWM_in[3]~input_o\,
	datad => \ALT_INV_ALUFN[3]~input_o\,
	datae => ALT_INV_COUNTER_PWM(2),
	dataf => ALT_INV_COUNTER_PWM(3),
	combout => \LessThan1~4_combout\);

-- Location: LABCELL_X79_Y4_N6
\LessThan1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = ( \LessThan1~4_combout\ & ( \LessThan1~0_combout\ & ( (!\LessThan1~3_combout\ & !\LessThan1~1_combout\) ) ) ) # ( !\LessThan1~4_combout\ & ( \LessThan1~0_combout\ & ( (!\LessThan1~3_combout\ & (\LessThan1~2_combout\ & 
-- (\Equal1~0_combout\ & !\LessThan1~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan1~3_combout\,
	datab => \ALT_INV_LessThan1~2_combout\,
	datac => \ALT_INV_Equal1~0_combout\,
	datad => \ALT_INV_LessThan1~1_combout\,
	datae => \ALT_INV_LessThan1~4_combout\,
	dataf => \ALT_INV_LessThan1~0_combout\,
	combout => \LessThan1~5_combout\);

-- Location: LABCELL_X80_Y4_N51
\LessThan0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = ( !\ALUFN[3]~input_o\ & ( !\ALUFN[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ALUFN[4]~input_o\,
	dataf => \ALT_INV_ALUFN[3]~input_o\,
	combout => \LessThan0~7_combout\);

-- Location: IOIBUF_X82_Y0_N92
\X_PWM_in[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(5),
	o => \X_PWM_in[5]~input_o\);

-- Location: IOIBUF_X89_Y6_N4
\X_PWM_in[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(4),
	o => \X_PWM_in[4]~input_o\);

-- Location: LABCELL_X81_Y4_N39
\LessThan0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = ( !\ALUFN[4]~input_o\ & ( !COUNTER_PWM(4) & ( (\X_PWM_in[4]~input_o\ & !\ALUFN[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_X_PWM_in[4]~input_o\,
	datac => \ALT_INV_ALUFN[3]~input_o\,
	datae => \ALT_INV_ALUFN[4]~input_o\,
	dataf => ALT_INV_COUNTER_PWM(4),
	combout => \LessThan0~8_combout\);

-- Location: IOIBUF_X82_Y0_N75
\X_PWM_in[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(7),
	o => \X_PWM_in[7]~input_o\);

-- Location: IOIBUF_X80_Y0_N18
\X_PWM_in[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(6),
	o => \X_PWM_in[6]~input_o\);

-- Location: LABCELL_X80_Y4_N54
\LessThan0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~9_combout\ = ( \X_PWM_in[7]~input_o\ & ( \X_PWM_in[6]~input_o\ & ( (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & ((!COUNTER_PWM(7)) # (!COUNTER_PWM(6))))) ) ) ) # ( !\X_PWM_in[7]~input_o\ & ( \X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & 
-- (!\ALUFN[3]~input_o\ & (!COUNTER_PWM(6) & !\ALUFN[4]~input_o\))) ) ) ) # ( \X_PWM_in[7]~input_o\ & ( !\X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100010000000000010000000000000001100100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_COUNTER_PWM(7),
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => ALT_INV_COUNTER_PWM(6),
	datad => \ALT_INV_ALUFN[4]~input_o\,
	datae => \ALT_INV_X_PWM_in[7]~input_o\,
	dataf => \ALT_INV_X_PWM_in[6]~input_o\,
	combout => \LessThan0~9_combout\);

-- Location: LABCELL_X80_Y4_N24
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( \X_PWM_in[7]~input_o\ & ( \X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!COUNTER_PWM(6) & ((\ALUFN[4]~input_o\) # (\ALUFN[3]~input_o\)))) # (COUNTER_PWM(7) & (!\ALUFN[3]~input_o\ & (COUNTER_PWM(6) & !\ALUFN[4]~input_o\))) ) ) ) # 
-- ( !\X_PWM_in[7]~input_o\ & ( \X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!COUNTER_PWM(6) $ (((!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\))))) ) ) ) # ( \X_PWM_in[7]~input_o\ & ( !\X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(6) & (!COUNTER_PWM(7) $ 
-- (((!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\))))) ) ) ) # ( !\X_PWM_in[7]~input_o\ & ( !\X_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & !COUNTER_PWM(6)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000011000001010000000101000101000000010010010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_COUNTER_PWM(7),
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => ALT_INV_COUNTER_PWM(6),
	datad => \ALT_INV_ALUFN[4]~input_o\,
	datae => \ALT_INV_X_PWM_in[7]~input_o\,
	dataf => \ALT_INV_X_PWM_in[6]~input_o\,
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X80_Y4_N30
\LessThan0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~10_combout\ = ( !\LessThan0~9_combout\ & ( \LessThan0~0_combout\ & ( (!\LessThan0~8_combout\ & ((!\LessThan0~7_combout\) # ((!\X_PWM_in[5]~input_o\) # (COUNTER_PWM(5))))) # (\LessThan0~8_combout\ & (COUNTER_PWM(5) & ((!\LessThan0~7_combout\) # 
-- (!\X_PWM_in[5]~input_o\)))) ) ) ) # ( !\LessThan0~9_combout\ & ( !\LessThan0~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011100000111111100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~7_combout\,
	datab => \ALT_INV_X_PWM_in[5]~input_o\,
	datac => \ALT_INV_LessThan0~8_combout\,
	datad => ALT_INV_COUNTER_PWM(5),
	datae => \ALT_INV_LessThan0~9_combout\,
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \LessThan0~10_combout\);

-- Location: LABCELL_X79_Y4_N48
\LessThan1~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = ( !COUNTER_PWM(4) & ( (!\ALUFN[4]~input_o\ & (!\ALUFN[3]~input_o\ & \Y_PWM_in[4]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010001000000000001000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUFN[4]~input_o\,
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datad => \ALT_INV_Y_PWM_in[4]~input_o\,
	dataf => ALT_INV_COUNTER_PWM(4),
	combout => \LessThan1~6_combout\);

-- Location: LABCELL_X80_Y4_N57
\LessThan1~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = ( \Y_PWM_in[7]~input_o\ & ( \Y_PWM_in[6]~input_o\ & ( (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & ((!COUNTER_PWM(7)) # (!COUNTER_PWM(6))))) ) ) ) # ( !\Y_PWM_in[7]~input_o\ & ( \Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & 
-- (!\ALUFN[3]~input_o\ & (!\ALUFN[4]~input_o\ & !COUNTER_PWM(6)))) ) ) ) # ( \Y_PWM_in[7]~input_o\ & ( !\Y_PWM_in[6]~input_o\ & ( (!COUNTER_PWM(7) & (!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000001000000010000000000000001100000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_COUNTER_PWM(7),
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datad => ALT_INV_COUNTER_PWM(6),
	datae => \ALT_INV_Y_PWM_in[7]~input_o\,
	dataf => \ALT_INV_Y_PWM_in[6]~input_o\,
	combout => \LessThan1~7_combout\);

-- Location: LABCELL_X80_Y4_N36
\LessThan1~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = ( \LessThan1~0_combout\ & ( !\LessThan1~7_combout\ & ( (!COUNTER_PWM(5) & (!\LessThan1~6_combout\ & ((!\Y_PWM_in[5]~input_o\) # (!\LessThan0~7_combout\)))) # (COUNTER_PWM(5) & ((!\Y_PWM_in[5]~input_o\) # ((!\LessThan0~7_combout\) # 
-- (!\LessThan1~6_combout\)))) ) ) ) # ( !\LessThan1~0_combout\ & ( !\LessThan1~7_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111110110011001000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Y_PWM_in[5]~input_o\,
	datab => ALT_INV_COUNTER_PWM(5),
	datac => \ALT_INV_LessThan0~7_combout\,
	datad => \ALT_INV_LessThan1~6_combout\,
	datae => \ALT_INV_LessThan1~0_combout\,
	dataf => \ALT_INV_LessThan1~7_combout\,
	combout => \LessThan1~8_combout\);

-- Location: IOIBUF_X82_Y0_N58
\X_PWM_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(3),
	o => \X_PWM_in[3]~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\X_PWM_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(2),
	o => \X_PWM_in[2]~input_o\);

-- Location: LABCELL_X81_Y4_N0
\LessThan0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = ( COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( (!\X_PWM_in[3]~input_o\) # (!\X_PWM_in[2]~input_o\) ) ) ) # ( !COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( !\X_PWM_in[3]~input_o\ ) ) ) # ( COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( 
-- !\X_PWM_in[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110010101010101010101110111011101110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X_PWM_in[3]~input_o\,
	datab => \ALT_INV_X_PWM_in[2]~input_o\,
	datae => ALT_INV_COUNTER_PWM(2),
	dataf => ALT_INV_COUNTER_PWM(3),
	combout => \LessThan0~3_combout\);

-- Location: LABCELL_X81_Y4_N24
\LessThan0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = ( \X_PWM_in[4]~input_o\ & ( COUNTER_PWM(4) & ( (!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\) ) ) ) # ( !\X_PWM_in[4]~input_o\ & ( !COUNTER_PWM(4) & ( (!\ALUFN[3]~input_o\ & !\ALUFN[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000011000000000000000000000000000000000000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_ALUFN[4]~input_o\,
	datae => \ALT_INV_X_PWM_in[4]~input_o\,
	dataf => ALT_INV_COUNTER_PWM(4),
	combout => \LessThan0~5_combout\);

-- Location: LABCELL_X81_Y4_N21
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( \ALUFN[4]~input_o\ & ( COUNTER_PWM(5) ) ) # ( !\ALUFN[4]~input_o\ & ( COUNTER_PWM(5) & ( (!\X_PWM_in[5]~input_o\) # (\ALUFN[3]~input_o\) ) ) ) # ( !\ALUFN[4]~input_o\ & ( !COUNTER_PWM(5) & ( (!\ALUFN[3]~input_o\ & 
-- \X_PWM_in[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000000000000000011110011111100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ALUFN[3]~input_o\,
	datac => \ALT_INV_X_PWM_in[5]~input_o\,
	datae => \ALT_INV_ALUFN[4]~input_o\,
	dataf => ALT_INV_COUNTER_PWM(5),
	combout => \LessThan0~1_combout\);

-- Location: LABCELL_X81_Y4_N45
\LessThan0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ( !COUNTER_PWM(2) & ( COUNTER_PWM(3) & ( (\X_PWM_in[3]~input_o\ & \X_PWM_in[2]~input_o\) ) ) ) # ( COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( \X_PWM_in[3]~input_o\ ) ) ) # ( !COUNTER_PWM(2) & ( !COUNTER_PWM(3) & ( 
-- (\X_PWM_in[2]~input_o\) # (\X_PWM_in[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111101011111010101010101010100000101000001010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X_PWM_in[3]~input_o\,
	datac => \ALT_INV_X_PWM_in[2]~input_o\,
	datae => ALT_INV_COUNTER_PWM(2),
	dataf => ALT_INV_COUNTER_PWM(3),
	combout => \LessThan0~4_combout\);

-- Location: IOIBUF_X84_Y0_N1
\X_PWM_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(1),
	o => \X_PWM_in[1]~input_o\);

-- Location: IOIBUF_X89_Y6_N55
\X_PWM_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X_PWM_in(0),
	o => \X_PWM_in[0]~input_o\);

-- Location: LABCELL_X81_Y4_N57
\LessThan0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = ( !COUNTER_PWM(1) & ( COUNTER_PWM(0) & ( \X_PWM_in[1]~input_o\ ) ) ) # ( COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( (\X_PWM_in[1]~input_o\ & \X_PWM_in[0]~input_o\) ) ) ) # ( !COUNTER_PWM(1) & ( !COUNTER_PWM(0) & ( 
-- (\X_PWM_in[0]~input_o\) # (\X_PWM_in[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111000000000101010101010101010101010000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_X_PWM_in[1]~input_o\,
	datad => \ALT_INV_X_PWM_in[0]~input_o\,
	datae => ALT_INV_COUNTER_PWM(1),
	dataf => ALT_INV_COUNTER_PWM(0),
	combout => \LessThan0~2_combout\);

-- Location: LABCELL_X81_Y4_N30
\LessThan0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = ( \LessThan0~2_combout\ & ( \LessThan0~0_combout\ & ( (\LessThan0~5_combout\ & (!\LessThan0~1_combout\ & ((!\LessThan0~3_combout\) # (\LessThan0~4_combout\)))) ) ) ) # ( !\LessThan0~2_combout\ & ( \LessThan0~0_combout\ & ( 
-- (\LessThan0~5_combout\ & (!\LessThan0~1_combout\ & \LessThan0~4_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000001100000010000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~3_combout\,
	datab => \ALT_INV_LessThan0~5_combout\,
	datac => \ALT_INV_LessThan0~1_combout\,
	datad => \ALT_INV_LessThan0~4_combout\,
	datae => \ALT_INV_LessThan0~2_combout\,
	dataf => \ALT_INV_LessThan0~0_combout\,
	combout => \LessThan0~6_combout\);

-- Location: LABCELL_X79_Y4_N12
\PWM_0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \PWM_0~2_combout\ = ( \PWM_0~q\ & ( \LessThan0~6_combout\ ) ) # ( \PWM_0~q\ & ( !\LessThan0~6_combout\ & ( (!\PWM_0~1_combout\) # (((!\LessThan0~10_combout\) # (!\LessThan1~8_combout\)) # (\LessThan1~5_combout\)) ) ) ) # ( !\PWM_0~q\ & ( 
-- !\LessThan0~6_combout\ & ( (\PWM_0~1_combout\ & (\LessThan0~10_combout\ & ((!\LessThan1~8_combout\) # (\LessThan1~5_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000001111111111111101100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PWM_0~1_combout\,
	datab => \ALT_INV_LessThan1~5_combout\,
	datac => \ALT_INV_LessThan0~10_combout\,
	datad => \ALT_INV_LessThan1~8_combout\,
	datae => \ALT_INV_PWM_0~q\,
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \PWM_0~2_combout\);

-- Location: FF_X79_Y4_N13
PWM_0 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \PWM_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PWM_0~q\);

-- Location: LABCELL_X80_Y4_N42
\PWM_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \PWM_0~0_combout\ = ( \LessThan1~5_combout\ & ( \LessThan0~6_combout\ & ( !\PWM_0~q\ ) ) ) # ( !\LessThan1~5_combout\ & ( \LessThan0~6_combout\ & ( !\PWM_0~q\ ) ) ) # ( \LessThan1~5_combout\ & ( !\LessThan0~6_combout\ & ( (!\PWM_0~q\ & 
-- !\LessThan0~10_combout\) ) ) ) # ( !\LessThan1~5_combout\ & ( !\LessThan0~6_combout\ & ( (!\LessThan0~10_combout\ & (!\PWM_0~q\)) # (\LessThan0~10_combout\ & ((\LessThan1~8_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000001111101010100000000010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PWM_0~q\,
	datac => \ALT_INV_LessThan1~8_combout\,
	datad => \ALT_INV_LessThan0~10_combout\,
	datae => \ALT_INV_LessThan1~5_combout\,
	dataf => \ALT_INV_LessThan0~6_combout\,
	combout => \PWM_0~0_combout\);

-- Location: LABCELL_X80_Y4_N48
\PWM_OUT~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \PWM_OUT~1_combout\ = ( \PWM_0~0_combout\ & ( (!\PWM_OUT~0_combout\ & (((!\ENA~input_o\ & \PWM_OUT~reg0_q\)))) # (\PWM_OUT~0_combout\ & (((!\ENA~input_o\ & \PWM_OUT~reg0_q\)) # (\ALUFN[0]~input_o\))) ) ) # ( !\PWM_0~0_combout\ & ( (!\PWM_OUT~0_combout\ & 
-- (((!\ENA~input_o\ & \PWM_OUT~reg0_q\)))) # (\PWM_OUT~0_combout\ & ((!\ALUFN[0]~input_o\) # ((!\ENA~input_o\ & \PWM_OUT~reg0_q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010011110100010001001111010000010001111100010001000111110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_PWM_OUT~0_combout\,
	datab => \ALT_INV_ALUFN[0]~input_o\,
	datac => \ALT_INV_ENA~input_o\,
	datad => \ALT_INV_PWM_OUT~reg0_q\,
	dataf => \ALT_INV_PWM_0~0_combout\,
	combout => \PWM_OUT~1_combout\);

-- Location: FF_X80_Y4_N49
\PWM_OUT~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~inputCLKENA0_outclk\,
	d => \PWM_OUT~1_combout\,
	clrn => \ALT_INV_RST~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PWM_OUT~reg0_q\);

-- Location: MLABCELL_X47_Y10_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


