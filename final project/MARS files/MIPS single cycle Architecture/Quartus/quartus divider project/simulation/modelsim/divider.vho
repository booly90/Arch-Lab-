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

-- DATE "09/01/2024 18:15:14"

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

ENTITY 	divider_wrap IS
    PORT (
	dividend : IN std_logic_vector(31 DOWNTO 0);
	divisor : IN std_logic_vector(31 DOWNTO 0);
	PIN_AF14 : IN std_logic;
	rst : IN std_logic;
	ena : IN std_logic;
	div_ifg : OUT std_logic;
	result : OUT std_logic_vector(31 DOWNTO 0);
	remainder : OUT std_logic_vector(31 DOWNTO 0)
	);
END divider_wrap;

-- Design Ports Information
-- dividend[0]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[2]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[3]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[4]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[5]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[6]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[7]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[8]	=>  Location: PIN_AJ7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[9]	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[10]	=>  Location: PIN_AA20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[11]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[12]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[13]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[14]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[15]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[16]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[17]	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[18]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[19]	=>  Location: PIN_AJ20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[20]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[21]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[22]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[23]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[24]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[25]	=>  Location: PIN_AJ10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[26]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[27]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[28]	=>  Location: PIN_AF4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[29]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[30]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dividend[31]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[0]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[1]	=>  Location: PIN_AH9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[2]	=>  Location: PIN_AG26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[3]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[4]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[5]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[6]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[7]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[8]	=>  Location: PIN_AK23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[9]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[10]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[11]	=>  Location: PIN_AK13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[12]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[13]	=>  Location: PIN_AH29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[14]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[15]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[16]	=>  Location: PIN_AJ1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[17]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[18]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[19]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[20]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[21]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[22]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[23]	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[24]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[25]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[26]	=>  Location: PIN_AJ5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[27]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[28]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[29]	=>  Location: PIN_AH14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[30]	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- divisor[31]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- div_ifg	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[0]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[1]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[3]	=>  Location: PIN_AG16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[4]	=>  Location: PIN_AJ6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[5]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[6]	=>  Location: PIN_AJ29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[7]	=>  Location: PIN_AH28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[8]	=>  Location: PIN_AG27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[9]	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[10]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[11]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[12]	=>  Location: PIN_AJ14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[13]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[14]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[15]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[16]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[17]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[18]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[19]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[20]	=>  Location: PIN_AJ17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[21]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[22]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[23]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[24]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[25]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[26]	=>  Location: PIN_W15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[27]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[28]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[29]	=>  Location: PIN_Y24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[30]	=>  Location: PIN_AK22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- result[31]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[0]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[1]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[2]	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[3]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[4]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[5]	=>  Location: PIN_AK18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[6]	=>  Location: PIN_AJ22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[7]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[8]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[9]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[10]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[11]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[12]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[13]	=>  Location: PIN_AJ21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[14]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[15]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[16]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[17]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[18]	=>  Location: PIN_AF5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[19]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[20]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[21]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[22]	=>  Location: PIN_AJ4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[23]	=>  Location: PIN_AK11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[24]	=>  Location: PIN_AB23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[25]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[26]	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[27]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[28]	=>  Location: PIN_AG20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[29]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[30]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- remainder[31]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ena	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PIN_AF14	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF divider_wrap IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dividend : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_divisor : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_PIN_AF14 : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_ena : std_logic;
SIGNAL ww_div_ifg : std_logic;
SIGNAL ww_result : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_remainder : std_logic_vector(31 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \dividend[0]~input_o\ : std_logic;
SIGNAL \dividend[1]~input_o\ : std_logic;
SIGNAL \dividend[2]~input_o\ : std_logic;
SIGNAL \dividend[3]~input_o\ : std_logic;
SIGNAL \dividend[4]~input_o\ : std_logic;
SIGNAL \dividend[5]~input_o\ : std_logic;
SIGNAL \dividend[6]~input_o\ : std_logic;
SIGNAL \dividend[7]~input_o\ : std_logic;
SIGNAL \dividend[8]~input_o\ : std_logic;
SIGNAL \dividend[9]~input_o\ : std_logic;
SIGNAL \dividend[10]~input_o\ : std_logic;
SIGNAL \dividend[11]~input_o\ : std_logic;
SIGNAL \dividend[12]~input_o\ : std_logic;
SIGNAL \dividend[13]~input_o\ : std_logic;
SIGNAL \dividend[14]~input_o\ : std_logic;
SIGNAL \dividend[15]~input_o\ : std_logic;
SIGNAL \dividend[16]~input_o\ : std_logic;
SIGNAL \dividend[17]~input_o\ : std_logic;
SIGNAL \dividend[18]~input_o\ : std_logic;
SIGNAL \dividend[19]~input_o\ : std_logic;
SIGNAL \dividend[20]~input_o\ : std_logic;
SIGNAL \dividend[21]~input_o\ : std_logic;
SIGNAL \dividend[22]~input_o\ : std_logic;
SIGNAL \dividend[23]~input_o\ : std_logic;
SIGNAL \dividend[24]~input_o\ : std_logic;
SIGNAL \dividend[25]~input_o\ : std_logic;
SIGNAL \dividend[26]~input_o\ : std_logic;
SIGNAL \dividend[27]~input_o\ : std_logic;
SIGNAL \dividend[28]~input_o\ : std_logic;
SIGNAL \dividend[29]~input_o\ : std_logic;
SIGNAL \dividend[30]~input_o\ : std_logic;
SIGNAL \dividend[31]~input_o\ : std_logic;
SIGNAL \divisor[0]~input_o\ : std_logic;
SIGNAL \divisor[1]~input_o\ : std_logic;
SIGNAL \divisor[2]~input_o\ : std_logic;
SIGNAL \divisor[3]~input_o\ : std_logic;
SIGNAL \divisor[4]~input_o\ : std_logic;
SIGNAL \divisor[5]~input_o\ : std_logic;
SIGNAL \divisor[6]~input_o\ : std_logic;
SIGNAL \divisor[7]~input_o\ : std_logic;
SIGNAL \divisor[8]~input_o\ : std_logic;
SIGNAL \divisor[9]~input_o\ : std_logic;
SIGNAL \divisor[10]~input_o\ : std_logic;
SIGNAL \divisor[11]~input_o\ : std_logic;
SIGNAL \divisor[12]~input_o\ : std_logic;
SIGNAL \divisor[13]~input_o\ : std_logic;
SIGNAL \divisor[14]~input_o\ : std_logic;
SIGNAL \divisor[15]~input_o\ : std_logic;
SIGNAL \divisor[16]~input_o\ : std_logic;
SIGNAL \divisor[17]~input_o\ : std_logic;
SIGNAL \divisor[18]~input_o\ : std_logic;
SIGNAL \divisor[19]~input_o\ : std_logic;
SIGNAL \divisor[20]~input_o\ : std_logic;
SIGNAL \divisor[21]~input_o\ : std_logic;
SIGNAL \divisor[22]~input_o\ : std_logic;
SIGNAL \divisor[23]~input_o\ : std_logic;
SIGNAL \divisor[24]~input_o\ : std_logic;
SIGNAL \divisor[25]~input_o\ : std_logic;
SIGNAL \divisor[26]~input_o\ : std_logic;
SIGNAL \divisor[27]~input_o\ : std_logic;
SIGNAL \divisor[28]~input_o\ : std_logic;
SIGNAL \divisor[29]~input_o\ : std_logic;
SIGNAL \divisor[30]~input_o\ : std_logic;
SIGNAL \divisor[31]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \PIN_AF14~input_o\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \ena~input_o\ : std_logic;
SIGNAL \div|busy~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \div|busy~q\ : std_logic;
SIGNAL \div|toggle~0_combout\ : std_logic;
SIGNAL \div|toggle~q\ : std_logic;
SIGNAL \div|Add1~125_sumout\ : std_logic;
SIGNAL \div|count~6_combout\ : std_logic;
SIGNAL \div|count[4]~1_combout\ : std_logic;
SIGNAL \div|Add1~126\ : std_logic;
SIGNAL \div|Add1~121_sumout\ : std_logic;
SIGNAL \div|count~5_combout\ : std_logic;
SIGNAL \div|Add1~122\ : std_logic;
SIGNAL \div|Add1~117_sumout\ : std_logic;
SIGNAL \div|count~4_combout\ : std_logic;
SIGNAL \div|Add1~118\ : std_logic;
SIGNAL \div|Add1~113_sumout\ : std_logic;
SIGNAL \div|count~3_combout\ : std_logic;
SIGNAL \div|Add1~114\ : std_logic;
SIGNAL \div|Add1~109_sumout\ : std_logic;
SIGNAL \div|count~2_combout\ : std_logic;
SIGNAL \div|Add1~110\ : std_logic;
SIGNAL \div|Add1~105_sumout\ : std_logic;
SIGNAL \div|process_0~0_combout\ : std_logic;
SIGNAL \div|Add1~106\ : std_logic;
SIGNAL \div|Add1~101_sumout\ : std_logic;
SIGNAL \div|Add1~102\ : std_logic;
SIGNAL \div|Add1~97_sumout\ : std_logic;
SIGNAL \div|Add1~98\ : std_logic;
SIGNAL \div|Add1~93_sumout\ : std_logic;
SIGNAL \div|Add1~94\ : std_logic;
SIGNAL \div|Add1~89_sumout\ : std_logic;
SIGNAL \div|Add1~90\ : std_logic;
SIGNAL \div|Add1~85_sumout\ : std_logic;
SIGNAL \div|Add1~86\ : std_logic;
SIGNAL \div|Add1~81_sumout\ : std_logic;
SIGNAL \div|Add1~82\ : std_logic;
SIGNAL \div|Add1~77_sumout\ : std_logic;
SIGNAL \div|Add1~78\ : std_logic;
SIGNAL \div|Add1~73_sumout\ : std_logic;
SIGNAL \div|Add1~74\ : std_logic;
SIGNAL \div|Add1~69_sumout\ : std_logic;
SIGNAL \div|Add1~70\ : std_logic;
SIGNAL \div|Add1~65_sumout\ : std_logic;
SIGNAL \div|Add1~66\ : std_logic;
SIGNAL \div|Add1~61_sumout\ : std_logic;
SIGNAL \div|Add1~62\ : std_logic;
SIGNAL \div|Add1~57_sumout\ : std_logic;
SIGNAL \div|Add1~58\ : std_logic;
SIGNAL \div|Add1~53_sumout\ : std_logic;
SIGNAL \div|Add1~54\ : std_logic;
SIGNAL \div|Add1~49_sumout\ : std_logic;
SIGNAL \div|Add1~50\ : std_logic;
SIGNAL \div|Add1~45_sumout\ : std_logic;
SIGNAL \div|Add1~46\ : std_logic;
SIGNAL \div|Add1~41_sumout\ : std_logic;
SIGNAL \div|Add1~42\ : std_logic;
SIGNAL \div|Add1~37_sumout\ : std_logic;
SIGNAL \div|Add1~38\ : std_logic;
SIGNAL \div|Add1~33_sumout\ : std_logic;
SIGNAL \div|Add1~34\ : std_logic;
SIGNAL \div|Add1~29_sumout\ : std_logic;
SIGNAL \div|Add1~30\ : std_logic;
SIGNAL \div|Add1~25_sumout\ : std_logic;
SIGNAL \div|Add1~26\ : std_logic;
SIGNAL \div|Add1~21_sumout\ : std_logic;
SIGNAL \div|Add1~22\ : std_logic;
SIGNAL \div|Add1~17_sumout\ : std_logic;
SIGNAL \div|Add1~18\ : std_logic;
SIGNAL \div|Add1~13_sumout\ : std_logic;
SIGNAL \div|Add1~14\ : std_logic;
SIGNAL \div|Add1~9_sumout\ : std_logic;
SIGNAL \div|Add1~10\ : std_logic;
SIGNAL \div|Add1~5_sumout\ : std_logic;
SIGNAL \div|Add1~6\ : std_logic;
SIGNAL \div|Add1~1_sumout\ : std_logic;
SIGNAL \div|count~0_combout\ : std_logic;
SIGNAL \div|div_ifg~0_combout\ : std_logic;
SIGNAL \div|div_ifg~q\ : std_logic;
SIGNAL \div|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \pll_1|pll_0|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_ena~input_o\ : std_logic;
SIGNAL \div|ALT_INV_count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \div|ALT_INV_toggle~q\ : std_logic;
SIGNAL \div|ALT_INV_busy~q\ : std_logic;
SIGNAL \div|ALT_INV_div_ifg~q\ : std_logic;
SIGNAL \div|ALT_INV_Add1~125_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add1~121_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add1~117_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add1~113_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add1~109_sumout\ : std_logic;
SIGNAL \div|ALT_INV_Add1~1_sumout\ : std_logic;

BEGIN

ww_dividend <= dividend;
ww_divisor <= divisor;
ww_PIN_AF14 <= PIN_AF14;
ww_rst <= rst;
ww_ena <= ena;
div_ifg <= ww_div_ifg;
result <= ww_result;
remainder <= ww_remainder;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \PIN_AF14~input_o\);

