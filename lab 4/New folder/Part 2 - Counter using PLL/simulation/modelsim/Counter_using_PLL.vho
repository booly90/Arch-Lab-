-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Web Edition"

-- DATE "04/27/2014 18:13:13"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	CounterEnvelope IS
    PORT (
	Clk : IN std_logic;
	En : IN std_logic;
	Qout : OUT std_logic_vector(7 DOWNTO 0)
	);
END CounterEnvelope;

-- Design Ports Information
-- Qout[0]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[1]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[2]	=>  Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[3]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[4]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[5]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[6]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Qout[7]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- En	=>  Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Clk	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF CounterEnvelope IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_En : std_logic;
SIGNAL ww_Qout : std_logic_vector(7 DOWNTO 0);
SIGNAL \m1|altpll_component|pll_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \m1|altpll_component|pll_CLK_bus\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \m1|altpll_component|_clk0~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \m1|altpll_component|pll~CLK1\ : std_logic;
SIGNAL \m1|altpll_component|pll~CLK2\ : std_logic;
SIGNAL \m0|q_int[1]~31_combout\ : std_logic;
SIGNAL \m0|q_int[3]~35_combout\ : std_logic;
SIGNAL \m0|q_int[5]~39_combout\ : std_logic;
SIGNAL \m0|q_int[6]~41_combout\ : std_logic;
SIGNAL \m0|q_int[8]~45_combout\ : std_logic;
SIGNAL \m0|q_int[10]~49_combout\ : std_logic;
SIGNAL \m0|q_int[12]~53_combout\ : std_logic;
SIGNAL \m0|q_int[19]~67_combout\ : std_logic;
SIGNAL \m0|q_int[21]~71_combout\ : std_logic;
SIGNAL \m0|q_int[22]~73_combout\ : std_logic;
SIGNAL \Clk~combout\ : std_logic;
SIGNAL \m1|altpll_component|_clk0\ : std_logic;
SIGNAL \m1|altpll_component|_clk0~clkctrl_outclk\ : std_logic;
SIGNAL \m0|q_int[0]~93_combout\ : std_logic;
SIGNAL \m0|q_int[1]~32\ : std_logic;
SIGNAL \m0|q_int[2]~33_combout\ : std_logic;
SIGNAL \En~combout\ : std_logic;
SIGNAL \m0|q_int[2]~34\ : std_logic;
SIGNAL \m0|q_int[3]~36\ : std_logic;
SIGNAL \m0|q_int[4]~37_combout\ : std_logic;
SIGNAL \m0|q_int[4]~38\ : std_logic;
SIGNAL \m0|q_int[5]~40\ : std_logic;
SIGNAL \m0|q_int[6]~42\ : std_logic;
SIGNAL \m0|q_int[7]~43_combout\ : std_logic;
SIGNAL \m0|q_int[7]~44\ : std_logic;
SIGNAL \m0|q_int[8]~46\ : std_logic;
SIGNAL \m0|q_int[9]~47_combout\ : std_logic;
SIGNAL \m0|q_int[9]~48\ : std_logic;
SIGNAL \m0|q_int[10]~50\ : std_logic;
SIGNAL \m0|q_int[11]~51_combout\ : std_logic;
SIGNAL \m0|q_int[11]~52\ : std_logic;
SIGNAL \m0|q_int[12]~54\ : std_logic;
SIGNAL \m0|q_int[13]~55_combout\ : std_logic;
SIGNAL \m0|q_int[13]~56\ : std_logic;
SIGNAL \m0|q_int[14]~57_combout\ : std_logic;
SIGNAL \m0|q_int[14]~58\ : std_logic;
SIGNAL \m0|q_int[15]~59_combout\ : std_logic;
SIGNAL \m0|q_int[15]~60\ : std_logic;
SIGNAL \m0|q_int[16]~61_combout\ : std_logic;
SIGNAL \m0|q_int[16]~62\ : std_logic;
SIGNAL \m0|q_int[17]~63_combout\ : std_logic;
SIGNAL \m0|q_int[17]~64\ : std_logic;
SIGNAL \m0|q_int[18]~65_combout\ : std_logic;
SIGNAL \m0|q_int[18]~66\ : std_logic;
SIGNAL \m0|q_int[19]~68\ : std_logic;
SIGNAL \m0|q_int[20]~69_combout\ : std_logic;
SIGNAL \m0|q_int[20]~70\ : std_logic;
SIGNAL \m0|q_int[21]~72\ : std_logic;
SIGNAL \m0|q_int[22]~74\ : std_logic;
SIGNAL \m0|q_int[23]~75_combout\ : std_logic;
SIGNAL \m0|q_int[23]~76\ : std_logic;
SIGNAL \m0|q_int[24]~77_combout\ : std_logic;
SIGNAL \m0|q_int[24]~78\ : std_logic;
SIGNAL \m0|q_int[25]~79_combout\ : std_logic;
SIGNAL \m0|q_int[25]~80\ : std_logic;
SIGNAL \m0|q_int[26]~81_combout\ : std_logic;
SIGNAL \m0|q_int[26]~82\ : std_logic;
SIGNAL \m0|q_int[27]~83_combout\ : std_logic;
SIGNAL \m0|q_int[27]~84\ : std_logic;
SIGNAL \m0|q_int[28]~85_combout\ : std_logic;
SIGNAL \m0|q_int[28]~86\ : std_logic;
SIGNAL \m0|q_int[29]~87_combout\ : std_logic;
SIGNAL \m0|q_int[29]~88\ : std_logic;
SIGNAL \m0|q_int[30]~89_combout\ : std_logic;
SIGNAL \m0|q_int[30]~90\ : std_logic;
SIGNAL \m0|q_int[31]~91_combout\ : std_logic;
SIGNAL \m0|q_int\ : std_logic_vector(31 DOWNTO 0);