\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_ena~input_o\ <= NOT \ena~input_o\;
\div|ALT_INV_count\(0) <= NOT \div|count\(0);
\div|ALT_INV_count\(1) <= NOT \div|count\(1);
\div|ALT_INV_count\(2) <= NOT \div|count\(2);
\div|ALT_INV_count\(3) <= NOT \div|count\(3);
\div|ALT_INV_count\(4) <= NOT \div|count\(4);
\div|ALT_INV_toggle~q\ <= NOT \div|toggle~q\;
\div|ALT_INV_count\(31) <= NOT \div|count\(31);
\div|ALT_INV_busy~q\ <= NOT \div|busy~q\;
\div|ALT_INV_div_ifg~q\ <= NOT \div|div_ifg~q\;
\div|ALT_INV_Add1~125_sumout\ <= NOT \div|Add1~125_sumout\;
\div|ALT_INV_Add1~121_sumout\ <= NOT \div|Add1~121_sumout\;
\div|ALT_INV_Add1~117_sumout\ <= NOT \div|Add1~117_sumout\;
\div|ALT_INV_Add1~113_sumout\ <= NOT \div|Add1~113_sumout\;
\div|ALT_INV_Add1~109_sumout\ <= NOT \div|Add1~109_sumout\;
\div|ALT_INV_count\(5) <= NOT \div|count\(5);
\div|ALT_INV_count\(6) <= NOT \div|count\(6);
\div|ALT_INV_count\(7) <= NOT \div|count\(7);
\div|ALT_INV_count\(8) <= NOT \div|count\(8);
\div|ALT_INV_count\(9) <= NOT \div|count\(9);
\div|ALT_INV_count\(10) <= NOT \div|count\(10);
\div|ALT_INV_count\(11) <= NOT \div|count\(11);
\div|ALT_INV_count\(12) <= NOT \div|count\(12);
\div|ALT_INV_count\(13) <= NOT \div|count\(13);
\div|ALT_INV_count\(14) <= NOT \div|count\(14);
\div|ALT_INV_count\(15) <= NOT \div|count\(15);
\div|ALT_INV_count\(16) <= NOT \div|count\(16);
\div|ALT_INV_count\(17) <= NOT \div|count\(17);
\div|ALT_INV_count\(18) <= NOT \div|count\(18);
\div|ALT_INV_count\(19) <= NOT \div|count\(19);
\div|ALT_INV_count\(20) <= NOT \div|count\(20);
\div|ALT_INV_count\(21) <= NOT \div|count\(21);
\div|ALT_INV_count\(22) <= NOT \div|count\(22);
\div|ALT_INV_count\(23) <= NOT \div|count\(23);
\div|ALT_INV_count\(24) <= NOT \div|count\(24);
\div|ALT_INV_count\(25) <= NOT \div|count\(25);
\div|ALT_INV_count\(26) <= NOT \div|count\(26);
\div|ALT_INV_count\(27) <= NOT \div|count\(27);
\div|ALT_INV_count\(28) <= NOT \div|count\(28);
\div|ALT_INV_count\(29) <= NOT \div|count\(29);
\div|ALT_INV_count\(30) <= NOT \div|count\(30);
\div|ALT_INV_Add1~1_sumout\ <= NOT \div|Add1~1_sumout\;

-- Location: IOOBUF_X56_Y0_N36
\div_ifg~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \div|div_ifg~q\,
	devoe => ww_devoe,
	o => ww_div_ifg);

-- Location: IOOBUF_X28_Y81_N36
\result[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(0));

-- Location: IOOBUF_X89_Y25_N5
\result[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(1));

-- Location: IOOBUF_X26_Y81_N59
\result[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(2));

-- Location: IOOBUF_X50_Y0_N76
\result[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(3));

-- Location: IOOBUF_X26_Y0_N76
\result[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(4));

-- Location: IOOBUF_X12_Y81_N19
\result[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(5));

-- Location: IOOBUF_X89_Y6_N39
\result[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(6));

-- Location: IOOBUF_X89_Y4_N96
\result[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(7));

-- Location: IOOBUF_X89_Y4_N79
\result[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(8));

-- Location: IOOBUF_X89_Y13_N5
\result[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(9));

-- Location: IOOBUF_X36_Y0_N2
\result[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(10));

-- Location: IOOBUF_X18_Y81_N59
\result[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(11));

-- Location: IOOBUF_X40_Y0_N36
\result[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(12));

-- Location: IOOBUF_X89_Y23_N56
\result[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(13));

-- Location: IOOBUF_X89_Y21_N56
\result[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(14));

-- Location: IOOBUF_X89_Y11_N79
\result[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(15));

-- Location: IOOBUF_X50_Y0_N59
\result[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(16));

-- Location: IOOBUF_X89_Y9_N56
\result[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(17));

-- Location: IOOBUF_X88_Y0_N37
\result[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(18));

-- Location: IOOBUF_X6_Y0_N2
\result[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(19));

-- Location: IOOBUF_X58_Y0_N42
\result[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(20));

-- Location: IOOBUF_X89_Y9_N39
\result[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(21));

-- Location: IOOBUF_X28_Y81_N53
\result[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(22));

-- Location: IOOBUF_X8_Y81_N19
\result[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(23));

-- Location: IOOBUF_X20_Y0_N2
\result[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(24));

-- Location: IOOBUF_X20_Y81_N36
\result[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(25));

-- Location: IOOBUF_X40_Y0_N2
\result[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(26));

-- Location: IOOBUF_X89_Y16_N5
\result[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(27));

-- Location: IOOBUF_X89_Y11_N45
\result[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(28));

-- Location: IOOBUF_X89_Y13_N22
\result[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(29));

-- Location: IOOBUF_X68_Y0_N53
\result[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(30));

-- Location: IOOBUF_X26_Y81_N76
\result[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_result(31));

-- Location: IOOBUF_X30_Y81_N2
\remainder[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(0));

-- Location: IOOBUF_X78_Y0_N53
\remainder[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(1));

-- Location: IOOBUF_X12_Y81_N36
\remainder[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(2));

-- Location: IOOBUF_X10_Y81_N93
\remainder[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(3));

-- Location: IOOBUF_X64_Y0_N19
\remainder[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(4));

-- Location: IOOBUF_X58_Y0_N59
\remainder[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(5));

-- Location: IOOBUF_X70_Y0_N53
\remainder[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(6));