BEGIN

ww_Clk <= Clk;
ww_En <= En;
Qout <= ww_Qout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\m1|altpll_component|pll_INCLK_bus\ <= (gnd & \Clk~combout\);

\m1|altpll_component|_clk0\ <= \m1|altpll_component|pll_CLK_bus\(0);
\m1|altpll_component|pll~CLK1\ <= \m1|altpll_component|pll_CLK_bus\(1);
\m1|altpll_component|pll~CLK2\ <= \m1|altpll_component|pll_CLK_bus\(2);

\m1|altpll_component|_clk0~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \m1|altpll_component|_clk0\);

-- Location: LCFF_X49_Y7_N13
\m0|q_int[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[22]~73_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(22));

-- Location: LCFF_X49_Y7_N11
\m0|q_int[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[21]~71_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(21));

-- Location: LCFF_X49_Y7_N7
\m0|q_int[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[19]~67_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(19));

-- Location: LCFF_X49_Y8_N25
\m0|q_int[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[12]~53_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(12));

-- Location: LCFF_X49_Y8_N21
\m0|q_int[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[10]~49_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(10));

-- Location: LCFF_X49_Y8_N17
\m0|q_int[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[8]~45_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(8));

-- Location: LCFF_X49_Y8_N13
\m0|q_int[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[6]~41_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(6));

-- Location: LCFF_X49_Y8_N11
\m0|q_int[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[5]~39_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(5));

-- Location: LCFF_X49_Y8_N7
\m0|q_int[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[3]~35_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(3));

-- Location: LCFF_X49_Y8_N3
\m0|q_int[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[1]~31_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(1));

-- Location: LCCOMB_X49_Y8_N2
\m0|q_int[1]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[1]~31_combout\ = (\m0|q_int\(1) & (\m0|q_int\(0) $ (VCC))) # (!\m0|q_int\(1) & (\m0|q_int\(0) & VCC))
-- \m0|q_int[1]~32\ = CARRY((\m0|q_int\(1) & \m0|q_int\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(1),
	datab => \m0|q_int\(0),
	datad => VCC,
	combout => \m0|q_int[1]~31_combout\,
	cout => \m0|q_int[1]~32\);

-- Location: LCCOMB_X49_Y8_N6
\m0|q_int[3]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[3]~35_combout\ = (\m0|q_int\(3) & (\m0|q_int[2]~34\ $ (GND))) # (!\m0|q_int\(3) & (!\m0|q_int[2]~34\ & VCC))
-- \m0|q_int[3]~36\ = CARRY((\m0|q_int\(3) & !\m0|q_int[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(3),
	datad => VCC,
	cin => \m0|q_int[2]~34\,
	combout => \m0|q_int[3]~35_combout\,
	cout => \m0|q_int[3]~36\);

-- Location: LCCOMB_X49_Y8_N10
\m0|q_int[5]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[5]~39_combout\ = (\m0|q_int\(5) & (\m0|q_int[4]~38\ $ (GND))) # (!\m0|q_int\(5) & (!\m0|q_int[4]~38\ & VCC))
-- \m0|q_int[5]~40\ = CARRY((\m0|q_int\(5) & !\m0|q_int[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(5),
	datad => VCC,
	cin => \m0|q_int[4]~38\,
	combout => \m0|q_int[5]~39_combout\,
	cout => \m0|q_int[5]~40\);

-- Location: LCCOMB_X49_Y8_N12
\m0|q_int[6]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[6]~41_combout\ = (\m0|q_int\(6) & (!\m0|q_int[5]~40\)) # (!\m0|q_int\(6) & ((\m0|q_int[5]~40\) # (GND)))
-- \m0|q_int[6]~42\ = CARRY((!\m0|q_int[5]~40\) # (!\m0|q_int\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(6),
	datad => VCC,
	cin => \m0|q_int[5]~40\,
	combout => \m0|q_int[6]~41_combout\,
	cout => \m0|q_int[6]~42\);

-- Location: LCCOMB_X49_Y8_N16
\m0|q_int[8]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[8]~45_combout\ = (\m0|q_int\(8) & (!\m0|q_int[7]~44\)) # (!\m0|q_int\(8) & ((\m0|q_int[7]~44\) # (GND)))
-- \m0|q_int[8]~46\ = CARRY((!\m0|q_int[7]~44\) # (!\m0|q_int\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(8),
	datad => VCC,
	cin => \m0|q_int[7]~44\,
	combout => \m0|q_int[8]~45_combout\,
	cout => \m0|q_int[8]~46\);

-- Location: LCCOMB_X49_Y8_N20
\m0|q_int[10]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[10]~49_combout\ = (\m0|q_int\(10) & (!\m0|q_int[9]~48\)) # (!\m0|q_int\(10) & ((\m0|q_int[9]~48\) # (GND)))
-- \m0|q_int[10]~50\ = CARRY((!\m0|q_int[9]~48\) # (!\m0|q_int\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(10),
	datad => VCC,
	cin => \m0|q_int[9]~48\,
	combout => \m0|q_int[10]~49_combout\,
	cout => \m0|q_int[10]~50\);

-- Location: LCCOMB_X49_Y8_N24
\m0|q_int[12]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[12]~53_combout\ = (\m0|q_int\(12) & (!\m0|q_int[11]~52\)) # (!\m0|q_int\(12) & ((\m0|q_int[11]~52\) # (GND)))
-- \m0|q_int[12]~54\ = CARRY((!\m0|q_int[11]~52\) # (!\m0|q_int\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(12),
	datad => VCC,
	cin => \m0|q_int[11]~52\,
	combout => \m0|q_int[12]~53_combout\,
	cout => \m0|q_int[12]~54\);

-- Location: LCCOMB_X49_Y7_N6
\m0|q_int[19]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[19]~67_combout\ = (\m0|q_int\(19) & (\m0|q_int[18]~66\ $ (GND))) # (!\m0|q_int\(19) & (!\m0|q_int[18]~66\ & VCC))
-- \m0|q_int[19]~68\ = CARRY((\m0|q_int\(19) & !\m0|q_int[18]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(19),
	datad => VCC,
	cin => \m0|q_int[18]~66\,
	combout => \m0|q_int[19]~67_combout\,
	cout => \m0|q_int[19]~68\);

-- Location: LCCOMB_X49_Y7_N10
\m0|q_int[21]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[21]~71_combout\ = (\m0|q_int\(21) & (\m0|q_int[20]~70\ $ (GND))) # (!\m0|q_int\(21) & (!\m0|q_int[20]~70\ & VCC))
-- \m0|q_int[21]~72\ = CARRY((\m0|q_int\(21) & !\m0|q_int[20]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(21),
	datad => VCC,
	cin => \m0|q_int[20]~70\,
	combout => \m0|q_int[21]~71_combout\,
	cout => \m0|q_int[21]~72\);

-- Location: LCCOMB_X49_Y7_N12
\m0|q_int[22]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[22]~73_combout\ = (\m0|q_int\(22) & (!\m0|q_int[21]~72\)) # (!\m0|q_int\(22) & ((\m0|q_int[21]~72\) # (GND)))
-- \m0|q_int[22]~74\ = CARRY((!\m0|q_int[21]~72\) # (!\m0|q_int\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(22),
	datad => VCC,
	cin => \m0|q_int[21]~72\,
	combout => \m0|q_int[22]~73_combout\,
	cout => \m0|q_int[22]~74\);

-- Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Clk,
	combout => \Clk~combout\);

-- Location: PLL_1
\m1|altpll_component|pll\ : cycloneii_pll
-- pragma translate_off
GENERIC MAP (
	bandwidth => 0,
	bandwidth_type => "low",
	c0_high => 5,
	c0_initial => 1,
	c0_low => 5,
	c0_mode => "even",
	c0_ph => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	charge_pump_current => 80,
	clk0_counter => "c0",
	clk0_divide_by => 2,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 3,
	clk0_phase_shift => "0",
	clk1_duty_cycle => 50,
	clk1_phase_shift => "0",
	clk2_duty_cycle => 50,
	clk2_phase_shift => "0",
	compensate_clock => "clk0",
	gate_lock_counter => 0,
	gate_lock_signal => "no",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 20000,
	invalid_lock_multiplier => 5,
	loop_filter_c => 3,
	loop_filter_r => " 2.500000",
	m => 15,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 100000,
	pfd_min => 2484,
	pll_compensation_delay => 5937,
	self_reset_on_gated_loss_lock => "off",
	sim_gate_lock_device_behavior => "off",
	simulation_type => "timing",
	valid_lock_multiplier => 1,
	vco_center => 1333,
	vco_max => 2000,
	vco_min => 1000)
-- pragma translate_on
PORT MAP (
	areset => GND,
	inclk => \m1|altpll_component|pll_INCLK_bus\,
	clk => \m1|altpll_component|pll_CLK_bus\);

-- Location: CLKCTRL_G3
\m1|altpll_component|_clk0~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \m1|altpll_component|_clk0~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \m1|altpll_component|_clk0~clkctrl_outclk\);

-- Location: LCCOMB_X49_Y8_N0
\m0|q_int[0]~93\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[0]~93_combout\ = \En~combout\ $ (\m0|q_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \En~combout\,
	datac => \m0|q_int\(0),
	combout => \m0|q_int[0]~93_combout\);

-- Location: LCFF_X49_Y8_N1
\m0|q_int[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[0]~93_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(0));

-- Location: LCCOMB_X49_Y8_N4
\m0|q_int[2]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[2]~33_combout\ = (\m0|q_int\(2) & (!\m0|q_int[1]~32\)) # (!\m0|q_int\(2) & ((\m0|q_int[1]~32\) # (GND)))
-- \m0|q_int[2]~34\ = CARRY((!\m0|q_int[1]~32\) # (!\m0|q_int\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(2),
	datad => VCC,
	cin => \m0|q_int[1]~32\,
	combout => \m0|q_int[2]~33_combout\,
	cout => \m0|q_int[2]~34\);

-- Location: PIN_L22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\En~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_En,
	combout => \En~combout\);

-- Location: LCFF_X49_Y8_N5
\m0|q_int[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[2]~33_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(2));

-- Location: LCCOMB_X49_Y8_N8
\m0|q_int[4]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[4]~37_combout\ = (\m0|q_int\(4) & (!\m0|q_int[3]~36\)) # (!\m0|q_int\(4) & ((\m0|q_int[3]~36\) # (GND)))
-- \m0|q_int[4]~38\ = CARRY((!\m0|q_int[3]~36\) # (!\m0|q_int\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(4),
	datad => VCC,
	cin => \m0|q_int[3]~36\,
	combout => \m0|q_int[4]~37_combout\,
	cout => \m0|q_int[4]~38\);

-- Location: LCFF_X49_Y8_N9
\m0|q_int[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[4]~37_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(4));

-- Location: LCCOMB_X49_Y8_N14
\m0|q_int[7]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[7]~43_combout\ = (\m0|q_int\(7) & (\m0|q_int[6]~42\ $ (GND))) # (!\m0|q_int\(7) & (!\m0|q_int[6]~42\ & VCC))
-- \m0|q_int[7]~44\ = CARRY((\m0|q_int\(7) & !\m0|q_int[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(7),
	datad => VCC,
	cin => \m0|q_int[6]~42\,
	combout => \m0|q_int[7]~43_combout\,
	cout => \m0|q_int[7]~44\);

-- Location: LCFF_X49_Y8_N15
\m0|q_int[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[7]~43_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(7));

-- Location: LCCOMB_X49_Y8_N18
\m0|q_int[9]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[9]~47_combout\ = (\m0|q_int\(9) & (\m0|q_int[8]~46\ $ (GND))) # (!\m0|q_int\(9) & (!\m0|q_int[8]~46\ & VCC))
-- \m0|q_int[9]~48\ = CARRY((\m0|q_int\(9) & !\m0|q_int[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(9),
	datad => VCC,
	cin => \m0|q_int[8]~46\,
	combout => \m0|q_int[9]~47_combout\,
	cout => \m0|q_int[9]~48\);

-- Location: LCFF_X49_Y8_N19
\m0|q_int[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[9]~47_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(9));

-- Location: LCCOMB_X49_Y8_N22
\m0|q_int[11]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[11]~51_combout\ = (\m0|q_int\(11) & (\m0|q_int[10]~50\ $ (GND))) # (!\m0|q_int\(11) & (!\m0|q_int[10]~50\ & VCC))
-- \m0|q_int[11]~52\ = CARRY((\m0|q_int\(11) & !\m0|q_int[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(11),
	datad => VCC,
	cin => \m0|q_int[10]~50\,
	combout => \m0|q_int[11]~51_combout\,
	cout => \m0|q_int[11]~52\);

-- Location: LCFF_X49_Y8_N23
\m0|q_int[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[11]~51_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(11));

-- Location: LCCOMB_X49_Y8_N26
\m0|q_int[13]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[13]~55_combout\ = (\m0|q_int\(13) & (\m0|q_int[12]~54\ $ (GND))) # (!\m0|q_int\(13) & (!\m0|q_int[12]~54\ & VCC))
-- \m0|q_int[13]~56\ = CARRY((\m0|q_int\(13) & !\m0|q_int[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(13),
	datad => VCC,
	cin => \m0|q_int[12]~54\,
	combout => \m0|q_int[13]~55_combout\,
	cout => \m0|q_int[13]~56\);

-- Location: LCFF_X49_Y8_N27
\m0|q_int[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[13]~55_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(13));

-- Location: LCCOMB_X49_Y8_N28
\m0|q_int[14]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[14]~57_combout\ = (\m0|q_int\(14) & (!\m0|q_int[13]~56\)) # (!\m0|q_int\(14) & ((\m0|q_int[13]~56\) # (GND)))
-- \m0|q_int[14]~58\ = CARRY((!\m0|q_int[13]~56\) # (!\m0|q_int\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(14),
	datad => VCC,
	cin => \m0|q_int[13]~56\,
	combout => \m0|q_int[14]~57_combout\,
	cout => \m0|q_int[14]~58\);

-- Location: LCFF_X49_Y8_N29
\m0|q_int[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[14]~57_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(14));

-- Location: LCCOMB_X49_Y8_N30
\m0|q_int[15]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[15]~59_combout\ = (\m0|q_int\(15) & (\m0|q_int[14]~58\ $ (GND))) # (!\m0|q_int\(15) & (!\m0|q_int[14]~58\ & VCC))
-- \m0|q_int[15]~60\ = CARRY((\m0|q_int\(15) & !\m0|q_int[14]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(15),
	datad => VCC,
	cin => \m0|q_int[14]~58\,
	combout => \m0|q_int[15]~59_combout\,
	cout => \m0|q_int[15]~60\);

-- Location: LCFF_X49_Y8_N31
\m0|q_int[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[15]~59_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(15));

-- Location: LCCOMB_X49_Y7_N0
\m0|q_int[16]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[16]~61_combout\ = (\m0|q_int\(16) & (!\m0|q_int[15]~60\)) # (!\m0|q_int\(16) & ((\m0|q_int[15]~60\) # (GND)))
-- \m0|q_int[16]~62\ = CARRY((!\m0|q_int[15]~60\) # (!\m0|q_int\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(16),
	datad => VCC,
	cin => \m0|q_int[15]~60\,
	combout => \m0|q_int[16]~61_combout\,
	cout => \m0|q_int[16]~62\);

-- Location: LCFF_X49_Y7_N1
\m0|q_int[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[16]~61_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(16));

-- Location: LCCOMB_X49_Y7_N2
\m0|q_int[17]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[17]~63_combout\ = (\m0|q_int\(17) & (\m0|q_int[16]~62\ $ (GND))) # (!\m0|q_int\(17) & (!\m0|q_int[16]~62\ & VCC))
-- \m0|q_int[17]~64\ = CARRY((\m0|q_int\(17) & !\m0|q_int[16]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(17),
	datad => VCC,
	cin => \m0|q_int[16]~62\,
	combout => \m0|q_int[17]~63_combout\,
	cout => \m0|q_int[17]~64\);

-- Location: LCFF_X49_Y7_N3
\m0|q_int[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[17]~63_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(17));

-- Location: LCCOMB_X49_Y7_N4
\m0|q_int[18]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[18]~65_combout\ = (\m0|q_int\(18) & (!\m0|q_int[17]~64\)) # (!\m0|q_int\(18) & ((\m0|q_int[17]~64\) # (GND)))
-- \m0|q_int[18]~66\ = CARRY((!\m0|q_int[17]~64\) # (!\m0|q_int\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(18),
	datad => VCC,
	cin => \m0|q_int[17]~64\,
	combout => \m0|q_int[18]~65_combout\,
	cout => \m0|q_int[18]~66\);

-- Location: LCFF_X49_Y7_N5
\m0|q_int[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[18]~65_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(18));

-- Location: LCCOMB_X49_Y7_N8
\m0|q_int[20]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[20]~69_combout\ = (\m0|q_int\(20) & (!\m0|q_int[19]~68\)) # (!\m0|q_int\(20) & ((\m0|q_int[19]~68\) # (GND)))
-- \m0|q_int[20]~70\ = CARRY((!\m0|q_int[19]~68\) # (!\m0|q_int\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(20),
	datad => VCC,
	cin => \m0|q_int[19]~68\,
	combout => \m0|q_int[20]~69_combout\,
	cout => \m0|q_int[20]~70\);

-- Location: LCFF_X49_Y7_N9
\m0|q_int[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[20]~69_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(20));

-- Location: LCCOMB_X49_Y7_N14
\m0|q_int[23]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[23]~75_combout\ = (\m0|q_int\(23) & (\m0|q_int[22]~74\ $ (GND))) # (!\m0|q_int\(23) & (!\m0|q_int[22]~74\ & VCC))
-- \m0|q_int[23]~76\ = CARRY((\m0|q_int\(23) & !\m0|q_int[22]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(23),
	datad => VCC,
	cin => \m0|q_int[22]~74\,
	combout => \m0|q_int[23]~75_combout\,
	cout => \m0|q_int[23]~76\);

-- Location: LCFF_X49_Y7_N15
\m0|q_int[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[23]~75_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(23));

-- Location: LCCOMB_X49_Y7_N16
\m0|q_int[24]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[24]~77_combout\ = (\m0|q_int\(24) & (!\m0|q_int[23]~76\)) # (!\m0|q_int\(24) & ((\m0|q_int[23]~76\) # (GND)))
-- \m0|q_int[24]~78\ = CARRY((!\m0|q_int[23]~76\) # (!\m0|q_int\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(24),
	datad => VCC,
	cin => \m0|q_int[23]~76\,
	combout => \m0|q_int[24]~77_combout\,
	cout => \m0|q_int[24]~78\);

-- Location: LCFF_X49_Y7_N17
\m0|q_int[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[24]~77_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(24));

-- Location: LCCOMB_X49_Y7_N18
\m0|q_int[25]~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[25]~79_combout\ = (\m0|q_int\(25) & (\m0|q_int[24]~78\ $ (GND))) # (!\m0|q_int\(25) & (!\m0|q_int[24]~78\ & VCC))
-- \m0|q_int[25]~80\ = CARRY((\m0|q_int\(25) & !\m0|q_int[24]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(25),
	datad => VCC,
	cin => \m0|q_int[24]~78\,
	combout => \m0|q_int[25]~79_combout\,
	cout => \m0|q_int[25]~80\);

-- Location: LCFF_X49_Y7_N19
\m0|q_int[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[25]~79_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(25));

-- Location: LCCOMB_X49_Y7_N20
\m0|q_int[26]~81\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[26]~81_combout\ = (\m0|q_int\(26) & (!\m0|q_int[25]~80\)) # (!\m0|q_int\(26) & ((\m0|q_int[25]~80\) # (GND)))
-- \m0|q_int[26]~82\ = CARRY((!\m0|q_int[25]~80\) # (!\m0|q_int\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(26),
	datad => VCC,
	cin => \m0|q_int[25]~80\,
	combout => \m0|q_int[26]~81_combout\,
	cout => \m0|q_int[26]~82\);

-- Location: LCFF_X49_Y7_N21
\m0|q_int[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[26]~81_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(26));

-- Location: LCCOMB_X49_Y7_N22
\m0|q_int[27]~83\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[27]~83_combout\ = (\m0|q_int\(27) & (\m0|q_int[26]~82\ $ (GND))) # (!\m0|q_int\(27) & (!\m0|q_int[26]~82\ & VCC))
-- \m0|q_int[27]~84\ = CARRY((\m0|q_int\(27) & !\m0|q_int[26]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(27),
	datad => VCC,
	cin => \m0|q_int[26]~82\,
	combout => \m0|q_int[27]~83_combout\,
	cout => \m0|q_int[27]~84\);

-- Location: LCFF_X49_Y7_N23
\m0|q_int[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[27]~83_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(27));

-- Location: LCCOMB_X49_Y7_N24
\m0|q_int[28]~85\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[28]~85_combout\ = (\m0|q_int\(28) & (!\m0|q_int[27]~84\)) # (!\m0|q_int\(28) & ((\m0|q_int[27]~84\) # (GND)))
-- \m0|q_int[28]~86\ = CARRY((!\m0|q_int[27]~84\) # (!\m0|q_int\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m0|q_int\(28),
	datad => VCC,
	cin => \m0|q_int[27]~84\,
	combout => \m0|q_int[28]~85_combout\,
	cout => \m0|q_int[28]~86\);

-- Location: LCFF_X49_Y7_N25
\m0|q_int[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[28]~85_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(28));

-- Location: LCCOMB_X49_Y7_N26
\m0|q_int[29]~87\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[29]~87_combout\ = (\m0|q_int\(29) & (\m0|q_int[28]~86\ $ (GND))) # (!\m0|q_int\(29) & (!\m0|q_int[28]~86\ & VCC))
-- \m0|q_int[29]~88\ = CARRY((\m0|q_int\(29) & !\m0|q_int[28]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(29),
	datad => VCC,
	cin => \m0|q_int[28]~86\,
	combout => \m0|q_int[29]~87_combout\,
	cout => \m0|q_int[29]~88\);

-- Location: LCFF_X49_Y7_N27
\m0|q_int[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[29]~87_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(29));

-- Location: LCCOMB_X49_Y7_N28
\m0|q_int[30]~89\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[30]~89_combout\ = (\m0|q_int\(30) & (!\m0|q_int[29]~88\)) # (!\m0|q_int\(30) & ((\m0|q_int[29]~88\) # (GND)))
-- \m0|q_int[30]~90\ = CARRY((!\m0|q_int[29]~88\) # (!\m0|q_int\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m0|q_int\(30),
	datad => VCC,
	cin => \m0|q_int[29]~88\,
	combout => \m0|q_int[30]~89_combout\,
	cout => \m0|q_int[30]~90\);

-- Location: LCFF_X49_Y7_N29
\m0|q_int[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[30]~89_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(30));

-- Location: LCCOMB_X49_Y7_N30
\m0|q_int[31]~91\ : cycloneii_lcell_comb
-- Equation(s):
-- \m0|q_int[31]~91_combout\ = \m0|q_int[30]~90\ $ (!\m0|q_int\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \m0|q_int\(31),
	cin => \m0|q_int[30]~90\,
	combout => \m0|q_int[31]~91_combout\);

-- Location: LCFF_X49_Y7_N31
\m0|q_int[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \m1|altpll_component|_clk0~clkctrl_outclk\,
	datain => \m0|q_int[31]~91_combout\,
	ena => \En~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \m0|q_int\(31));

-- Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(24),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(0));

-- Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(25),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(1));

-- Location: PIN_V22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(26),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(2));

-- Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(27),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(3));

-- Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(28),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(4));

-- Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(29),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(5));

-- Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(30),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(6));

-- Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Qout[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \m0|q_int\(31),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Qout(7));
END structure;