-- Location: IOOBUF_X32_Y81_N53
\remainder[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(7));

-- Location: IOOBUF_X6_Y0_N53
\remainder[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(8));

-- Location: IOOBUF_X6_Y81_N2
\remainder[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(9));

-- Location: IOOBUF_X82_Y0_N76
\remainder[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(10));

-- Location: IOOBUF_X82_Y0_N59
\remainder[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(11));

-- Location: IOOBUF_X60_Y0_N19
\remainder[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(12));

-- Location: IOOBUF_X62_Y0_N53
\remainder[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(13));

-- Location: IOOBUF_X14_Y81_N53
\remainder[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(14));

-- Location: IOOBUF_X89_Y23_N22
\remainder[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(15));

-- Location: IOOBUF_X38_Y81_N19
\remainder[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(16));

-- Location: IOOBUF_X10_Y81_N42
\remainder[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(17));

-- Location: IOOBUF_X8_Y0_N19
\remainder[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(18));

-- Location: IOOBUF_X34_Y81_N93
\remainder[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(19));

-- Location: IOOBUF_X88_Y0_N3
\remainder[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(20));

-- Location: IOOBUF_X76_Y0_N19
\remainder[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(21));

-- Location: IOOBUF_X22_Y0_N36
\remainder[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(22));

-- Location: IOOBUF_X34_Y0_N59
\remainder[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(23));

-- Location: IOOBUF_X89_Y9_N22
\remainder[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(24));

-- Location: IOOBUF_X24_Y81_N19
\remainder[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(25));

-- Location: IOOBUF_X8_Y81_N53
\remainder[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(26));

-- Location: IOOBUF_X2_Y81_N42
\remainder[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(27));

-- Location: IOOBUF_X62_Y0_N19
\remainder[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(28));

-- Location: IOOBUF_X89_Y23_N5
\remainder[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(29));

-- Location: IOOBUF_X80_Y0_N36
\remainder[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(30));

-- Location: IOOBUF_X8_Y81_N2
\remainder[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_remainder(31));

-- Location: IOIBUF_X32_Y0_N1
\PIN_AF14~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PIN_AF14,
	o => \PIN_AF14~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "none",
	nreset_invert => "true",
	output_clock_frequency => "400.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "m_cnt",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "0 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 8,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 8,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \pll_1|pll_0|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => GND,
	refclkin => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \pll_1|pll_0|altera_pll_i|fboutclk_wire\(0),
	tclk => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
  fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 1,
	dprio0_cnt_lo_div => 1,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "200.0 mhz",
	phase_shift => "0 ps",
  fractional_pll_index => 0,
  output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \pll_1|pll_0|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \pll_1|pll_0|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \pll_1|pll_0|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \pll_1|pll_0|altera_pll_i|outclk_wire\(0),
	outclk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: IOIBUF_X56_Y0_N52
\ena~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ena,
	o => \ena~input_o\);

-- Location: LABCELL_X56_Y1_N39
\div|busy~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|busy~0_combout\ = (!\div|busy~q\ & (\ena~input_o\)) # (\div|busy~q\ & ((!\div|count\(31))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111110000010101011111000001010101111100000101010111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datac => \div|ALT_INV_count\(31),
	datad => \div|ALT_INV_busy~q\,
	combout => \div|busy~0_combout\);

-- Location: IOIBUF_X56_Y0_N18
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X56_Y1_N41
\div|busy\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|busy~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|busy~q\);

-- Location: LABCELL_X56_Y1_N48
\div|toggle~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|toggle~0_combout\ = ( !\div|toggle~q\ & ( \div|busy~q\ & ( !\div|count\(31) ) ) ) # ( \div|toggle~q\ & ( !\div|busy~q\ ) ) # ( !\div|toggle~q\ & ( !\div|busy~q\ & ( \ena~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111111111111000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ena~input_o\,
	datad => \div|ALT_INV_count\(31),
	datae => \div|ALT_INV_toggle~q\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|toggle~0_combout\);

-- Location: FF_X56_Y1_N50
\div|toggle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|toggle~0_combout\,
	ena => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|toggle~q\);

-- Location: LABCELL_X56_Y2_N0
\div|Add1~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~125_sumout\ = SUM(( \div|count\(0) ) + ( VCC ) + ( !VCC ))
-- \div|Add1~126\ = CARRY(( \div|count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(0),
	cin => GND,
	sumout => \div|Add1~125_sumout\,
	cout => \div|Add1~126\);

-- Location: LABCELL_X57_Y2_N42
\div|count~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~6_combout\ = ( \div|Add1~125_sumout\ ) # ( !\div|Add1~125_sumout\ & ( (\ena~input_o\ & !\div|busy~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100000000001100110000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_ena~input_o\,
	datad => \div|ALT_INV_busy~q\,
	dataf => \div|ALT_INV_Add1~125_sumout\,
	combout => \div|count~6_combout\);

-- Location: LABCELL_X56_Y1_N45
\div|count[4]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count[4]~1_combout\ = ( \div|toggle~q\ & ( (\ena~input_o\ & !\div|busy~q\) ) ) # ( !\div|toggle~q\ & ( (!\div|busy~q\ & (\ena~input_o\)) # (\div|busy~q\ & ((!\div|count\(31)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010001110100011101000111010001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datab => \div|ALT_INV_busy~q\,
	datac => \div|ALT_INV_count\(31),
	dataf => \div|ALT_INV_toggle~q\,
	combout => \div|count[4]~1_combout\);

-- Location: FF_X56_Y2_N2
\div|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \div|count~6_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(0));

-- Location: LABCELL_X56_Y2_N3
\div|Add1~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~121_sumout\ = SUM(( \div|count\(1) ) + ( VCC ) + ( \div|Add1~126\ ))
-- \div|Add1~122\ = CARRY(( \div|count\(1) ) + ( VCC ) + ( \div|Add1~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(1),
	cin => \div|Add1~126\,
	sumout => \div|Add1~121_sumout\,
	cout => \div|Add1~122\);

-- Location: LABCELL_X55_Y2_N15
\div|count~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~5_combout\ = ( \div|Add1~121_sumout\ & ( \div|busy~q\ ) ) # ( \div|Add1~121_sumout\ & ( !\div|busy~q\ ) ) # ( !\div|Add1~121_sumout\ & ( !\div|busy~q\ & ( \ena~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datae => \div|ALT_INV_Add1~121_sumout\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|count~5_combout\);

-- Location: FF_X56_Y2_N5
\div|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \div|count~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(1));

-- Location: LABCELL_X56_Y2_N6
\div|Add1~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~117_sumout\ = SUM(( \div|count\(2) ) + ( VCC ) + ( \div|Add1~122\ ))
-- \div|Add1~118\ = CARRY(( \div|count\(2) ) + ( VCC ) + ( \div|Add1~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(2),
	cin => \div|Add1~122\,
	sumout => \div|Add1~117_sumout\,
	cout => \div|Add1~118\);

-- Location: LABCELL_X55_Y2_N9
\div|count~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~4_combout\ = ( \div|Add1~117_sumout\ & ( \div|busy~q\ ) ) # ( \div|Add1~117_sumout\ & ( !\div|busy~q\ ) ) # ( !\div|Add1~117_sumout\ & ( !\div|busy~q\ & ( \ena~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datae => \div|ALT_INV_Add1~117_sumout\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|count~4_combout\);

-- Location: FF_X56_Y2_N10
\div|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \div|count~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(2));

-- Location: LABCELL_X56_Y2_N9
\div|Add1~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~113_sumout\ = SUM(( \div|count\(3) ) + ( VCC ) + ( \div|Add1~118\ ))
-- \div|Add1~114\ = CARRY(( \div|count\(3) ) + ( VCC ) + ( \div|Add1~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(3),
	cin => \div|Add1~118\,
	sumout => \div|Add1~113_sumout\,
	cout => \div|Add1~114\);

-- Location: LABCELL_X55_Y2_N0
\div|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~3_combout\ = ( \div|Add1~113_sumout\ & ( \div|busy~q\ ) ) # ( \div|Add1~113_sumout\ & ( !\div|busy~q\ ) ) # ( !\div|Add1~113_sumout\ & ( !\div|busy~q\ & ( \ena~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ena~input_o\,
	datae => \div|ALT_INV_Add1~113_sumout\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|count~3_combout\);

-- Location: FF_X56_Y2_N14
\div|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	asdata => \div|count~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(3));

-- Location: LABCELL_X56_Y2_N12
\div|Add1~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~109_sumout\ = SUM(( \div|count\(4) ) + ( VCC ) + ( \div|Add1~114\ ))
-- \div|Add1~110\ = CARRY(( \div|count\(4) ) + ( VCC ) + ( \div|Add1~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(4),
	cin => \div|Add1~114\,
	sumout => \div|Add1~109_sumout\,
	cout => \div|Add1~110\);

-- Location: LABCELL_X57_Y2_N9
\div|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~2_combout\ = ( \div|Add1~109_sumout\ & ( \div|busy~q\ ) ) # ( \div|Add1~109_sumout\ & ( !\div|busy~q\ ) ) # ( !\div|Add1~109_sumout\ & ( !\div|busy~q\ & ( \ena~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ena~input_o\,
	datae => \div|ALT_INV_Add1~109_sumout\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|count~2_combout\);

-- Location: FF_X57_Y2_N11
\div|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|count~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(4));

-- Location: LABCELL_X56_Y2_N15
\div|Add1~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~105_sumout\ = SUM(( \div|count\(5) ) + ( VCC ) + ( \div|Add1~110\ ))
-- \div|Add1~106\ = CARRY(( \div|count\(5) ) + ( VCC ) + ( \div|Add1~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(5),
	cin => \div|Add1~110\,
	sumout => \div|Add1~105_sumout\,
	cout => \div|Add1~106\);

-- Location: LABCELL_X57_Y2_N3
\div|process_0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|process_0~0_combout\ = ( !\div|busy~q\ & ( \ena~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_ena~input_o\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|process_0~0_combout\);

-- Location: FF_X56_Y2_N17
\div|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~105_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(5));

-- Location: LABCELL_X56_Y2_N18
\div|Add1~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~101_sumout\ = SUM(( \div|count\(6) ) + ( VCC ) + ( \div|Add1~106\ ))
-- \div|Add1~102\ = CARRY(( \div|count\(6) ) + ( VCC ) + ( \div|Add1~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(6),
	cin => \div|Add1~106\,
	sumout => \div|Add1~101_sumout\,
	cout => \div|Add1~102\);

-- Location: FF_X56_Y2_N20
\div|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~101_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(6));

-- Location: LABCELL_X56_Y2_N21
\div|Add1~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~97_sumout\ = SUM(( \div|count\(7) ) + ( VCC ) + ( \div|Add1~102\ ))
-- \div|Add1~98\ = CARRY(( \div|count\(7) ) + ( VCC ) + ( \div|Add1~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(7),
	cin => \div|Add1~102\,
	sumout => \div|Add1~97_sumout\,
	cout => \div|Add1~98\);

-- Location: FF_X56_Y2_N23
\div|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~97_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(7));

-- Location: LABCELL_X56_Y2_N24
\div|Add1~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~93_sumout\ = SUM(( \div|count\(8) ) + ( VCC ) + ( \div|Add1~98\ ))
-- \div|Add1~94\ = CARRY(( \div|count\(8) ) + ( VCC ) + ( \div|Add1~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(8),
	cin => \div|Add1~98\,
	sumout => \div|Add1~93_sumout\,
	cout => \div|Add1~94\);

-- Location: FF_X56_Y2_N26
\div|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~93_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(8));

-- Location: LABCELL_X56_Y2_N27
\div|Add1~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~89_sumout\ = SUM(( \div|count\(9) ) + ( VCC ) + ( \div|Add1~94\ ))
-- \div|Add1~90\ = CARRY(( \div|count\(9) ) + ( VCC ) + ( \div|Add1~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(9),
	cin => \div|Add1~94\,
	sumout => \div|Add1~89_sumout\,
	cout => \div|Add1~90\);

-- Location: FF_X56_Y2_N29
\div|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~89_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(9));

-- Location: LABCELL_X56_Y2_N30
\div|Add1~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~85_sumout\ = SUM(( \div|count\(10) ) + ( VCC ) + ( \div|Add1~90\ ))
-- \div|Add1~86\ = CARRY(( \div|count\(10) ) + ( VCC ) + ( \div|Add1~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(10),
	cin => \div|Add1~90\,
	sumout => \div|Add1~85_sumout\,
	cout => \div|Add1~86\);

-- Location: FF_X56_Y2_N31
\div|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~85_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(10));

-- Location: LABCELL_X56_Y2_N33
\div|Add1~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~81_sumout\ = SUM(( \div|count\(11) ) + ( VCC ) + ( \div|Add1~86\ ))
-- \div|Add1~82\ = CARRY(( \div|count\(11) ) + ( VCC ) + ( \div|Add1~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \div|ALT_INV_count\(11),
	cin => \div|Add1~86\,
	sumout => \div|Add1~81_sumout\,
	cout => \div|Add1~82\);

-- Location: FF_X56_Y2_N35
\div|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~81_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(11));

-- Location: LABCELL_X56_Y2_N36
\div|Add1~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~77_sumout\ = SUM(( \div|count\(12) ) + ( VCC ) + ( \div|Add1~82\ ))
-- \div|Add1~78\ = CARRY(( \div|count\(12) ) + ( VCC ) + ( \div|Add1~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(12),
	cin => \div|Add1~82\,
	sumout => \div|Add1~77_sumout\,
	cout => \div|Add1~78\);

-- Location: FF_X56_Y2_N38
\div|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~77_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(12));

-- Location: LABCELL_X56_Y2_N39
\div|Add1~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~73_sumout\ = SUM(( \div|count\(13) ) + ( VCC ) + ( \div|Add1~78\ ))
-- \div|Add1~74\ = CARRY(( \div|count\(13) ) + ( VCC ) + ( \div|Add1~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(13),
	cin => \div|Add1~78\,
	sumout => \div|Add1~73_sumout\,
	cout => \div|Add1~74\);

-- Location: FF_X56_Y2_N41
\div|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~73_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(13));

-- Location: LABCELL_X56_Y2_N42
\div|Add1~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~69_sumout\ = SUM(( \div|count\(14) ) + ( VCC ) + ( \div|Add1~74\ ))
-- \div|Add1~70\ = CARRY(( \div|count\(14) ) + ( VCC ) + ( \div|Add1~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \div|ALT_INV_count\(14),
	cin => \div|Add1~74\,
	sumout => \div|Add1~69_sumout\,
	cout => \div|Add1~70\);

-- Location: FF_X56_Y2_N44
\div|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~69_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(14));

-- Location: LABCELL_X56_Y2_N45
\div|Add1~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~65_sumout\ = SUM(( \div|count\(15) ) + ( VCC ) + ( \div|Add1~70\ ))
-- \div|Add1~66\ = CARRY(( \div|count\(15) ) + ( VCC ) + ( \div|Add1~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(15),
	cin => \div|Add1~70\,
	sumout => \div|Add1~65_sumout\,
	cout => \div|Add1~66\);

-- Location: FF_X56_Y2_N47
\div|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~65_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(15));

-- Location: LABCELL_X56_Y2_N48
\div|Add1~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~61_sumout\ = SUM(( \div|count\(16) ) + ( VCC ) + ( \div|Add1~66\ ))
-- \div|Add1~62\ = CARRY(( \div|count\(16) ) + ( VCC ) + ( \div|Add1~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(16),
	cin => \div|Add1~66\,
	sumout => \div|Add1~61_sumout\,
	cout => \div|Add1~62\);

-- Location: FF_X56_Y2_N50
\div|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~61_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(16));

-- Location: LABCELL_X56_Y2_N51
\div|Add1~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~57_sumout\ = SUM(( \div|count\(17) ) + ( VCC ) + ( \div|Add1~62\ ))
-- \div|Add1~58\ = CARRY(( \div|count\(17) ) + ( VCC ) + ( \div|Add1~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(17),
	cin => \div|Add1~62\,
	sumout => \div|Add1~57_sumout\,
	cout => \div|Add1~58\);

-- Location: FF_X56_Y2_N52
\div|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~57_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(17));

-- Location: LABCELL_X56_Y2_N54
\div|Add1~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~53_sumout\ = SUM(( \div|count\(18) ) + ( VCC ) + ( \div|Add1~58\ ))
-- \div|Add1~54\ = CARRY(( \div|count\(18) ) + ( VCC ) + ( \div|Add1~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(18),
	cin => \div|Add1~58\,
	sumout => \div|Add1~53_sumout\,
	cout => \div|Add1~54\);

-- Location: FF_X56_Y2_N56
\div|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~53_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(18));

-- Location: LABCELL_X56_Y2_N57
\div|Add1~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~49_sumout\ = SUM(( \div|count\(19) ) + ( VCC ) + ( \div|Add1~54\ ))
-- \div|Add1~50\ = CARRY(( \div|count\(19) ) + ( VCC ) + ( \div|Add1~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(19),
	cin => \div|Add1~54\,
	sumout => \div|Add1~49_sumout\,
	cout => \div|Add1~50\);

-- Location: FF_X56_Y2_N59
\div|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~49_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(19));

-- Location: LABCELL_X56_Y1_N0
\div|Add1~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~45_sumout\ = SUM(( \div|count\(20) ) + ( VCC ) + ( \div|Add1~50\ ))
-- \div|Add1~46\ = CARRY(( \div|count\(20) ) + ( VCC ) + ( \div|Add1~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(20),
	cin => \div|Add1~50\,
	sumout => \div|Add1~45_sumout\,
	cout => \div|Add1~46\);

-- Location: FF_X56_Y1_N2
\div|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~45_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(20));

-- Location: LABCELL_X56_Y1_N3
\div|Add1~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~41_sumout\ = SUM(( \div|count\(21) ) + ( VCC ) + ( \div|Add1~46\ ))
-- \div|Add1~42\ = CARRY(( \div|count\(21) ) + ( VCC ) + ( \div|Add1~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(21),
	cin => \div|Add1~46\,
	sumout => \div|Add1~41_sumout\,
	cout => \div|Add1~42\);

-- Location: FF_X56_Y1_N5
\div|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~41_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(21));

-- Location: LABCELL_X56_Y1_N6
\div|Add1~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~37_sumout\ = SUM(( \div|count\(22) ) + ( VCC ) + ( \div|Add1~42\ ))
-- \div|Add1~38\ = CARRY(( \div|count\(22) ) + ( VCC ) + ( \div|Add1~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \div|ALT_INV_count\(22),
	cin => \div|Add1~42\,
	sumout => \div|Add1~37_sumout\,
	cout => \div|Add1~38\);

-- Location: FF_X56_Y1_N8
\div|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~37_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(22));

-- Location: LABCELL_X56_Y1_N9
\div|Add1~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~33_sumout\ = SUM(( \div|count\(23) ) + ( VCC ) + ( \div|Add1~38\ ))
-- \div|Add1~34\ = CARRY(( \div|count\(23) ) + ( VCC ) + ( \div|Add1~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(23),
	cin => \div|Add1~38\,
	sumout => \div|Add1~33_sumout\,
	cout => \div|Add1~34\);

-- Location: FF_X56_Y1_N10
\div|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~33_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(23));

-- Location: LABCELL_X56_Y1_N12
\div|Add1~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~29_sumout\ = SUM(( \div|count\(24) ) + ( VCC ) + ( \div|Add1~34\ ))
-- \div|Add1~30\ = CARRY(( \div|count\(24) ) + ( VCC ) + ( \div|Add1~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \div|ALT_INV_count\(24),
	cin => \div|Add1~34\,
	sumout => \div|Add1~29_sumout\,
	cout => \div|Add1~30\);

-- Location: FF_X56_Y1_N14
\div|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~29_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(24));

-- Location: LABCELL_X56_Y1_N15
\div|Add1~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~25_sumout\ = SUM(( \div|count\(25) ) + ( VCC ) + ( \div|Add1~30\ ))
-- \div|Add1~26\ = CARRY(( \div|count\(25) ) + ( VCC ) + ( \div|Add1~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(25),
	cin => \div|Add1~30\,
	sumout => \div|Add1~25_sumout\,
	cout => \div|Add1~26\);

-- Location: FF_X56_Y1_N17
\div|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~25_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(25));

-- Location: LABCELL_X56_Y1_N18
\div|Add1~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~21_sumout\ = SUM(( \div|count\(26) ) + ( VCC ) + ( \div|Add1~26\ ))
-- \div|Add1~22\ = CARRY(( \div|count\(26) ) + ( VCC ) + ( \div|Add1~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(26),
	cin => \div|Add1~26\,
	sumout => \div|Add1~21_sumout\,
	cout => \div|Add1~22\);

-- Location: FF_X56_Y1_N20
\div|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~21_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(26));

-- Location: LABCELL_X56_Y1_N21
\div|Add1~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~17_sumout\ = SUM(( \div|count\(27) ) + ( VCC ) + ( \div|Add1~22\ ))
-- \div|Add1~18\ = CARRY(( \div|count\(27) ) + ( VCC ) + ( \div|Add1~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(27),
	cin => \div|Add1~22\,
	sumout => \div|Add1~17_sumout\,
	cout => \div|Add1~18\);

-- Location: FF_X56_Y1_N23
\div|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~17_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(27));

-- Location: LABCELL_X56_Y1_N24
\div|Add1~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~13_sumout\ = SUM(( \div|count\(28) ) + ( VCC ) + ( \div|Add1~18\ ))
-- \div|Add1~14\ = CARRY(( \div|count\(28) ) + ( VCC ) + ( \div|Add1~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(28),
	cin => \div|Add1~18\,
	sumout => \div|Add1~13_sumout\,
	cout => \div|Add1~14\);

-- Location: FF_X56_Y1_N26
\div|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~13_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(28));

-- Location: LABCELL_X56_Y1_N27
\div|Add1~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~9_sumout\ = SUM(( \div|count\(29) ) + ( VCC ) + ( \div|Add1~14\ ))
-- \div|Add1~10\ = CARRY(( \div|count\(29) ) + ( VCC ) + ( \div|Add1~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \div|ALT_INV_count\(29),
	cin => \div|Add1~14\,
	sumout => \div|Add1~9_sumout\,
	cout => \div|Add1~10\);

-- Location: FF_X56_Y1_N29
\div|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~9_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(29));

-- Location: LABCELL_X56_Y1_N30
\div|Add1~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~5_sumout\ = SUM(( \div|count\(30) ) + ( VCC ) + ( \div|Add1~10\ ))
-- \div|Add1~6\ = CARRY(( \div|count\(30) ) + ( VCC ) + ( \div|Add1~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(30),
	cin => \div|Add1~10\,
	sumout => \div|Add1~5_sumout\,
	cout => \div|Add1~6\);

-- Location: FF_X56_Y1_N31
\div|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|Add1~5_sumout\,
	clrn => \ALT_INV_rst~input_o\,
	sclr => \div|process_0~0_combout\,
	ena => \div|count[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(30));

-- Location: LABCELL_X56_Y1_N33
\div|Add1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|Add1~1_sumout\ = SUM(( \div|count\(31) ) + ( VCC ) + ( \div|Add1~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \div|ALT_INV_count\(31),
	cin => \div|Add1~6\,
	sumout => \div|Add1~1_sumout\);

-- Location: LABCELL_X56_Y1_N42
\div|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|count~0_combout\ = ( \div|Add1~1_sumout\ & ( (!\div|busy~q\ & (!\ena~input_o\ & ((\div|count\(31))))) # (\div|busy~q\ & (((!\div|toggle~q\) # (\div|count\(31))))) ) ) # ( !\div|Add1~1_sumout\ & ( (\div|count\(31) & ((!\ena~input_o\) # 
-- (\div|busy~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010111011000000001011101100110000101110110011000010111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datab => \div|ALT_INV_busy~q\,
	datac => \div|ALT_INV_toggle~q\,
	datad => \div|ALT_INV_count\(31),
	dataf => \div|ALT_INV_Add1~1_sumout\,
	combout => \div|count~0_combout\);

-- Location: FF_X56_Y1_N44
\div|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|count~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|count\(31));

-- Location: LABCELL_X56_Y1_N36
\div|div_ifg~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \div|div_ifg~0_combout\ = ( \div|busy~q\ & ( (\div|div_ifg~q\) # (\div|count\(31)) ) ) # ( !\div|busy~q\ & ( (!\ena~input_o\ & \div|div_ifg~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ena~input_o\,
	datab => \div|ALT_INV_count\(31),
	datad => \div|ALT_INV_div_ifg~q\,
	dataf => \div|ALT_INV_busy~q\,
	combout => \div|div_ifg~0_combout\);

-- Location: FF_X56_Y1_N38
\div|div_ifg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pll_1|pll_0|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \div|div_ifg~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \div|div_ifg~q\);

-- Location: IOIBUF_X78_Y0_N1
\dividend[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(0),
	o => \dividend[0]~input_o\);

-- Location: IOIBUF_X64_Y0_N1
\dividend[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(1),
	o => \dividend[1]~input_o\);

-- Location: IOIBUF_X28_Y81_N1
\dividend[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(2),
	o => \dividend[2]~input_o\);

-- Location: IOIBUF_X89_Y20_N78
\dividend[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(3),
	o => \dividend[3]~input_o\);

-- Location: IOIBUF_X40_Y81_N1
\dividend[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(4),
	o => \dividend[4]~input_o\);

-- Location: IOIBUF_X89_Y6_N4
\dividend[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(5),
	o => \dividend[5]~input_o\);

-- Location: IOIBUF_X26_Y81_N41
\dividend[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(6),
	o => \dividend[6]~input_o\);

-- Location: IOIBUF_X2_Y0_N92
\dividend[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(7),
	o => \dividend[7]~input_o\);

-- Location: IOIBUF_X26_Y0_N92
\dividend[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(8),
	o => \dividend[8]~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\dividend[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(9),
	o => \dividend[9]~input_o\);

-- Location: IOIBUF_X84_Y0_N18
\dividend[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(10),
	o => \dividend[10]~input_o\);

-- Location: IOIBUF_X18_Y81_N92
\dividend[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(11),
	o => \dividend[11]~input_o\);

-- Location: IOIBUF_X64_Y0_N35
\dividend[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(12),
	o => \dividend[12]~input_o\);

-- Location: IOIBUF_X89_Y15_N4
\dividend[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(13),
	o => \dividend[13]~input_o\);

-- Location: IOIBUF_X10_Y81_N58
\dividend[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(14),
	o => \dividend[14]~input_o\);

-- Location: IOIBUF_X89_Y8_N4
\dividend[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(15),
	o => \dividend[15]~input_o\);

-- Location: IOIBUF_X34_Y81_N75
\dividend[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(16),
	o => \dividend[16]~input_o\);

-- Location: IOIBUF_X89_Y20_N95
\dividend[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(17),
	o => \dividend[17]~input_o\);

-- Location: IOIBUF_X16_Y81_N35
\dividend[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(18),
	o => \dividend[18]~input_o\);

-- Location: IOIBUF_X62_Y0_N35
\dividend[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(19),
	o => \dividend[19]~input_o\);

-- Location: IOIBUF_X52_Y0_N52
\dividend[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(20),
	o => \dividend[20]~input_o\);

-- Location: IOIBUF_X30_Y81_N18
\dividend[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(21),
	o => \dividend[21]~input_o\);

-- Location: IOIBUF_X22_Y81_N1
\dividend[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(22),
	o => \dividend[22]~input_o\);

-- Location: IOIBUF_X89_Y4_N61
\dividend[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(23),
	o => \dividend[23]~input_o\);

-- Location: IOIBUF_X89_Y21_N21
\dividend[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(24),
	o => \dividend[24]~input_o\);

-- Location: IOIBUF_X34_Y0_N92
\dividend[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(25),
	o => \dividend[25]~input_o\);

-- Location: IOIBUF_X70_Y0_N18
\dividend[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(26),
	o => \dividend[26]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\dividend[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(27),
	o => \dividend[27]~input_o\);

-- Location: IOIBUF_X8_Y0_N1
\dividend[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(28),
	o => \dividend[28]~input_o\);

-- Location: IOIBUF_X86_Y0_N1
\dividend[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(29),
	o => \dividend[29]~input_o\);

-- Location: IOIBUF_X6_Y81_N52
\dividend[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(30),
	o => \dividend[30]~input_o\);

-- Location: IOIBUF_X89_Y9_N4
\dividend[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dividend(31),
	o => \dividend[31]~input_o\);

-- Location: IOIBUF_X70_Y0_N1
\divisor[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(0),
	o => \divisor[0]~input_o\);

-- Location: IOIBUF_X18_Y0_N92
\divisor[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(1),
	o => \divisor[1]~input_o\);

-- Location: IOIBUF_X84_Y0_N35
\divisor[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(2),
	o => \divisor[2]~input_o\);

-- Location: IOIBUF_X74_Y0_N41
\divisor[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(3),
	o => \divisor[3]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\divisor[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(4),
	o => \divisor[4]~input_o\);

-- Location: IOIBUF_X18_Y0_N75
\divisor[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(5),
	o => \divisor[5]~input_o\);

-- Location: IOIBUF_X10_Y81_N75
\divisor[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(6),
	o => \divisor[6]~input_o\);

-- Location: IOIBUF_X82_Y0_N92
\divisor[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(7),
	o => \divisor[7]~input_o\);

-- Location: IOIBUF_X72_Y0_N35
\divisor[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(8),
	o => \divisor[8]~input_o\);

-- Location: IOIBUF_X4_Y81_N1
\divisor[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(9),
	o => \divisor[9]~input_o\);

-- Location: IOIBUF_X4_Y0_N52
\divisor[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(10),
	o => \divisor[10]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\divisor[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(11),
	o => \divisor[11]~input_o\);

-- Location: IOIBUF_X89_Y16_N55
\divisor[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(12),
	o => \divisor[12]~input_o\);

-- Location: IOIBUF_X89_Y6_N55
\divisor[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(13),
	o => \divisor[13]~input_o\);

-- Location: IOIBUF_X89_Y11_N61
\divisor[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(14),
	o => \divisor[14]~input_o\);

-- Location: IOIBUF_X16_Y81_N1
\divisor[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(15),
	o => \divisor[15]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\divisor[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(16),
	o => \divisor[16]~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\divisor[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(17),
	o => \divisor[17]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\divisor[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(18),
	o => \divisor[18]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\divisor[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(19),
	o => \divisor[19]~input_o\);

-- Location: IOIBUF_X20_Y0_N18
\divisor[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(20),
	o => \divisor[20]~input_o\);

-- Location: IOIBUF_X54_Y0_N1
\divisor[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(21),
	o => \divisor[21]~input_o\);

-- Location: IOIBUF_X34_Y0_N75
\divisor[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(22),
	o => \divisor[22]~input_o\);

-- Location: IOIBUF_X89_Y25_N21
\divisor[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(23),
	o => \divisor[23]~input_o\);

-- Location: IOIBUF_X4_Y0_N18
\divisor[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(24),
	o => \divisor[24]~input_o\);

-- Location: IOIBUF_X26_Y0_N41
\divisor[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(25),
	o => \divisor[25]~input_o\);

-- Location: IOIBUF_X24_Y0_N35
\divisor[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(26),
	o => \divisor[26]~input_o\);

-- Location: IOIBUF_X28_Y0_N18
\divisor[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(27),
	o => \divisor[27]~input_o\);

-- Location: IOIBUF_X6_Y0_N18
\divisor[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(28),
	o => \divisor[28]~input_o\);

-- Location: IOIBUF_X30_Y0_N18
\divisor[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(29),
	o => \divisor[29]~input_o\);

-- Location: IOIBUF_X89_Y20_N61
\divisor[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(30),
	o => \divisor[30]~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\divisor[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_divisor(31),
	o => \divisor[31]~input_o\);

-- Location: MLABCELL_X84_Y1_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
      number_of_fplls => 1);
-- pragma translate_on
END structure;


