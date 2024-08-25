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

-- DATE "07/07/2024 12:30:05"

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

ENTITY 	ALU_wrap IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	ena : IN std_logic;
	Y : IN std_logic_vector(7 DOWNTO 0);
	X : IN std_logic_vector(7 DOWNTO 0);
	ALUFN : IN std_logic_vector(4 DOWNTO 0);
	ALUout : OUT std_logic_vector(7 DOWNTO 0);
	Nflag : OUT std_logic;
	Cflag : OUT std_logic;
	Zflag : OUT std_logic;
	Vflag : OUT std_logic
	);
END ALU_wrap;

-- Design Ports Information
-- ALUout[0]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[1]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[3]	=>  Location: PIN_AE28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[4]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[5]	=>  Location: PIN_AA28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[6]	=>  Location: PIN_AE27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUout[7]	=>  Location: PIN_AH30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Nflag	=>  Location: PIN_V25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cflag	=>  Location: PIN_AC29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zflag	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Vflag	=>  Location: PIN_Y23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AD30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ena	=>  Location: PIN_AC30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[3]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[4]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[0]	=>  Location: PIN_AF29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[2]	=>  Location: PIN_AF28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[0]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUFN[1]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[0]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[2]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[4]	=>  Location: PIN_AD29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[5]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[6]	=>  Location: PIN_AA30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[7]	=>  Location: PIN_AG30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[1]	=>  Location: PIN_AF30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[3]	=>  Location: PIN_AE29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[3]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[4]	=>  Location: PIN_AB30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[5]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[6]	=>  Location: PIN_W24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- X[7]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU_wrap IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_ena : std_logic;
SIGNAL ww_Y : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_X : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_ALUFN : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_ALUout : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Nflag : std_logic;
SIGNAL ww_Cflag : std_logic;
SIGNAL ww_Zflag : std_logic;
SIGNAL ww_Vflag : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \ALUFN[3]~input_o\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \ena~input_o\ : std_logic;
SIGNAL \ALUFN[2]~input_o\ : std_logic;
SIGNAL \ALUFN[0]~input_o\ : std_logic;
SIGNAL \ALUFN[1]~input_o\ : std_logic;
SIGNAL \ALUFN[4]~input_o\ : std_logic;
SIGNAL \ALUout_o_reg[0]~0_combout\ : std_logic;
SIGNAL \Y[0]~input_o\ : std_logic;
SIGNAL \X[0]~input_o\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[0]~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|first|s~0_combout\ : std_logic;
SIGNAL \Y[5]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[5]~1_combout\ : std_logic;
SIGNAL \Y[6]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[6]~2_combout\ : std_logic;
SIGNAL \Y[4]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[4]~0_combout\ : std_logic;
SIGNAL \Y[7]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[7]~3_combout\ : std_logic;
SIGNAL \ALU_inst|x_Shifter_in[0]~1_combout\ : std_logic;
SIGNAL \X[1]~input_o\ : std_logic;
SIGNAL \ALU_inst|x_Shifter_in[1]~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux7~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ : std_logic;
SIGNAL \X[2]~input_o\ : std_logic;
SIGNAL \ALU_inst|x_Shifter_in[2]~0_combout\ : std_logic;
SIGNAL \Y[2]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[2]~6_combout\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[0]~4_combout\ : std_logic;
SIGNAL \Y[1]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[1]~5_combout\ : std_logic;
SIGNAL \Y[3]~input_o\ : std_logic;
SIGNAL \ALU_inst|y_Shifter_in[3]~7_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux7~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|Equal13~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[0]~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[0]~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[1]~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[1]~21_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux2~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux2~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|first|cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|first|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[1]~8_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[2]~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux7~3_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux7~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[2]~1_combout\ : std_logic;
SIGNAL \X[3]~input_o\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[3]~3_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux10~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:3:chain|s~combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[3]~2_combout\ : std_logic;
SIGNAL \X[4]~input_o\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[4]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux7~4_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[4]~3_combout\ : std_logic;
SIGNAL \X[5]~input_o\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[5]~5_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux10~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[5]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ : std_logic;
SIGNAL \X[6]~input_o\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[6]~6_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux9~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[6]~5_combout\ : std_logic;
SIGNAL \X[7]~input_o\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[7]~6_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|Logic_out[7]~7_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Mux10~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[7]~19_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ : std_logic;
SIGNAL \ALU_inst|ALUout_o[7]~7_combout\ : std_logic;
SIGNAL \Nflag_o_reg~q\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_cout~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|Shifter_cout~3_combout\ : std_logic;
SIGNAL \ALU_inst|Cflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|Cflag_o~1_combout\ : std_logic;
SIGNAL \Cflag_o_reg~q\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~1_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~2_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~5_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~6_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~3_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~4_combout\ : std_logic;
SIGNAL \ALU_inst|Zflag_o~combout\ : std_logic;
SIGNAL \Zflag_o_reg~q\ : std_logic;
SIGNAL \ALU_inst|Vflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|Vflag_o~1_combout\ : std_logic;
SIGNAL \ALU_inst|Vflag_o~2_combout\ : std_logic;
SIGNAL \Vflag_o_reg~q\ : std_logic;
SIGNAL ALUout_o_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL ALUFN_i_reg : std_logic_vector(4 DOWNTO 0);
SIGNAL X_i_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL Y_i_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|first|ALT_INV_cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~21_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Vflag_o~1_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Vflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~6_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~5_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~4_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~3_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~2_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~1_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Zflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_Cflag_o~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~3_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[7]~6_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[7]~7_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~20_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~19_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux10~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~0_combout\ : std_logic;
SIGNAL ALT_INV_X_i_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~18_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~17_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux9~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~16_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[6]~6_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_s~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[6]~5_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[6]~5_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~15_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~14_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~13_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux10~1_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[5]~5_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_s~combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[5]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[5]~4_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~12_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~11_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux7~4_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~10_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[4]~4_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_s~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[4]~3_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~9_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~8_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux10~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[3]~3_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_s~combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[3]~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[3]~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~7_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~6_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux7~3_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~5_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[2]~2_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:2:chain|ALT_INV_s~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~4_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~3_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[1]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[1]~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[1]~0_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|first|ALT_INV_cout~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~2_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~1_combout\ : std_logic;
SIGNAL \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\ : std_logic;
SIGNAL ALT_INV_Y_i_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\ : std_logic;
SIGNAL \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\ : std_logic;
SIGNAL \ALU_inst|Logic_inst|ALT_INV_Logic_out[0]~0_combout\ : std_logic;
SIGNAL \ALT_INV_ALUout_o_reg[0]~0_combout\ : std_logic;
SIGNAL ALT_INV_ALUFN_i_reg : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALU_inst|AdderSub_inst|first|ALT_INV_s~0_combout\ : std_logic;
SIGNAL \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~22_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_ena <= ena;
ww_Y <= Y;
ww_X <= X;
ww_ALUFN <= ALUFN;
ALUout <= ww_ALUout;
Nflag <= ww_Nflag;
Cflag <= ww_Cflag;
Zflag <= ww_Zflag;
Vflag <= ww_Vflag;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~1_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\;
\ALU_inst|AdderSub_inst|first|ALT_INV_cout~1_combout\ <= NOT \ALU_inst|AdderSub_inst|first|cout~1_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~21_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[1]~21_combout\;
\ALU_inst|ALT_INV_Vflag_o~1_combout\ <= NOT \ALU_inst|Vflag_o~1_combout\;
\ALU_inst|ALT_INV_Vflag_o~0_combout\ <= NOT \ALU_inst|Vflag_o~0_combout\;
\ALU_inst|ALT_INV_Zflag_o~6_combout\ <= NOT \ALU_inst|Zflag_o~6_combout\;
\ALU_inst|ALT_INV_Zflag_o~5_combout\ <= NOT \ALU_inst|Zflag_o~5_combout\;
\ALU_inst|ALT_INV_Zflag_o~4_combout\ <= NOT \ALU_inst|Zflag_o~4_combout\;
\ALU_inst|ALT_INV_Zflag_o~3_combout\ <= NOT \ALU_inst|Zflag_o~3_combout\;
\ALU_inst|ALT_INV_Zflag_o~2_combout\ <= NOT \ALU_inst|Zflag_o~2_combout\;
\ALU_inst|ALT_INV_Zflag_o~1_combout\ <= NOT \ALU_inst|Zflag_o~1_combout\;
\ALU_inst|ALT_INV_Zflag_o~0_combout\ <= NOT \ALU_inst|Zflag_o~0_combout\;
\ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~combout\ <= NOT \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\;
\ALU_inst|ALT_INV_Cflag_o~0_combout\ <= NOT \ALU_inst|Cflag_o~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~3_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_cout~3_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~2_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_cout~2_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~1_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_cout~1_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~0_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_cout~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[7]~6_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[7]~7_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[7]~7_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~20_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~19_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[7]~19_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux10~2_combout\ <= NOT \ALU_inst|Shifter_inst|Mux10~2_combout\;
\ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\;
ALT_INV_X_i_reg(7) <= NOT X_i_reg(7);
\ALU_inst|ALT_INV_ALUout_o[7]~6_combout\ <= NOT \ALU_inst|ALUout_o[7]~6_combout\;
\ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~18_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~17_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux9~0_combout\ <= NOT \ALU_inst|Shifter_inst|Mux9~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~16_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[6]~6_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[6]~6_combout\;
\ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_s~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[6]~5_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[6]~5_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\;
ALT_INV_X_i_reg(6) <= NOT X_i_reg(6);
\ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~15_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~14_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~13_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux10~1_combout\ <= NOT \ALU_inst|Shifter_inst|Mux10~1_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[5]~5_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[5]~5_combout\;
\ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_s~combout\ <= NOT \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\;
\ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~2_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\;
\ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~1_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\;
\ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[5]~4_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[5]~4_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\;
ALT_INV_X_i_reg(5) <= NOT X_i_reg(5);
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~12_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~11_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux7~4_combout\ <= NOT \ALU_inst|Shifter_inst|Mux7~4_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~10_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[4]~4_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[4]~4_combout\;
\ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_s~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[4]~3_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\;
ALT_INV_X_i_reg(4) <= NOT X_i_reg(4);
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\;
\ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~9_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~8_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux10~0_combout\ <= NOT \ALU_inst|Shifter_inst|Mux10~0_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[3]~3_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[3]~3_combout\;
\ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_s~combout\ <= NOT \ALU_inst|AdderSub_inst|rest:3:chain|s~combout\;
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[3]~2_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[3]~2_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\;
ALT_INV_X_i_reg(3) <= NOT X_i_reg(3);
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~7_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~6_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux7~3_combout\ <= NOT \ALU_inst|Shifter_inst|Mux7~3_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~5_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux7~2_combout\ <= NOT \ALU_inst|Shifter_inst|Mux7~2_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[2]~2_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[2]~2_combout\;
\ALU_inst|AdderSub_inst|rest:2:chain|ALT_INV_s~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\;
\ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~4_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux2~1_combout\ <= NOT \ALU_inst|Shifter_inst|Mux2~1_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux2~0_combout\ <= NOT \ALU_inst|Shifter_inst|Mux2~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~3_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\;
\ALU_inst|Logic_inst|ALT_INV_Logic_out[1]~1_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[1]~1_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[1]~0_combout\ <= NOT \ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[1]~0_combout\ <= NOT \ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\;
\ALU_inst|AdderSub_inst|first|ALT_INV_cout~0_combout\ <= NOT \ALU_inst|AdderSub_inst|first|cout~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~2_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~1_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[0]~1_combout\;
\ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\ <= NOT \ALU_inst|AdderSub_inst|Equal13~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux7~1_combout\ <= NOT \ALU_inst|Shifter_inst|Mux7~1_combout\;
\ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\ <= NOT \ALU_inst|y_Shifter_in[3]~7_combout\;
ALT_INV_Y_i_reg(3) <= NOT Y_i_reg(3);
\ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\ <= NOT \ALU_inst|y_Shifter_in[2]~6_combout\;
ALT_INV_Y_i_reg(2) <= NOT Y_i_reg(2);
\ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\ <= NOT \ALU_inst|y_Shifter_in[1]~5_combout\;
ALT_INV_Y_i_reg(1) <= NOT Y_i_reg(1);
\ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\ <= NOT \ALU_inst|y_Shifter_in[0]~4_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Mux7~0_combout\ <= NOT \ALU_inst|Shifter_inst|Mux7~0_combout\;
\ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\ <= NOT \ALU_inst|x_Shifter_in[1]~2_combout\;
ALT_INV_X_i_reg(1) <= NOT X_i_reg(1);
\ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\ <= NOT \ALU_inst|x_Shifter_in[0]~1_combout\;
\ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\ <= NOT \ALU_inst|y_Shifter_in[7]~3_combout\;
ALT_INV_Y_i_reg(7) <= NOT Y_i_reg(7);
\ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\ <= NOT \ALU_inst|y_Shifter_in[6]~2_combout\;
ALT_INV_Y_i_reg(6) <= NOT Y_i_reg(6);
\ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\ <= NOT \ALU_inst|y_Shifter_in[5]~1_combout\;
ALT_INV_Y_i_reg(5) <= NOT Y_i_reg(5);
\ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\ <= NOT \ALU_inst|y_Shifter_in[4]~0_combout\;
ALT_INV_Y_i_reg(4) <= NOT Y_i_reg(4);
\ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\ <= NOT \ALU_inst|x_Shifter_in[2]~0_combout\;
ALT_INV_X_i_reg(2) <= NOT X_i_reg(2);
\ALU_inst|Logic_inst|ALT_INV_Logic_out[0]~0_combout\ <= NOT \ALU_inst|Logic_inst|Logic_out[0]~0_combout\;
\ALT_INV_ALUout_o_reg[0]~0_combout\ <= NOT \ALUout_o_reg[0]~0_combout\;
ALT_INV_Y_i_reg(0) <= NOT Y_i_reg(0);
ALT_INV_ALUFN_i_reg(1) <= NOT ALUFN_i_reg(1);
ALT_INV_ALUFN_i_reg(0) <= NOT ALUFN_i_reg(0);
ALT_INV_ALUFN_i_reg(2) <= NOT ALUFN_i_reg(2);
ALT_INV_X_i_reg(0) <= NOT X_i_reg(0);
ALT_INV_ALUFN_i_reg(4) <= NOT ALUFN_i_reg(4);
ALT_INV_ALUFN_i_reg(3) <= NOT ALUFN_i_reg(3);
\ALU_inst|AdderSub_inst|first|ALT_INV_s~0_combout\ <= NOT \ALU_inst|AdderSub_inst|first|s~0_combout\;
\ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~22_combout\ <= NOT \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\;

-- Location: IOOBUF_X89_Y15_N5
\ALUout[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(0),
	devoe => ww_devoe,
	o => ww_ALUout(0));

-- Location: IOOBUF_X40_Y81_N53
\ALUout[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(1),
	devoe => ww_devoe,
	o => ww_ALUout(1));

-- Location: IOOBUF_X38_Y81_N53
\ALUout[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(2),
	devoe => ww_devoe,
	o => ww_ALUout(2));

-- Location: IOOBUF_X89_Y11_N96
\ALUout[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(3),
	devoe => ww_devoe,
	o => ww_ALUout(3));

-- Location: IOOBUF_X89_Y8_N5
\ALUout[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(4),
	devoe => ww_devoe,
	o => ww_ALUout(4));

-- Location: IOOBUF_X89_Y21_N56
\ALUout[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(5),
	devoe => ww_devoe,
	o => ww_ALUout(5));

-- Location: IOOBUF_X89_Y11_N79
\ALUout[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(6),
	devoe => ww_devoe,
	o => ww_ALUout(6));

-- Location: IOOBUF_X89_Y16_N39
\ALUout[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALUout_o_reg(7),
	devoe => ww_devoe,
	o => ww_ALUout(7));

-- Location: IOOBUF_X89_Y20_N62
\Nflag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Nflag_o_reg~q\,
	devoe => ww_devoe,
	o => ww_Nflag);

-- Location: IOOBUF_X89_Y20_N96
\Cflag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Cflag_o_reg~q\,
	devoe => ww_devoe,
	o => ww_Cflag);

-- Location: IOOBUF_X89_Y16_N22
\Zflag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Zflag_o_reg~q\,
	devoe => ww_devoe,
	o => ww_Zflag);

-- Location: IOOBUF_X89_Y13_N5
\Vflag~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Vflag_o_reg~q\,
	devoe => ww_devoe,
	o => ww_Vflag);

-- Location: IOIBUF_X89_Y25_N21
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X36_Y81_N35
\ALUFN[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(3),
	o => \ALUFN[3]~input_o\);

-- Location: IOIBUF_X89_Y25_N38
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: IOIBUF_X89_Y25_N55
\ena~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ena,
	o => \ena~input_o\);

-- Location: FF_X83_Y30_N29
\ALUFN_i_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALUFN[3]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUFN_i_reg(3));

-- Location: IOIBUF_X89_Y13_N55
\ALUFN[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(2),
	o => \ALUFN[2]~input_o\);

-- Location: FF_X81_Y30_N20
\ALUFN_i_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALUFN[2]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUFN_i_reg(2));

-- Location: IOIBUF_X40_Y81_N1
\ALUFN[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(0),
	o => \ALUFN[0]~input_o\);

-- Location: FF_X82_Y30_N32
\ALUFN_i_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALUFN[0]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUFN_i_reg(0));

-- Location: IOIBUF_X89_Y20_N44
\ALUFN[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(1),
	o => \ALUFN[1]~input_o\);

-- Location: FF_X82_Y30_N56
\ALUFN_i_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALUFN[1]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUFN_i_reg(1));

-- Location: IOIBUF_X89_Y20_N78
\ALUFN[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ALUFN(4),
	o => \ALUFN[4]~input_o\);

-- Location: FF_X81_Y30_N59
\ALUFN_i_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALUFN[4]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUFN_i_reg(4));

-- Location: LABCELL_X80_Y30_N18
\ALUout_o_reg[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALUout_o_reg[0]~0_combout\ = ( ALUFN_i_reg(3) & ( ALUFN_i_reg(4) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALUout_o_reg[0]~0_combout\);

-- Location: IOIBUF_X89_Y11_N61
\Y[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(0),
	o => \Y[0]~input_o\);

-- Location: FF_X81_Y30_N14
\Y_i_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[0]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(0));

-- Location: IOIBUF_X89_Y15_N38
\X[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(0),
	o => \X[0]~input_o\);

-- Location: FF_X81_Y30_N26
\X_i_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[0]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(0));

-- Location: LABCELL_X80_Y30_N51
\ALU_inst|Logic_inst|Logic_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[0]~0_combout\ = ( Y_i_reg(0) & ( X_i_reg(0) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1) & ((!\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(2) & \ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(0) & ( X_i_reg(0) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( Y_i_reg(0) & ( !X_i_reg(0) & ( (!ALUFN_i_reg(0) & (((!ALUFN_i_reg(1) & !\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( !Y_i_reg(0) & ( !X_i_reg(0) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000111010001110100010011001011010001101100101101000100101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datae => ALT_INV_Y_i_reg(0),
	dataf => ALT_INV_X_i_reg(0),
	combout => \ALU_inst|Logic_inst|Logic_out[0]~0_combout\);

-- Location: LABCELL_X80_Y30_N12
\ALU_inst|AdderSub_inst|first|s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|first|s~0_combout\ = ( !ALUFN_i_reg(1) & ( (ALUFN_i_reg(3) & (!ALUFN_i_reg(2) & (!ALUFN_i_reg(4) & (!X_i_reg(0) $ (!Y_i_reg(0)))))) ) ) # ( ALUFN_i_reg(1) & ( (ALUFN_i_reg(3) & (X_i_reg(0) & (!ALUFN_i_reg(0) & (!ALUFN_i_reg(2) & 
-- !ALUFN_i_reg(4))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0001010000000000000100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => ALT_INV_X_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(0),
	datad => ALT_INV_ALUFN_i_reg(2),
	datae => ALT_INV_ALUFN_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(4),
	datag => ALT_INV_Y_i_reg(0),
	combout => \ALU_inst|AdderSub_inst|first|s~0_combout\);

-- Location: IOIBUF_X89_Y23_N4
\Y[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(5),
	o => \Y[5]~input_o\);

-- Location: FF_X83_Y30_N59
\Y_i_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[5]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(5));

-- Location: LABCELL_X83_Y30_N45
\ALU_inst|y_Shifter_in[5]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[5]~1_combout\ = ( ALUFN_i_reg(4) & ( (Y_i_reg(5) & !ALUFN_i_reg(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_Y_i_reg(5),
	datad => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|y_Shifter_in[5]~1_combout\);

-- Location: IOIBUF_X89_Y21_N21
\Y[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(6),
	o => \Y[6]~input_o\);

-- Location: FF_X83_Y30_N17
\Y_i_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[6]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(6));

-- Location: LABCELL_X83_Y30_N39
\ALU_inst|y_Shifter_in[6]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[6]~2_combout\ = ( ALUFN_i_reg(4) & ( (Y_i_reg(6) & !ALUFN_i_reg(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_Y_i_reg(6),
	datad => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|y_Shifter_in[6]~2_combout\);

-- Location: IOIBUF_X89_Y23_N55
\Y[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(4),
	o => \Y[4]~input_o\);

-- Location: FF_X84_Y30_N50
\Y_i_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[4]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(4));

-- Location: MLABCELL_X84_Y30_N39
\ALU_inst|y_Shifter_in[4]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[4]~0_combout\ = ( !ALUFN_i_reg(3) & ( (Y_i_reg(4) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Y_i_reg(4),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|y_Shifter_in[4]~0_combout\);

-- Location: IOIBUF_X89_Y16_N55
\Y[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(7),
	o => \Y[7]~input_o\);

-- Location: FF_X82_Y30_N47
\Y_i_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[7]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(7));

-- Location: MLABCELL_X82_Y30_N39
\ALU_inst|y_Shifter_in[7]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[7]~3_combout\ = ( !ALUFN_i_reg(3) & ( (Y_i_reg(7) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_Y_i_reg(7),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|y_Shifter_in[7]~3_combout\);

-- Location: LABCELL_X83_Y30_N30
\ALU_inst|x_Shifter_in[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|x_Shifter_in[0]~1_combout\ = ( ALUFN_i_reg(4) & ( (X_i_reg(0) & !ALUFN_i_reg(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000000000000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_X_i_reg(0),
	datad => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|x_Shifter_in[0]~1_combout\);

-- Location: IOIBUF_X89_Y15_N55
\X[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(1),
	o => \X[1]~input_o\);

-- Location: FF_X81_Y30_N2
\X_i_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[1]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(1));

-- Location: LABCELL_X81_Y30_N36
\ALU_inst|x_Shifter_in[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|x_Shifter_in[1]~2_combout\ = ( !ALUFN_i_reg(3) & ( (X_i_reg(1) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_X_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|x_Shifter_in[1]~2_combout\);

-- Location: LABCELL_X85_Y30_N54
\ALU_inst|Shifter_inst|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux7~0_combout\ = ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( \ALU_inst|y_Shifter_in[7]~3_combout\ ) ) ) # ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( 
-- \ALU_inst|y_Shifter_in[6]~2_combout\ ) ) ) # ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( \ALU_inst|y_Shifter_in[5]~1_combout\ ) ) ) # ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( 
-- !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( \ALU_inst|y_Shifter_in[4]~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111010101010101010100110011001100110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	datae => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	combout => \ALU_inst|Shifter_inst|Mux7~0_combout\);

-- Location: LABCELL_X85_Y30_N12
\ALU_inst|Shifter_inst|Shifter_out[7]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ = ( ALUFN_i_reg(0) & ( (!ALUFN_i_reg(2) & !ALUFN_i_reg(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ALUFN_i_reg(2),
	datad => ALT_INV_ALUFN_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(0),
	combout => \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\);

-- Location: IOIBUF_X89_Y16_N4
\X[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(2),
	o => \X[2]~input_o\);

-- Location: FF_X81_Y30_N5
\X_i_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[2]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(2));

-- Location: LABCELL_X81_Y30_N9
\ALU_inst|x_Shifter_in[2]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|x_Shifter_in[2]~0_combout\ = ( !ALUFN_i_reg(3) & ( (ALUFN_i_reg(4) & X_i_reg(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => ALT_INV_X_i_reg(2),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|x_Shifter_in[2]~0_combout\);

-- Location: IOIBUF_X89_Y23_N21
\Y[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(2),
	o => \Y[2]~input_o\);

-- Location: FF_X84_Y30_N35
\Y_i_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[2]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(2));

-- Location: MLABCELL_X84_Y30_N21
\ALU_inst|y_Shifter_in[2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[2]~6_combout\ = ( Y_i_reg(2) & ( (!ALUFN_i_reg(3) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_Y_i_reg(2),
	combout => \ALU_inst|y_Shifter_in[2]~6_combout\);

-- Location: MLABCELL_X84_Y30_N6
\ALU_inst|y_Shifter_in[0]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[0]~4_combout\ = ( Y_i_reg(0) & ( (!ALUFN_i_reg(3) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_Y_i_reg(0),
	combout => \ALU_inst|y_Shifter_in[0]~4_combout\);

-- Location: IOIBUF_X89_Y25_N4
\Y[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(1),
	o => \Y[1]~input_o\);

-- Location: FF_X84_Y30_N47
\Y_i_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[1]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(1));

-- Location: MLABCELL_X84_Y30_N0
\ALU_inst|y_Shifter_in[1]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[1]~5_combout\ = ( ALUFN_i_reg(4) & ( (!ALUFN_i_reg(3) & Y_i_reg(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_Y_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|y_Shifter_in[1]~5_combout\);

-- Location: IOIBUF_X89_Y23_N38
\Y[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Y(3),
	o => \Y[3]~input_o\);

-- Location: FF_X84_Y30_N17
\Y_i_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \Y[3]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Y_i_reg(3));

-- Location: MLABCELL_X84_Y30_N27
\ALU_inst|y_Shifter_in[3]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|y_Shifter_in[3]~7_combout\ = ( !ALUFN_i_reg(3) & ( (Y_i_reg(3) & ALUFN_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_Y_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|y_Shifter_in[3]~7_combout\);

-- Location: LABCELL_X85_Y30_N0
\ALU_inst|Shifter_inst|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux7~1_combout\ = ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (\ALU_inst|y_Shifter_in[1]~5_combout\) # (\ALU_inst|x_Shifter_in[1]~2_combout\) ) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & 
-- ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & \ALU_inst|y_Shifter_in[1]~5_combout\) ) ) ) # ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- ((\ALU_inst|y_Shifter_in[0]~4_combout\))) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( 
-- (!\ALU_inst|x_Shifter_in[1]~2_combout\ & ((\ALU_inst|y_Shifter_in[0]~4_combout\))) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100000000110011000011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	combout => \ALU_inst|Shifter_inst|Mux7~1_combout\);

-- Location: MLABCELL_X82_Y31_N39
\ALU_inst|AdderSub_inst|Equal13~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|Equal13~0_combout\ = ( !ALUFN_i_reg(0) & ( !ALUFN_i_reg(2) & ( !ALUFN_i_reg(1) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_ALUFN_i_reg(1),
	datae => ALT_INV_ALUFN_i_reg(0),
	dataf => ALT_INV_ALUFN_i_reg(2),
	combout => \ALU_inst|AdderSub_inst|Equal13~0_combout\);

-- Location: LABCELL_X85_Y30_N9
\ALU_inst|Shifter_inst|Shifter_out[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[0]~1_combout\ = ( \ALU_inst|AdderSub_inst|Equal13~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (!\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- \ALU_inst|y_Shifter_in[0]~4_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[0]~1_combout\);

-- Location: LABCELL_X85_Y30_N39
\ALU_inst|Shifter_inst|Shifter_out[0]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\ = ( !\ALU_inst|Shifter_inst|Shifter_out[0]~1_combout\ & ( (!\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) # ((!\ALU_inst|x_Shifter_in[2]~0_combout\ & ((!\ALU_inst|Shifter_inst|Mux7~1_combout\))) # 
-- (\ALU_inst|x_Shifter_in[2]~0_combout\ & (!\ALU_inst|Shifter_inst|Mux7~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111011001110111111101100111000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Shifter_inst|ALT_INV_Mux7~0_combout\,
	datab => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Mux7~1_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~1_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\);

-- Location: LABCELL_X80_Y30_N21
\ALU_inst|ALUout_o[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[0]~0_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\ & ( (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & ((\ALU_inst|AdderSub_inst|first|s~0_combout\))) # (ALUFN_i_reg(4) & (\ALU_inst|Logic_inst|Logic_out[0]~0_combout\)))) ) ) # ( 
-- !\ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\ & ( (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & ((\ALU_inst|AdderSub_inst|first|s~0_combout\))) # (ALUFN_i_reg(4) & (\ALU_inst|Logic_inst|Logic_out[0]~0_combout\)))) ) 
-- )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010110111011000001011011101100000101000100010000010100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => \ALU_inst|Logic_inst|ALT_INV_Logic_out[0]~0_combout\,
	datac => \ALU_inst|AdderSub_inst|first|ALT_INV_s~0_combout\,
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~2_combout\,
	combout => \ALU_inst|ALUout_o[0]~0_combout\);

-- Location: FF_X80_Y30_N22
\ALUout_o_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[0]~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(0));

-- Location: LABCELL_X81_Y30_N21
\ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ = ( !ALUFN_i_reg(2) & ( X_i_reg(1) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) $ (((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4)))))) # (ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) 
-- ) ) # ( !ALUFN_i_reg(2) & ( !X_i_reg(1) & ( !ALUFN_i_reg(0) $ (!ALUFN_i_reg(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110000000000000000001100110100001100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => ALT_INV_ALUFN_i_reg(3),
	datae => ALT_INV_ALUFN_i_reg(2),
	dataf => ALT_INV_X_i_reg(1),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\);

-- Location: LABCELL_X80_Y30_N36
\ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ = ( !ALUFN_i_reg(1) & ( (ALUFN_i_reg(3) & (!ALUFN_i_reg(4) & (!ALUFN_i_reg(2) & Y_i_reg(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(2),
	datad => ALT_INV_Y_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(1),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\);

-- Location: LABCELL_X80_Y30_N9
\ALU_inst|Logic_inst|Logic_out[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[1]~1_combout\ = ( Y_i_reg(1) & ( X_i_reg(1) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1) & ((!\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(2) & \ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(1) & ( X_i_reg(1) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( Y_i_reg(1) & ( !X_i_reg(1) & ( (!ALUFN_i_reg(0) & (((!ALUFN_i_reg(1) & !\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( !Y_i_reg(1) & ( !X_i_reg(1) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000111010001110100010011001011010001101100101101000100101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datae => ALT_INV_Y_i_reg(1),
	dataf => ALT_INV_X_i_reg(1),
	combout => \ALU_inst|Logic_inst|Logic_out[1]~1_combout\);

-- Location: LABCELL_X83_Y30_N33
\ALU_inst|Shifter_inst|Shifter_out[1]~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[1]~21_combout\ = ( Y_i_reg(0) & ( (!X_i_reg(1) & ((X_i_reg(0)) # (Y_i_reg(1)))) ) ) # ( !Y_i_reg(0) & ( (Y_i_reg(1) & (!X_i_reg(0) & !X_i_reg(1))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000001011111000000000101111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Y_i_reg(1),
	datac => ALT_INV_X_i_reg(0),
	datad => ALT_INV_X_i_reg(1),
	dataf => ALT_INV_Y_i_reg(0),
	combout => \ALU_inst|Shifter_inst|Shifter_out[1]~21_combout\);

-- Location: MLABCELL_X82_Y30_N33
\ALU_inst|Shifter_inst|Shifter_out[1]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\ = ( !ALUFN_i_reg(2) & ( \ALU_inst|Shifter_inst|Shifter_out[1]~21_combout\ & ( (!ALUFN_i_reg(1) & (!ALUFN_i_reg(0) & (ALUFN_i_reg(4) & !ALUFN_i_reg(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(1),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => ALT_INV_ALUFN_i_reg(3),
	datae => ALT_INV_ALUFN_i_reg(2),
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~21_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\);

-- Location: LABCELL_X83_Y30_N36
\ALU_inst|Shifter_inst|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux2~0_combout\ = ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (((!\ALU_inst|x_Shifter_in[2]~0_combout\)) # (\ALU_inst|y_Shifter_in[7]~3_combout\))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- (((\ALU_inst|y_Shifter_in[4]~0_combout\ & !\ALU_inst|x_Shifter_in[2]~0_combout\)))) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[7]~3_combout\ & 
-- ((\ALU_inst|x_Shifter_in[2]~0_combout\)))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (((\ALU_inst|y_Shifter_in[4]~0_combout\ & !\ALU_inst|x_Shifter_in[2]~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001101000100000000110100010011001111010001001100111101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	dataf => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	combout => \ALU_inst|Shifter_inst|Mux2~0_combout\);

-- Location: MLABCELL_X84_Y30_N12
\ALU_inst|Shifter_inst|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux2~1_combout\ = ( \ALU_inst|y_Shifter_in[2]~6_combout\ & ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[5]~1_combout\)) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- ((\ALU_inst|y_Shifter_in[6]~2_combout\))) ) ) ) # ( !\ALU_inst|y_Shifter_in[2]~6_combout\ & ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[5]~1_combout\)) # (\ALU_inst|x_Shifter_in[0]~1_combout\ 
-- & ((\ALU_inst|y_Shifter_in[6]~2_combout\))) ) ) ) # ( \ALU_inst|y_Shifter_in[2]~6_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (\ALU_inst|y_Shifter_in[1]~5_combout\) # (\ALU_inst|x_Shifter_in[0]~1_combout\) ) ) ) # ( 
-- !\ALU_inst|y_Shifter_in[2]~6_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & \ALU_inst|y_Shifter_in[1]~5_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010010111110101111100100010011101110010001001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Mux2~1_combout\);

-- Location: LABCELL_X83_Y30_N18
\ALU_inst|Shifter_inst|Shifter_out[1]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\ = ( \ALU_inst|Shifter_inst|Mux2~0_combout\ & ( \ALU_inst|Shifter_inst|Mux2~1_combout\ & ( ((!\ALU_inst|x_Shifter_in[2]~0_combout\ & \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\)) # 
-- (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) ) ) ) # ( !\ALU_inst|Shifter_inst|Mux2~0_combout\ & ( \ALU_inst|Shifter_inst|Mux2~1_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (((!\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\)) # (\ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (!\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\))) ) ) ) # ( 
-- \ALU_inst|Shifter_inst|Mux2~0_combout\ & ( !\ALU_inst|Shifter_inst|Mux2~1_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (((\ALU_inst|x_Shifter_in[1]~2_combout\ & \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\)) # 
-- (\ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\))) ) ) ) # ( !\ALU_inst|Shifter_inst|Mux2~0_combout\ & ( 
-- !\ALU_inst|Shifter_inst|Mux2~1_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000111010101100001100101011100000111110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~3_combout\,
	datae => \ALU_inst|Shifter_inst|ALT_INV_Mux2~0_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Mux2~1_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\);

-- Location: MLABCELL_X82_Y30_N12
\ALU_inst|AdderSub_inst|first|cout~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|first|cout~1_combout\ = ( Y_i_reg(0) & ( !ALUFN_i_reg(1) $ (((!ALUFN_i_reg(0) & ALUFN_i_reg(4)))) ) ) # ( !Y_i_reg(0) & ( (ALUFN_i_reg(4) & (!ALUFN_i_reg(0) $ (!ALUFN_i_reg(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000111100000000000011110011110000001111001111000000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_Y_i_reg(0),
	combout => \ALU_inst|AdderSub_inst|first|cout~1_combout\);

-- Location: LABCELL_X81_Y30_N3
\ALU_inst|AdderSub_inst|first|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|first|cout~0_combout\ = ( ALUFN_i_reg(0) & ( \ALU_inst|AdderSub_inst|first|cout~1_combout\ & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # ((X_i_reg(0) & ALUFN_i_reg(3))))) ) ) ) # ( !ALUFN_i_reg(0) & ( 
-- \ALU_inst|AdderSub_inst|first|cout~1_combout\ & ( (!ALUFN_i_reg(2) & (((X_i_reg(0) & ALUFN_i_reg(3))) # (ALUFN_i_reg(1)))) ) ) ) # ( ALUFN_i_reg(0) & ( !\ALU_inst|AdderSub_inst|first|cout~1_combout\ & ( (!ALUFN_i_reg(1) & (!ALUFN_i_reg(2) & ((!X_i_reg(0)) 
-- # (!ALUFN_i_reg(3))))) ) ) ) # ( !ALUFN_i_reg(0) & ( !\ALU_inst|AdderSub_inst|first|cout~1_combout\ & ( (ALUFN_i_reg(1) & (!ALUFN_i_reg(2) & ((!X_i_reg(0)) # (!ALUFN_i_reg(3))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001000000000110010000000000000110111000000001100110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(2),
	datae => ALT_INV_ALUFN_i_reg(0),
	dataf => \ALU_inst|AdderSub_inst|first|ALT_INV_cout~1_combout\,
	combout => \ALU_inst|AdderSub_inst|first|cout~0_combout\);

-- Location: LABCELL_X79_Y30_N18
\ALU_inst|ALUout_o[1]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[1]~8_combout\ = ( !ALUFN_i_reg(4) & ( (ALUFN_i_reg(3) & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ $ (!\ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ $ ((\ALU_inst|AdderSub_inst|first|cout~0_combout\))))) ) ) # ( 
-- ALUFN_i_reg(4) & ( (((!ALUFN_i_reg(3) & ((\ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\))) # (ALUFN_i_reg(3) & (\ALU_inst|Logic_inst|Logic_out[1]~1_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000001101001000000000000111100000000011010011111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[1]~0_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[1]~0_combout\,
	datac => \ALU_inst|Logic_inst|ALT_INV_Logic_out[1]~1_combout\,
	datad => ALT_INV_ALUFN_i_reg(3),
	datae => ALT_INV_ALUFN_i_reg(4),
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~4_combout\,
	datag => \ALU_inst|AdderSub_inst|first|ALT_INV_cout~0_combout\,
	combout => \ALU_inst|ALUout_o[1]~8_combout\);

-- Location: FF_X79_Y30_N19
\ALUout_o_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[1]~8_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(1));

-- Location: LABCELL_X81_Y30_N15
\ALU_inst|AdderSub_inst|rest:1:chain|cout~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ = ( Y_i_reg(1) & ( ALUFN_i_reg(0) & ( (!ALUFN_i_reg(1) & ((!X_i_reg(0)) # ((!X_i_reg(1)) # (Y_i_reg(0))))) ) ) ) # ( !Y_i_reg(1) & ( ALUFN_i_reg(0) & ( (!ALUFN_i_reg(1) & (!X_i_reg(1) & ((!X_i_reg(0)) # 
-- (Y_i_reg(0))))) ) ) ) # ( Y_i_reg(1) & ( !ALUFN_i_reg(0) & ( (!X_i_reg(0) & ((!ALUFN_i_reg(1) $ (!X_i_reg(1))))) # (X_i_reg(0) & (!ALUFN_i_reg(1) & ((X_i_reg(1)) # (Y_i_reg(0))))) ) ) ) # ( !Y_i_reg(1) & ( !ALUFN_i_reg(0) & ( (!X_i_reg(0) & 
-- (((ALUFN_i_reg(1) & !X_i_reg(1))))) # (X_i_reg(0) & (Y_i_reg(0) & (!ALUFN_i_reg(1) & X_i_reg(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000010000000110101111000010110000000000001111000010110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(0),
	datab => ALT_INV_Y_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_X_i_reg(1),
	datae => ALT_INV_Y_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(0),
	combout => \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\);

-- Location: LABCELL_X81_Y30_N54
\ALU_inst|AdderSub_inst|rest:1:chain|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ = ( ALUFN_i_reg(1) & ( \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(0)) # ((!ALUFN_i_reg(4) & ALUFN_i_reg(3))))) ) ) ) # ( !ALUFN_i_reg(1) & ( 
-- \ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ & ( (!ALUFN_i_reg(2) & (((!ALUFN_i_reg(4) & ALUFN_i_reg(3))) # (ALUFN_i_reg(0)))) ) ) ) # ( ALUFN_i_reg(1) & ( !\ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ & ( (!ALUFN_i_reg(2) & 
-- (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) ) ) # ( !ALUFN_i_reg(1) & ( !\ALU_inst|AdderSub_inst|rest:1:chain|cout~1_combout\ & ( (!ALUFN_i_reg(2) & (ALUFN_i_reg(0) & ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000010101000000010000000001010100010101010000010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(0),
	datad => ALT_INV_ALUFN_i_reg(3),
	datae => ALT_INV_ALUFN_i_reg(1),
	dataf => \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~1_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\);

-- Location: LABCELL_X81_Y30_N45
\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ = ( Y_i_reg(2) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(4) & (!ALUFN_i_reg(1) & ALUFN_i_reg(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000100000000000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_Y_i_reg(2),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\);

-- Location: LABCELL_X81_Y30_N27
\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ = ( X_i_reg(2) & ( ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(1) & (!ALUFN_i_reg(4) $ (ALUFN_i_reg(0)))) # (ALUFN_i_reg(1) & (ALUFN_i_reg(4) & !ALUFN_i_reg(0))))) ) ) ) # ( !X_i_reg(2) & ( 
-- ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( X_i_reg(2) & ( !ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( !X_i_reg(2) & ( !ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & 
-- (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001010001000001000101000100000100010100010001000001000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => ALT_INV_ALUFN_i_reg(0),
	datae => ALT_INV_X_i_reg(2),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\);

-- Location: LABCELL_X81_Y30_N51
\ALU_inst|AdderSub_inst|rest:2:chain|s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\ = ( \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ ) ) # ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ( 
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\);

-- Location: LABCELL_X80_Y30_N3
\ALU_inst|Logic_inst|Logic_out[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[2]~2_combout\ = ( Y_i_reg(2) & ( X_i_reg(2) & ( (!ALUFN_i_reg(1) & (!\ALUout_o_reg[0]~0_combout\ $ (((!ALUFN_i_reg(2) & ALUFN_i_reg(0)))))) # (ALUFN_i_reg(1) & ((!ALUFN_i_reg(2) & (!ALUFN_i_reg(0) & 
-- \ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & (ALUFN_i_reg(0))))) ) ) ) # ( !Y_i_reg(2) & ( X_i_reg(2) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( Y_i_reg(2) & ( !X_i_reg(2) & ( (!ALUFN_i_reg(0) & (((!ALUFN_i_reg(1) & !\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( !Y_i_reg(2) & ( !X_i_reg(2) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010111000101110001010000111011000101100011101100010100101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_ALUFN_i_reg(0),
	datad => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datae => ALT_INV_Y_i_reg(2),
	dataf => ALT_INV_X_i_reg(2),
	combout => \ALU_inst|Logic_inst|Logic_out[2]~2_combout\);

-- Location: LABCELL_X81_Y30_N30
\ALU_inst|Shifter_inst|Shifter_out[2]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\ = ( !ALUFN_i_reg(3) & ( (ALUFN_i_reg(4) & ((!X_i_reg(0) & ((Y_i_reg(6)))) # (X_i_reg(0) & (Y_i_reg(7))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100100011000000010010001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_Y_i_reg(7),
	datad => ALT_INV_Y_i_reg(6),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\);

-- Location: LABCELL_X83_Y31_N54
\ALU_inst|Shifter_inst|Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux7~3_combout\ = ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( \ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (((\ALU_inst|y_Shifter_in[2]~6_combout\) # (\ALU_inst|x_Shifter_in[1]~2_combout\)))) # 
-- (\ALU_inst|x_Shifter_in[0]~1_combout\ & (((!\ALU_inst|x_Shifter_in[1]~2_combout\)) # (\ALU_inst|y_Shifter_in[5]~1_combout\))) ) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( \ALU_inst|y_Shifter_in[4]~0_combout\ & ( 
-- (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (((\ALU_inst|y_Shifter_in[2]~6_combout\) # (\ALU_inst|x_Shifter_in[1]~2_combout\)))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[5]~1_combout\ & (\ALU_inst|x_Shifter_in[1]~2_combout\))) ) ) ) 
-- # ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (((!\ALU_inst|x_Shifter_in[1]~2_combout\ & \ALU_inst|y_Shifter_in[2]~6_combout\)))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- (((!\ALU_inst|x_Shifter_in[1]~2_combout\)) # (\ALU_inst|y_Shifter_in[5]~1_combout\))) ) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- (((!\ALU_inst|x_Shifter_in[1]~2_combout\ & \ALU_inst|y_Shifter_in[2]~6_combout\)))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[5]~1_combout\ & (\ALU_inst|x_Shifter_in[1]~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111000001001100011111000100001101110011010011110111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	dataf => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Mux7~3_combout\);

-- Location: LABCELL_X81_Y30_N33
\ALU_inst|Shifter_inst|Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux7~2_combout\ = ( Y_i_reg(2) & ( (ALUFN_i_reg(4) & (!ALUFN_i_reg(3) & ((!X_i_reg(0)) # (Y_i_reg(1))))) ) ) # ( !Y_i_reg(2) & ( (X_i_reg(0) & (ALUFN_i_reg(4) & (Y_i_reg(1) & !ALUFN_i_reg(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000000000010000000000100011000000000010001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_Y_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_Y_i_reg(2),
	combout => \ALU_inst|Shifter_inst|Mux7~2_combout\);

-- Location: LABCELL_X83_Y31_N39
\ALU_inst|Shifter_inst|Shifter_out[2]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\ = ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (\ALU_inst|AdderSub_inst|Equal13~0_combout\ & (\ALU_inst|y_Shifter_in[0]~4_combout\ & 
-- !\ALU_inst|x_Shifter_in[0]~1_combout\)) ) ) ) # ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (\ALU_inst|AdderSub_inst|Equal13~0_combout\ & \ALU_inst|Shifter_inst|Mux7~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101000100010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux7~2_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datae => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\);

-- Location: LABCELL_X83_Y31_N9
\ALU_inst|Shifter_inst|Shifter_out[2]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ = ( \ALU_inst|Shifter_inst|Mux7~3_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\ & ( (!\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) # ((\ALU_inst|x_Shifter_in[2]~0_combout\ & 
-- ((!\ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\) # (\ALU_inst|x_Shifter_in[1]~2_combout\)))) ) ) ) # ( !\ALU_inst|Shifter_inst|Mux7~3_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[2]~5_combout\ & ( 
-- (!\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) # (((!\ALU_inst|x_Shifter_in[2]~0_combout\) # (!\ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\)) # (\ALU_inst|x_Shifter_in[1]~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111011101011111010101100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~6_combout\,
	datae => \ALU_inst|Shifter_inst|ALT_INV_Mux7~3_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~5_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\);

-- Location: LABCELL_X83_Y31_N33
\ALU_inst|ALUout_o[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[2]~1_combout\ = ( \ALU_inst|Logic_inst|Logic_out[2]~2_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ & ( (ALUFN_i_reg(3) & ((!\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ $ 
-- (!\ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\)) # (ALUFN_i_reg(4)))) ) ) ) # ( !\ALU_inst|Logic_inst|Logic_out[2]~2_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ & ( (ALUFN_i_reg(3) & (!ALUFN_i_reg(4) & 
-- (!\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ $ (!\ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\)))) ) ) ) # ( \ALU_inst|Logic_inst|Logic_out[2]~2_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ & ( ((ALUFN_i_reg(3) & 
-- (!\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ $ (!\ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\)))) # (ALUFN_i_reg(4)) ) ) ) # ( !\ALU_inst|Logic_inst|Logic_out[2]~2_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ & ( 
-- (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & (!ALUFN_i_reg(4) & (!\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ $ (!\ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101001001010000111110100111100010000010000000001010101000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\,
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => \ALU_inst|AdderSub_inst|rest:2:chain|ALT_INV_s~0_combout\,
	datae => \ALU_inst|Logic_inst|ALT_INV_Logic_out[2]~2_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~7_combout\,
	combout => \ALU_inst|ALUout_o[2]~1_combout\);

-- Location: FF_X83_Y31_N34
\ALUout_o_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[2]~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(2));

-- Location: IOIBUF_X89_Y21_N38
\X[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(3),
	o => \X[3]~input_o\);

-- Location: FF_X82_Y30_N35
\X_i_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[3]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(3));

-- Location: LABCELL_X80_Y30_N57
\ALU_inst|Logic_inst|Logic_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[3]~3_combout\ = ( Y_i_reg(3) & ( X_i_reg(3) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1) & ((!\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(2) & \ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(3) & ( X_i_reg(3) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( Y_i_reg(3) & ( !X_i_reg(3) & ( (!ALUFN_i_reg(0) & (((!ALUFN_i_reg(1) & !\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( !Y_i_reg(3) & ( !X_i_reg(3) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000111010001110100010011001011010001101100101101000100101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datae => ALT_INV_Y_i_reg(3),
	dataf => ALT_INV_X_i_reg(3),
	combout => \ALU_inst|Logic_inst|Logic_out[3]~3_combout\);

-- Location: LABCELL_X79_Y30_N0
\ALU_inst|Shifter_inst|Shifter_out[3]~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\ = ( !X_i_reg(0) & ( (X_i_reg(1) & (ALUFN_i_reg(4) & (Y_i_reg(5) & (!X_i_reg(2) & !ALUFN_i_reg(3))))) ) ) # ( X_i_reg(0) & ( (X_i_reg(1) & (ALUFN_i_reg(4) & (Y_i_reg(6) & (!X_i_reg(2) & !ALUFN_i_reg(3))))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000100000000000000010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(1),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_Y_i_reg(6),
	datad => ALT_INV_X_i_reg(2),
	datae => ALT_INV_X_i_reg(0),
	dataf => ALT_INV_ALUFN_i_reg(3),
	datag => ALT_INV_Y_i_reg(5),
	combout => \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\);

-- Location: LABCELL_X83_Y30_N54
\ALU_inst|Shifter_inst|Shifter_out[3]~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ = ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( (\ALU_inst|y_Shifter_in[7]~3_combout\ & !\ALU_inst|x_Shifter_in[0]~1_combout\) ) ) ) # ( 
-- !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & ((\ALU_inst|y_Shifter_in[3]~7_combout\))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[4]~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111001111000000000000000001000100010001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	datae => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\);

-- Location: MLABCELL_X84_Y30_N51
\ALU_inst|Shifter_inst|Mux10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux10~0_combout\ = ( \ALU_inst|y_Shifter_in[1]~5_combout\ & ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\) # (\ALU_inst|y_Shifter_in[0]~4_combout\) ) ) ) # ( !\ALU_inst|y_Shifter_in[1]~5_combout\ 
-- & ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( (\ALU_inst|y_Shifter_in[0]~4_combout\ & \ALU_inst|x_Shifter_in[0]~1_combout\) ) ) ) # ( \ALU_inst|y_Shifter_in[1]~5_combout\ & ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ 
-- & ((\ALU_inst|y_Shifter_in[3]~7_combout\))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) ) # ( !\ALU_inst|y_Shifter_in[1]~5_combout\ & ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( 
-- (!\ALU_inst|x_Shifter_in[0]~1_combout\ & ((\ALU_inst|y_Shifter_in[3]~7_combout\))) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101010101001100110101010100000000000011111111111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	combout => \ALU_inst|Shifter_inst|Mux10~0_combout\);

-- Location: LABCELL_X83_Y30_N0
\ALU_inst|Shifter_inst|Shifter_out[3]~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ & ( \ALU_inst|Shifter_inst|Mux10~0_combout\ & ( ((!\ALU_inst|x_Shifter_in[2]~0_combout\ & \ALU_inst|AdderSub_inst|Equal13~0_combout\)) # 
-- (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) ) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ & ( \ALU_inst|Shifter_inst|Mux10~0_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (((\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & 
-- \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\)) # (\ALU_inst|AdderSub_inst|Equal13~0_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\))) ) ) ) 
-- # ( \ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ & ( !\ALU_inst|Shifter_inst|Mux10~0_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ ) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_out[3]~8_combout\ & ( !\ALU_inst|Shifter_inst|Mux10~0_combout\ 
-- & ( (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & \ALU_inst|Shifter_inst|Shifter_out[3]~22_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011001100110011001100000011101010110011001110111011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datab => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~22_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	datae => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~8_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Mux10~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\);

-- Location: LABCELL_X81_Y30_N42
\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ = ( Y_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(4) & (ALUFN_i_reg(3) & !ALUFN_i_reg(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(1),
	dataf => ALT_INV_Y_i_reg(3),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\);

-- Location: MLABCELL_X82_Y30_N9
\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ = ( ALUFN_i_reg(3) & ( X_i_reg(3) & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(1) & (!ALUFN_i_reg(0) $ (ALUFN_i_reg(4)))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(0) & ALUFN_i_reg(4))))) ) ) ) # ( !ALUFN_i_reg(3) & ( 
-- X_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( ALUFN_i_reg(3) & ( !X_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( !ALUFN_i_reg(3) & ( !X_i_reg(3) & ( (!ALUFN_i_reg(2) & 
-- (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011000000000011001100000000001100110000000001000011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(1),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(4),
	datad => ALT_INV_ALUFN_i_reg(2),
	datae => ALT_INV_ALUFN_i_reg(3),
	dataf => ALT_INV_X_i_reg(3),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\);

-- Location: LABCELL_X81_Y30_N39
\ALU_inst|AdderSub_inst|rest:3:chain|s\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:3:chain|s~combout\ = ( \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ & ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ $ (((!\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)) # (\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ((\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\) # 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\))))) ) ) # ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ & ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ $ (((!\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & 
-- ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\) # (!\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\))) # (\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & (!\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & 
-- !\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011001101100001101100110110011001001100100111100100110010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[3]~2_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[3]~2_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:3:chain|s~combout\);

-- Location: LABCELL_X80_Y30_N39
\ALU_inst|ALUout_o[3]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[3]~2_combout\ = ( \ALU_inst|AdderSub_inst|rest:3:chain|s~combout\ & ( (!ALUFN_i_reg(3) & (ALUFN_i_reg(4) & ((\ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\)))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4)) # 
-- ((\ALU_inst|Logic_inst|Logic_out[3]~3_combout\)))) ) ) # ( !\ALU_inst|AdderSub_inst|rest:3:chain|s~combout\ & ( (ALUFN_i_reg(4) & ((!ALUFN_i_reg(3) & ((\ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\))) # (ALUFN_i_reg(3) & 
-- (\ALU_inst|Logic_inst|Logic_out[3]~3_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100100011000000010010001101000101011001110100010101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => \ALU_inst|Logic_inst|ALT_INV_Logic_out[3]~3_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~9_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_s~combout\,
	combout => \ALU_inst|ALUout_o[3]~2_combout\);

-- Location: FF_X80_Y30_N40
\ALUout_o_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[3]~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(3));

-- Location: IOIBUF_X89_Y21_N4
\X[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(4),
	o => \X[4]~input_o\);

-- Location: FF_X82_Y30_N29
\X_i_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[4]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(4));

-- Location: LABCELL_X80_Y30_N54
\ALU_inst|Logic_inst|Logic_out[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[4]~4_combout\ = ( Y_i_reg(4) & ( X_i_reg(4) & ( (!ALUFN_i_reg(0) & ((!\ALUout_o_reg[0]~0_combout\ & ((!ALUFN_i_reg(1)))) # (\ALUout_o_reg[0]~0_combout\ & (!ALUFN_i_reg(2) & ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(4) & ( X_i_reg(4) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( Y_i_reg(4) & ( !X_i_reg(4) & ( (!ALUFN_i_reg(0) & (((!\ALUout_o_reg[0]~0_combout\ & !ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(4) & ( !X_i_reg(4) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110100010001110100110001001011011011000100101101001000011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datad => ALT_INV_ALUFN_i_reg(1),
	datae => ALT_INV_Y_i_reg(4),
	dataf => ALT_INV_X_i_reg(4),
	combout => \ALU_inst|Logic_inst|Logic_out[4]~4_combout\);

-- Location: MLABCELL_X82_Y30_N6
\ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\ = ( X_i_reg(4) & ( ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(1) & (!ALUFN_i_reg(0) $ (ALUFN_i_reg(4)))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(0) & ALUFN_i_reg(4))))) ) ) ) # ( !X_i_reg(4) & ( 
-- ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( X_i_reg(4) & ( !ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) ) # ( !X_i_reg(4) & ( !ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & 
-- (!ALUFN_i_reg(1) $ (!ALUFN_i_reg(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000001100000011000001000000001100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(1),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => ALT_INV_ALUFN_i_reg(2),
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => ALT_INV_X_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\);

-- Location: MLABCELL_X82_Y30_N18
\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ = ( !ALUFN_i_reg(4) & ( (ALUFN_i_reg(3) & (!ALUFN_i_reg(1) & !ALUFN_i_reg(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000010100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(2),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\);

-- Location: MLABCELL_X82_Y30_N3
\ALU_inst|AdderSub_inst|rest:4:chain|s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\ = ( \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & ( !Y_i_reg(4) $ (!\ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\) ) ) # ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & ( 
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111100001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_Y_i_reg(4),
	datad => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[4]~3_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\);

-- Location: LABCELL_X81_Y30_N48
\ALU_inst|AdderSub_inst|rest:3:chain|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\ = ( \ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & ( ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & 
-- \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)) # (\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ((\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\)))) # 
-- (\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\) ) ) # ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & ( (\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ & ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)) # (\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ((\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\) # 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000111000000010000011100011111011111110001111101111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[3]~2_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[3]~2_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\);

-- Location: MLABCELL_X84_Y30_N3
\ALU_inst|Shifter_inst|Shifter_out[4]~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\ = ( \ALU_inst|AdderSub_inst|Equal13~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[0]~4_combout\ & (\ALU_inst|x_Shifter_in[2]~0_combout\ & 
-- !\ALU_inst|x_Shifter_in[1]~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000000000001000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\);

-- Location: MLABCELL_X84_Y30_N9
\ALU_inst|Shifter_inst|Mux7~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux7~4_combout\ = ( X_i_reg(0) & ( (!ALUFN_i_reg(3) & (Y_i_reg(3) & ALUFN_i_reg(4))) ) ) # ( !X_i_reg(0) & ( (Y_i_reg(4) & (!ALUFN_i_reg(3) & ALUFN_i_reg(4))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001000100000000000100010000000000000011000000000000001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Y_i_reg(4),
	datab => ALT_INV_ALUFN_i_reg(3),
	datac => ALT_INV_Y_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_X_i_reg(0),
	combout => \ALU_inst|Shifter_inst|Mux7~4_combout\);

-- Location: MLABCELL_X84_Y30_N36
\ALU_inst|Shifter_inst|Shifter_out[4]~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\ = ( \ALU_inst|AdderSub_inst|Equal13~0_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|Shifter_inst|Mux7~4_combout\)) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- ((\ALU_inst|Shifter_inst|Mux7~2_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000110011000011110011001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|Shifter_inst|ALT_INV_Mux7~4_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux7~2_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\);

-- Location: MLABCELL_X84_Y30_N18
\ALU_inst|Shifter_inst|Shifter_out[4]~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\ & ( (\ALU_inst|x_Shifter_in[2]~0_combout\ & !\ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\) ) ) # ( 
-- !\ALU_inst|Shifter_inst|Shifter_out[4]~11_combout\ & ( (!\ALU_inst|Shifter_inst|Shifter_out[4]~10_combout\ & ((!\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\) # ((!\ALU_inst|Shifter_inst|Mux7~0_combout\) # (\ALU_inst|x_Shifter_in[2]~0_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101100000000111110110000000000110011000000000011001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux7~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~10_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~11_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\);

-- Location: LABCELL_X80_Y30_N42
\ALU_inst|ALUout_o[4]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[4]~3_combout\ = ( ALUFN_i_reg(4) & ( \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ & ( (ALUFN_i_reg(3) & \ALU_inst|Logic_inst|Logic_out[4]~4_combout\) ) ) ) # ( !ALUFN_i_reg(4) & ( \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ & 
-- ( (ALUFN_i_reg(3) & (!\ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\ $ (!\ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\))) ) ) ) # ( ALUFN_i_reg(4) & ( !\ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ & ( (!ALUFN_i_reg(3)) # 
-- (\ALU_inst|Logic_inst|Logic_out[4]~4_combout\) ) ) ) # ( !ALUFN_i_reg(4) & ( !\ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ & ( (ALUFN_i_reg(3) & (!\ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\ $ 
-- (!\ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010000101110111011101100000101010100000001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => \ALU_inst|Logic_inst|ALT_INV_Logic_out[4]~4_combout\,
	datac => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_s~0_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_cout~0_combout\,
	datae => ALT_INV_ALUFN_i_reg(4),
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~12_combout\,
	combout => \ALU_inst|ALUout_o[4]~3_combout\);

-- Location: FF_X80_Y30_N43
\ALUout_o_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[4]~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(4));

-- Location: IOIBUF_X40_Y81_N18
\X[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(5),
	o => \X[5]~input_o\);

-- Location: FF_X80_Y30_N26
\X_i_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[5]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(5));

-- Location: LABCELL_X80_Y30_N6
\ALU_inst|Logic_inst|Logic_out[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[5]~5_combout\ = ( Y_i_reg(5) & ( X_i_reg(5) & ( (!ALUFN_i_reg(0) & ((!\ALUout_o_reg[0]~0_combout\ & ((!ALUFN_i_reg(1)))) # (\ALUout_o_reg[0]~0_combout\ & (!ALUFN_i_reg(2) & ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(5) & ( X_i_reg(5) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( Y_i_reg(5) & ( !X_i_reg(5) & ( (!ALUFN_i_reg(0) & (((!\ALUout_o_reg[0]~0_combout\ & !ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(5) & ( !X_i_reg(5) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110100010001110100110001001011011011000100101101001000011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datad => ALT_INV_ALUFN_i_reg(1),
	datae => ALT_INV_Y_i_reg(5),
	dataf => ALT_INV_X_i_reg(5),
	combout => \ALU_inst|Logic_inst|Logic_out[5]~5_combout\);

-- Location: LABCELL_X81_Y30_N18
\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ = ( !ALUFN_i_reg(2) & ( X_i_reg(5) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) $ (((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4)))))) # (ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) 
-- ) ) # ( !ALUFN_i_reg(2) & ( !X_i_reg(5) & ( !ALUFN_i_reg(0) $ (!ALUFN_i_reg(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110000000000000000001101000011001100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => ALT_INV_ALUFN_i_reg(2),
	dataf => ALT_INV_X_i_reg(5),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\);

-- Location: MLABCELL_X82_Y30_N54
\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ = ( !ALUFN_i_reg(4) & ( (!ALUFN_i_reg(2) & (Y_i_reg(5) & (ALUFN_i_reg(3) & !ALUFN_i_reg(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001000000000000000100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_Y_i_reg(5),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(1),
	dataf => ALT_INV_ALUFN_i_reg(4),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\);

-- Location: MLABCELL_X82_Y30_N57
\ALU_inst|AdderSub_inst|rest:4:chain|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ = ( \ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\ & ( (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & Y_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\,
	datad => ALT_INV_Y_i_reg(4),
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[4]~3_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\);

-- Location: MLABCELL_X82_Y30_N15
\ALU_inst|AdderSub_inst|rest:4:chain|cout~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\ = ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[4]~3_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\) # (!Y_i_reg(4)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111110101010111111111010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\,
	datad => ALT_INV_Y_i_reg(4),
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[4]~3_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\);

-- Location: MLABCELL_X82_Y30_N42
\ALU_inst|AdderSub_inst|rest:4:chain|cout~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ = ( \ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ( !\ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & 
-- (\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\ & ((\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\)))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & 
-- (((\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\) # (\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\))) ) ) ) # ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[2]~1_combout\ & ( 
-- !\ALU_inst|AdderSub_inst|rest:4:chain|cout~1_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & (\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & (\ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\ & 
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[3]~2_combout\ & (((\ALU_inst|AdderSub_inst|y_adderSub_gated[2]~1_combout\ & \ALU_inst|AdderSub_inst|rest:1:chain|cout~0_combout\)) # 
-- (\ALU_inst|AdderSub_inst|x_adderSub_xor[3]~2_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100110111000100110111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[2]~1_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[3]~2_combout\,
	datac => \ALU_inst|AdderSub_inst|rest:1:chain|ALT_INV_cout~0_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[3]~2_combout\,
	datae => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[2]~1_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~1_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\);

-- Location: MLABCELL_X82_Y30_N36
\ALU_inst|AdderSub_inst|rest:5:chain|s\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ = ( \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ $ (\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ $ (!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ $ (\ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110011000011001111001100001111000011110000111100001111000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[5]~4_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[5]~4_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~2_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\);

-- Location: MLABCELL_X82_Y30_N51
\ALU_inst|Shifter_inst|Shifter_out[5]~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\ = ( \ALU_inst|x_Shifter_in[1]~2_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & Y_i_reg(7)) ) ) # ( !\ALU_inst|x_Shifter_in[1]~2_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & ((Y_i_reg(5)))) 
-- # (\ALU_inst|x_Shifter_in[0]~1_combout\ & (Y_i_reg(6))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000110111011000100011011101100001010000010100000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => ALT_INV_Y_i_reg(6),
	datac => ALT_INV_Y_i_reg(7),
	datad => ALT_INV_Y_i_reg(5),
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\);

-- Location: MLABCELL_X82_Y31_N9
\ALU_inst|Shifter_inst|Shifter_out[5]~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ = ( ALUFN_i_reg(0) & ( !ALUFN_i_reg(3) & ( (ALUFN_i_reg(4) & (!ALUFN_i_reg(1) & !ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000001100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(2),
	datae => ALT_INV_ALUFN_i_reg(0),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\);

-- Location: MLABCELL_X84_Y30_N30
\ALU_inst|Shifter_inst|Mux10~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux10~1_combout\ = ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & ((\ALU_inst|y_Shifter_in[4]~0_combout\))) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) ) # ( !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & ((\ALU_inst|y_Shifter_in[4]~0_combout\))) # (\ALU_inst|x_Shifter_in[1]~2_combout\ 
-- & (\ALU_inst|y_Shifter_in[2]~6_combout\)) ) ) ) # ( \ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( (\ALU_inst|x_Shifter_in[1]~2_combout\) # (\ALU_inst|y_Shifter_in[5]~1_combout\) ) ) ) # ( 
-- !\ALU_inst|y_Shifter_in[3]~7_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( (\ALU_inst|y_Shifter_in[5]~1_combout\ & !\ALU_inst|x_Shifter_in[1]~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100011101110111011100000011110011110000001111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	combout => \ALU_inst|Shifter_inst|Mux10~1_combout\);

-- Location: LABCELL_X83_Y30_N12
\ALU_inst|Shifter_inst|Shifter_out[5]~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ & ( \ALU_inst|Shifter_inst|Mux10~1_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (((\ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\)) # 
-- (\ALU_inst|AdderSub_inst|Equal13~0_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (((\ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\)))) ) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ & ( \ALU_inst|Shifter_inst|Mux10~1_combout\ & ( 
-- (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|AdderSub_inst|Equal13~0_combout\)) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & ((\ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\))) ) ) ) # ( \ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ & ( 
-- !\ALU_inst|Shifter_inst|Mux10~1_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[5]~13_combout\)) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & ((\ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\))) ) ) ) # ( 
-- !\ALU_inst|Shifter_inst|Shifter_out[5]~14_combout\ & ( !\ALU_inst|Shifter_inst|Mux10~1_combout\ & ( (\ALU_inst|x_Shifter_in[2]~0_combout\ & \ALU_inst|Shifter_inst|Shifter_out[1]~3_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000010100101111100100010011101110010101001111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~13_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~3_combout\,
	datae => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~14_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Mux10~1_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\);

-- Location: LABCELL_X83_Y31_N48
\ALU_inst|ALUout_o[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[5]~4_combout\ = ( \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ & ( (!ALUFN_i_reg(4) & (ALUFN_i_reg(3))) # (ALUFN_i_reg(4) & ((!ALUFN_i_reg(3)) # 
-- (\ALU_inst|Logic_inst|Logic_out[5]~5_combout\))) ) ) ) # ( !\ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ & ( (ALUFN_i_reg(4) & ((!ALUFN_i_reg(3)) # (\ALU_inst|Logic_inst|Logic_out[5]~5_combout\))) ) 
-- ) ) # ( \ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ & ( (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4)) # (\ALU_inst|Logic_inst|Logic_out[5]~5_combout\))) ) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ & ( (ALUFN_i_reg(4) & (ALUFN_i_reg(3) & \ALU_inst|Logic_inst|Logic_out[5]~5_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000011000000111100110000001100110011110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => \ALU_inst|Logic_inst|ALT_INV_Logic_out[5]~5_combout\,
	datae => \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_s~combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~15_combout\,
	combout => \ALU_inst|ALUout_o[5]~4_combout\);

-- Location: FF_X83_Y31_N49
\ALUout_o_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[5]~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(5));

-- Location: LABCELL_X79_Y30_N9
\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ = ( Y_i_reg(6) & ( ALUFN_i_reg(3) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(1) & !ALUFN_i_reg(4))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_ALUFN_i_reg(2),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => ALT_INV_Y_i_reg(6),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\);

-- Location: IOIBUF_X89_Y15_N21
\X[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(6),
	o => \X[6]~input_o\);

-- Location: FF_X79_Y30_N38
\X_i_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[6]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(6));

-- Location: LABCELL_X79_Y30_N39
\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ = ( !ALUFN_i_reg(2) & ( ALUFN_i_reg(0) & ( (!ALUFN_i_reg(1) & ((!X_i_reg(6)) # ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) ) ) # ( !ALUFN_i_reg(2) & ( !ALUFN_i_reg(0) & ( !ALUFN_i_reg(1) $ 
-- (((!X_i_reg(6)) # ((!ALUFN_i_reg(3)) # (ALUFN_i_reg(4))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000001111000000000000000011100000111100000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_X_i_reg(6),
	datab => ALT_INV_ALUFN_i_reg(3),
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => ALT_INV_ALUFN_i_reg(2),
	dataf => ALT_INV_ALUFN_i_reg(0),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\);

-- Location: LABCELL_X79_Y30_N24
\ALU_inst|AdderSub_inst|rest:6:chain|s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\ = ( \ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & ( !\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ ) ) # ( !\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & ( 
-- \ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[6]~5_combout\,
	dataf => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[6]~5_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\);

-- Location: LABCELL_X80_Y30_N48
\ALU_inst|Logic_inst|Logic_out[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[6]~6_combout\ = ( Y_i_reg(6) & ( X_i_reg(6) & ( (!ALUFN_i_reg(0) & ((!\ALUout_o_reg[0]~0_combout\ & ((!ALUFN_i_reg(1)))) # (\ALUout_o_reg[0]~0_combout\ & (!ALUFN_i_reg(2) & ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- (!ALUFN_i_reg(2) $ (((!\ALUout_o_reg[0]~0_combout\) # (ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(6) & ( X_i_reg(6) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( Y_i_reg(6) & ( !X_i_reg(6) & ( (!ALUFN_i_reg(0) & (((!\ALUout_o_reg[0]~0_combout\ & !ALUFN_i_reg(1))))) # (ALUFN_i_reg(0) & 
-- ((!ALUFN_i_reg(2) & (\ALUout_o_reg[0]~0_combout\)) # (ALUFN_i_reg(2) & ((!\ALUout_o_reg[0]~0_combout\) # (!ALUFN_i_reg(1)))))) ) ) ) # ( !Y_i_reg(6) & ( !X_i_reg(6) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101110100010001110100110001001011011011000100101101001000011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(0),
	datac => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datad => ALT_INV_ALUFN_i_reg(1),
	datae => ALT_INV_Y_i_reg(6),
	dataf => ALT_INV_X_i_reg(6),
	combout => \ALU_inst|Logic_inst|Logic_out[6]~6_combout\);

-- Location: LABCELL_X85_Y30_N18
\ALU_inst|Shifter_inst|Shifter_out[6]~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\ = ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & \ALU_inst|y_Shifter_in[0]~4_combout\) ) ) # ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( 
-- \ALU_inst|Shifter_inst|Mux7~4_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|Shifter_inst|ALT_INV_Mux7~4_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\);

-- Location: LABCELL_X85_Y30_N30
\ALU_inst|Shifter_inst|Mux9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux9~0_combout\ = ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( \ALU_inst|y_Shifter_in[1]~5_combout\ ) ) ) # ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( \ALU_inst|x_Shifter_in[2]~0_combout\ & ( 
-- \ALU_inst|y_Shifter_in[2]~6_combout\ ) ) ) # ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( \ALU_inst|y_Shifter_in[5]~1_combout\ ) ) ) # ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( 
-- !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( \ALU_inst|y_Shifter_in[6]~2_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100001111000011110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[1]~5_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[2]~6_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\,
	datae => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Mux9~0_combout\);

-- Location: LABCELL_X85_Y30_N48
\ALU_inst|Shifter_inst|Shifter_out[6]~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & \ALU_inst|Shifter_inst|Shifter_out[2]~6_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000111100000000000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~6_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\);

-- Location: LABCELL_X85_Y30_N15
\ALU_inst|Shifter_inst|Shifter_out[6]~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\) # ((\ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\ & \ALU_inst|AdderSub_inst|Equal13~0_combout\)) ) ) # 
-- ( !\ALU_inst|Shifter_inst|Shifter_out[6]~17_combout\ & ( (\ALU_inst|AdderSub_inst|Equal13~0_combout\ & ((!\ALU_inst|x_Shifter_in[1]~2_combout\ & ((\ALU_inst|Shifter_inst|Mux9~0_combout\))) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- (\ALU_inst|Shifter_inst|Shifter_out[6]~16_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000011101000000000001110111001100110111011100110011011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~16_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux9~0_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~17_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\);

-- Location: MLABCELL_X82_Y30_N21
\ALU_inst|AdderSub_inst|rest:5:chain|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ = ( \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ & !\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ & ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\) # (!\ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\))) # 
-- (\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\ & (!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & !\ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011000000111111001100000011000000110000001100000011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[5]~4_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[5]~4_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~2_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\);

-- Location: LABCELL_X79_Y30_N51
\ALU_inst|ALUout_o[6]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[6]~5_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ & ( \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & 
-- (\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\)) # (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[6]~6_combout\))))) ) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ & ( \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( 
-- (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & (\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\)) # (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[6]~6_combout\))))) ) ) ) # ( \ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ & ( 
-- !\ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & (!\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\)) # (ALUFN_i_reg(4) & 
-- ((\ALU_inst|Logic_inst|Logic_out[6]~6_combout\))))) ) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ & ( !\ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & 
-- (!\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\)) # (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[6]~6_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000000011000010101111001100000101000000110000010111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_s~0_combout\,
	datab => \ALU_inst|Logic_inst|ALT_INV_Logic_out[6]~6_combout\,
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~18_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_cout~0_combout\,
	combout => \ALU_inst|ALUout_o[6]~5_combout\);

-- Location: FF_X79_Y30_N52
\ALUout_o_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[6]~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(6));

-- Location: IOIBUF_X38_Y81_N18
\X[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X(7),
	o => \X[7]~input_o\);

-- Location: FF_X80_Y30_N47
\X_i_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \X[7]~input_o\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => X_i_reg(7));

-- Location: LABCELL_X79_Y30_N42
\ALU_inst|ALUout_o[7]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[7]~6_combout\ = ( !ALUFN_i_reg(4) & ( ALUFN_i_reg(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_ALUFN_i_reg(4),
	dataf => ALT_INV_ALUFN_i_reg(3),
	combout => \ALU_inst|ALUout_o[7]~6_combout\);

-- Location: LABCELL_X79_Y30_N12
\ALU_inst|AdderSub_inst|rest:7:chain|s~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ = ( !ALUFN_i_reg(2) & ( \ALU_inst|ALUout_o[7]~6_combout\ & ( (!ALUFN_i_reg(1) & (!ALUFN_i_reg(0) $ (!X_i_reg(7) $ (Y_i_reg(7))))) # (ALUFN_i_reg(1) & (!ALUFN_i_reg(0) & (!X_i_reg(7)))) ) ) ) # ( 
-- !ALUFN_i_reg(2) & ( !\ALU_inst|ALUout_o[7]~6_combout\ & ( !ALUFN_i_reg(0) $ (!ALUFN_i_reg(1)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110000000000000000001101000101001000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => ALT_INV_X_i_reg(7),
	datad => ALT_INV_Y_i_reg(7),
	datae => ALT_INV_ALUFN_i_reg(2),
	dataf => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\);

-- Location: LABCELL_X80_Y30_N0
\ALU_inst|Logic_inst|Logic_out[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Logic_inst|Logic_out[7]~7_combout\ = ( Y_i_reg(7) & ( X_i_reg(7) & ( (!ALUFN_i_reg(1) & (!\ALUout_o_reg[0]~0_combout\ $ (((!ALUFN_i_reg(2) & ALUFN_i_reg(0)))))) # (ALUFN_i_reg(1) & ((!ALUFN_i_reg(2) & (\ALUout_o_reg[0]~0_combout\ & 
-- !ALUFN_i_reg(0))) # (ALUFN_i_reg(2) & ((ALUFN_i_reg(0)))))) ) ) ) # ( !Y_i_reg(7) & ( X_i_reg(7) & ( (!ALUFN_i_reg(0) & (!ALUFN_i_reg(1) & ((!ALUFN_i_reg(2)) # (!\ALUout_o_reg[0]~0_combout\)))) # (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2) & 
-- ((\ALUout_o_reg[0]~0_combout\))) # (ALUFN_i_reg(2) & ((!ALUFN_i_reg(1)) # (!\ALUout_o_reg[0]~0_combout\))))) ) ) ) # ( Y_i_reg(7) & ( !X_i_reg(7) & ( (!\ALUout_o_reg[0]~0_combout\ & ((!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & 
-- (ALUFN_i_reg(2))))) # (\ALUout_o_reg[0]~0_combout\ & (ALUFN_i_reg(0) & ((!ALUFN_i_reg(2)) # (!ALUFN_i_reg(1))))) ) ) ) # ( !Y_i_reg(7) & ( !X_i_reg(7) & ( (!ALUFN_i_reg(0) & ((!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (ALUFN_i_reg(2))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110001010101110000000101111011001000010111101100001001011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(2),
	datab => ALT_INV_ALUFN_i_reg(1),
	datac => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datad => ALT_INV_ALUFN_i_reg(0),
	datae => ALT_INV_Y_i_reg(7),
	dataf => ALT_INV_X_i_reg(7),
	combout => \ALU_inst|Logic_inst|Logic_out[7]~7_combout\);

-- Location: MLABCELL_X82_Y30_N24
\ALU_inst|AdderSub_inst|rest:6:chain|cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ = ( \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ & ( \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & 
-- ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\) # ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\)))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & 
-- (!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\))) ) ) ) # ( !\ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ & ( 
-- \ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\) # ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & 
-- !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\)))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & (!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & 
-- !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\))) ) ) ) # ( \ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ & ( !\ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & 
-- ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\) # ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\)))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & 
-- (!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\ & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & !\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\))) ) ) ) # ( !\ALU_inst|AdderSub_inst|rest:4:chain|cout~0_combout\ & ( 
-- !\ALU_inst|AdderSub_inst|rest:4:chain|cout~2_combout\ & ( (!\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\) # ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\) # 
-- (!\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\)))) # (\ALU_inst|AdderSub_inst|y_adderSub_gated[6]~5_combout\ & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[6]~5_combout\ & ((!\ALU_inst|AdderSub_inst|y_adderSub_gated[5]~4_combout\) # 
-- (!\ALU_inst|AdderSub_inst|x_adderSub_xor[5]~4_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101011101000111010001010000011101000101000001110100010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[6]~5_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[5]~4_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[6]~5_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[5]~4_combout\,
	datae => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_cout~2_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\);

-- Location: MLABCELL_X84_Y30_N54
\ALU_inst|Shifter_inst|Mux10~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Mux10~2_combout\ = ( \ALU_inst|y_Shifter_in[7]~3_combout\ & ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|y_Shifter_in[6]~2_combout\)) # (\ALU_inst|x_Shifter_in[1]~2_combout\ & 
-- ((\ALU_inst|y_Shifter_in[4]~0_combout\))) ) ) ) # ( !\ALU_inst|y_Shifter_in[7]~3_combout\ & ( \ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|y_Shifter_in[6]~2_combout\)) # (\ALU_inst|x_Shifter_in[1]~2_combout\ 
-- & ((\ALU_inst|y_Shifter_in[4]~0_combout\))) ) ) ) # ( \ALU_inst|y_Shifter_in[7]~3_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( (!\ALU_inst|x_Shifter_in[1]~2_combout\) # (\ALU_inst|y_Shifter_in[5]~1_combout\) ) ) ) # ( 
-- !\ALU_inst|y_Shifter_in[7]~3_combout\ & ( !\ALU_inst|x_Shifter_in[0]~1_combout\ & ( (\ALU_inst|y_Shifter_in[5]~1_combout\ & \ALU_inst|x_Shifter_in[1]~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000101111101011111010100110000001111110011000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_y_Shifter_in[5]~1_combout\,
	datab => \ALU_inst|ALT_INV_y_Shifter_in[6]~2_combout\,
	datac => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	datae => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	combout => \ALU_inst|Shifter_inst|Mux10~2_combout\);

-- Location: LABCELL_X85_Y30_N45
\ALU_inst|Shifter_inst|Shifter_out[7]~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[7]~19_combout\ = ( !\ALU_inst|x_Shifter_in[2]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (!\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & 
-- \ALU_inst|y_Shifter_in[7]~3_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	dataf => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[7]~19_combout\);

-- Location: MLABCELL_X84_Y30_N24
\ALU_inst|Shifter_inst|Shifter_out[7]~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ = ( !\ALU_inst|Shifter_inst|Shifter_out[7]~19_combout\ & ( (!\ALU_inst|AdderSub_inst|Equal13~0_combout\) # ((!\ALU_inst|x_Shifter_in[2]~0_combout\ & ((!\ALU_inst|Shifter_inst|Mux10~2_combout\))) # 
-- (\ALU_inst|x_Shifter_in[2]~0_combout\ & (!\ALU_inst|Shifter_inst|Mux10~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111010111010111111101011101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux10~0_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Mux10~2_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~19_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\);

-- Location: MLABCELL_X84_Y30_N42
\ALU_inst|ALUout_o[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|ALUout_o[7]~7_combout\ = ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ & ( (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & (\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) # 
-- (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[7]~7_combout\))))) ) ) ) # ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ & ( (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & 
-- (!\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) # (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[7]~7_combout\))))) ) ) ) # ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ & ( 
-- (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & (\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) # (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[7]~7_combout\))))) ) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( !\ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ & ( (!ALUFN_i_reg(3) & (((ALUFN_i_reg(4))))) # (ALUFN_i_reg(3) & ((!ALUFN_i_reg(4) & (!\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) # 
-- (ALUFN_i_reg(4) & ((\ALU_inst|Logic_inst|Logic_out[7]~7_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001011001111000100011100111100100010000000110001000100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~0_combout\,
	datab => ALT_INV_ALUFN_i_reg(3),
	datac => \ALU_inst|Logic_inst|ALT_INV_Logic_out[7]~7_combout\,
	datad => ALT_INV_ALUFN_i_reg(4),
	datae => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~20_combout\,
	combout => \ALU_inst|ALUout_o[7]~7_combout\);

-- Location: FF_X84_Y30_N58
\ALUout_o_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \ALU_inst|ALUout_o[7]~7_combout\,
	clrn => \ALT_INV_rst~input_o\,
	sload => VCC,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ALUout_o_reg(7));

-- Location: FF_X84_Y30_N44
Nflag_o_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|ALUout_o[7]~7_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Nflag_o_reg~q\);

-- Location: LABCELL_X79_Y30_N27
\ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\ = ( X_i_reg(7) & ( (!ALUFN_i_reg(2) & ((!ALUFN_i_reg(0) & (!\ALU_inst|ALUout_o[7]~6_combout\ $ (!ALUFN_i_reg(1)))) # (ALUFN_i_reg(0) & (!\ALU_inst|ALUout_o[7]~6_combout\ & !ALUFN_i_reg(1))))) ) ) # ( 
-- !X_i_reg(7) & ( (!ALUFN_i_reg(2) & (!ALUFN_i_reg(0) $ (!ALUFN_i_reg(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101000000000010110100000000001101000000000000110100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	datac => ALT_INV_ALUFN_i_reg(1),
	datad => ALT_INV_ALUFN_i_reg(2),
	dataf => ALT_INV_X_i_reg(7),
	combout => \ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\);

-- Location: LABCELL_X85_Y30_N51
\ALU_inst|Shifter_inst|Shifter_cout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_cout~0_combout\ = ( \ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|x_Shifter_in[0]~1_combout\ & ((\ALU_inst|y_Shifter_in[0]~4_combout\)))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ 
-- & (((\ALU_inst|y_Shifter_in[3]~7_combout\)) # (\ALU_inst|x_Shifter_in[0]~1_combout\))) ) ) # ( !\ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- ((\ALU_inst|y_Shifter_in[0]~4_combout\)))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|y_Shifter_in[3]~7_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000100110000001000010011000010101001101110001010100110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[0]~4_combout\,
	dataf => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_cout~0_combout\);

-- Location: LABCELL_X85_Y30_N36
\ALU_inst|Shifter_inst|Shifter_cout~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_cout~1_combout\ = ( \ALU_inst|Shifter_inst|Mux2~1_combout\ & ( (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & ((\ALU_inst|x_Shifter_in[1]~2_combout\) # (\ALU_inst|Shifter_inst|Shifter_cout~0_combout\))) ) ) # ( 
-- !\ALU_inst|Shifter_inst|Mux2~1_combout\ & ( (\ALU_inst|Shifter_inst|Shifter_out[7]~0_combout\ & (\ALU_inst|Shifter_inst|Shifter_cout~0_combout\ & !\ALU_inst|x_Shifter_in[1]~2_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000110000000000000011001100110000001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~0_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~0_combout\,
	datad => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Mux2~1_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_cout~1_combout\);

-- Location: LABCELL_X85_Y30_N6
\ALU_inst|Shifter_inst|Shifter_cout~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_cout~2_combout\ = ( \ALU_inst|y_Shifter_in[4]~0_combout\ & ( (!\ALU_inst|x_Shifter_in[0]~1_combout\ & (\ALU_inst|x_Shifter_in[2]~0_combout\)) # (\ALU_inst|x_Shifter_in[0]~1_combout\ & ((!\ALU_inst|x_Shifter_in[2]~0_combout\ 
-- & ((\ALU_inst|y_Shifter_in[7]~3_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|y_Shifter_in[3]~7_combout\)))) ) ) # ( !\ALU_inst|y_Shifter_in[4]~0_combout\ & ( (\ALU_inst|x_Shifter_in[0]~1_combout\ & 
-- ((!\ALU_inst|x_Shifter_in[2]~0_combout\ & ((\ALU_inst|y_Shifter_in[7]~3_combout\))) # (\ALU_inst|x_Shifter_in[2]~0_combout\ & (\ALU_inst|y_Shifter_in[3]~7_combout\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000101000000010100010100100011011001110010001101100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|ALT_INV_x_Shifter_in[0]~1_combout\,
	datab => \ALU_inst|ALT_INV_x_Shifter_in[2]~0_combout\,
	datac => \ALU_inst|ALT_INV_y_Shifter_in[3]~7_combout\,
	datad => \ALU_inst|ALT_INV_y_Shifter_in[7]~3_combout\,
	dataf => \ALU_inst|ALT_INV_y_Shifter_in[4]~0_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_cout~2_combout\);

-- Location: LABCELL_X85_Y30_N42
\ALU_inst|Shifter_inst|Shifter_cout~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Shifter_inst|Shifter_cout~3_combout\ = ( \ALU_inst|Shifter_inst|Shifter_cout~2_combout\ & ( (\ALU_inst|AdderSub_inst|Equal13~0_combout\ & ((!\ALU_inst|x_Shifter_in[1]~2_combout\) # (\ALU_inst|Shifter_inst|Mux9~0_combout\))) ) ) # ( 
-- !\ALU_inst|Shifter_inst|Shifter_cout~2_combout\ & ( (\ALU_inst|x_Shifter_in[1]~2_combout\ & (\ALU_inst|Shifter_inst|Mux9~0_combout\ & \ALU_inst|AdderSub_inst|Equal13~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001100000000110011110000000011001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|ALT_INV_x_Shifter_in[1]~2_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Mux9~0_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_Equal13~0_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~2_combout\,
	combout => \ALU_inst|Shifter_inst|Shifter_cout~3_combout\);

-- Location: LABCELL_X85_Y30_N21
\ALU_inst|Cflag_o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Cflag_o~0_combout\ = ( \ALU_inst|Shifter_inst|Shifter_cout~3_combout\ & ( (ALUFN_i_reg(4) & !ALUFN_i_reg(3)) ) ) # ( !\ALU_inst|Shifter_inst|Shifter_cout~3_combout\ & ( (ALUFN_i_reg(4) & (!ALUFN_i_reg(3) & 
-- \ALU_inst|Shifter_inst|Shifter_cout~1_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010000000000000101000001010000010100000101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(4),
	datac => ALT_INV_ALUFN_i_reg(3),
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~1_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_cout~3_combout\,
	combout => \ALU_inst|Cflag_o~0_combout\);

-- Location: LABCELL_X85_Y30_N24
\ALU_inst|Cflag_o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Cflag_o~1_combout\ = ( \ALU_inst|Cflag_o~0_combout\ & ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ ) ) # ( !\ALU_inst|Cflag_o~0_combout\ & ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( (Y_i_reg(7) & 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & (\ALU_inst|ALUout_o[7]~6_combout\ & \ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\))) ) ) ) # ( \ALU_inst|Cflag_o~0_combout\ & ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ ) ) # ( 
-- !\ALU_inst|Cflag_o~0_combout\ & ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( (\ALU_inst|ALUout_o[7]~6_combout\ & (((Y_i_reg(7) & \ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\)) # 
-- (\ALU_inst|AdderSub_inst|x_adderSub_xor[7]~6_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100001111111111111111111100000000000000011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_Y_i_reg(7),
	datab => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\,
	datac => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	datad => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[7]~6_combout\,
	datae => \ALU_inst|ALT_INV_Cflag_o~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\,
	combout => \ALU_inst|Cflag_o~1_combout\);

-- Location: FF_X85_Y30_N25
Cflag_o_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|Cflag_o~1_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Cflag_o_reg~q\);

-- Location: LABCELL_X81_Y30_N6
\ALU_inst|Zflag_o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~0_combout\ = ( \ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\ & ( (!\ALU_inst|AdderSub_inst|first|s~0_combout\ & ((!\ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ & (\ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ & 
-- \ALU_inst|AdderSub_inst|first|cout~0_combout\)) # (\ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ & (!\ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ $ (!\ALU_inst|AdderSub_inst|first|cout~0_combout\))))) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:2:chain|s~0_combout\ & ( (!\ALU_inst|AdderSub_inst|first|s~0_combout\ & (!\ALU_inst|AdderSub_inst|x_adderSub_xor[1]~0_combout\ & (!\ALU_inst|AdderSub_inst|y_adderSub_gated[1]~0_combout\ & 
-- !\ALU_inst|AdderSub_inst|first|cout~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000010001010000000001000101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|first|ALT_INV_s~0_combout\,
	datab => \ALU_inst|AdderSub_inst|ALT_INV_x_adderSub_xor[1]~0_combout\,
	datac => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[1]~0_combout\,
	datad => \ALU_inst|AdderSub_inst|first|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:2:chain|ALT_INV_s~0_combout\,
	combout => \ALU_inst|Zflag_o~0_combout\);

-- Location: MLABCELL_X82_Y30_N0
\ALU_inst|Zflag_o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~1_combout\ = ( \ALU_inst|Zflag_o~0_combout\ & ( (!\ALU_inst|AdderSub_inst|rest:3:chain|s~combout\ & (!\ALU_inst|AdderSub_inst|rest:4:chain|s~0_combout\ $ (\ALU_inst|AdderSub_inst|rest:3:chain|cout~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000010100001010000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|rest:4:chain|ALT_INV_s~0_combout\,
	datac => \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_s~combout\,
	datad => \ALU_inst|AdderSub_inst|rest:3:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|ALT_INV_Zflag_o~0_combout\,
	combout => \ALU_inst|Zflag_o~1_combout\);

-- Location: LABCELL_X83_Y30_N48
\ALU_inst|Zflag_o~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~2_combout\ = ( \ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( !\ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( (!\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\ & \ALU_inst|Zflag_o~1_combout\) ) ) ) # ( 
-- !\ALU_inst|AdderSub_inst|rest:5:chain|cout~0_combout\ & ( !\ALU_inst|AdderSub_inst|rest:5:chain|s~combout\ & ( (\ALU_inst|AdderSub_inst|rest:6:chain|s~0_combout\ & \ALU_inst|Zflag_o~1_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011000000001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_s~0_combout\,
	datad => \ALU_inst|ALT_INV_Zflag_o~1_combout\,
	datae => \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_cout~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:5:chain|ALT_INV_s~combout\,
	combout => \ALU_inst|Zflag_o~2_combout\);

-- Location: LABCELL_X80_Y30_N33
\ALU_inst|Zflag_o~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~5_combout\ = ( !\ALU_inst|Logic_inst|Logic_out[3]~3_combout\ & ( !\ALU_inst|Logic_inst|Logic_out[0]~0_combout\ & ( (\ALUout_o_reg[0]~0_combout\ & (!\ALU_inst|Logic_inst|Logic_out[1]~1_combout\ & 
-- !\ALU_inst|Logic_inst|Logic_out[2]~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ALUout_o_reg[0]~0_combout\,
	datac => \ALU_inst|Logic_inst|ALT_INV_Logic_out[1]~1_combout\,
	datad => \ALU_inst|Logic_inst|ALT_INV_Logic_out[2]~2_combout\,
	datae => \ALU_inst|Logic_inst|ALT_INV_Logic_out[3]~3_combout\,
	dataf => \ALU_inst|Logic_inst|ALT_INV_Logic_out[0]~0_combout\,
	combout => \ALU_inst|Zflag_o~5_combout\);

-- Location: LABCELL_X80_Y30_N27
\ALU_inst|Zflag_o~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~6_combout\ = ( !\ALU_inst|Logic_inst|Logic_out[7]~7_combout\ & ( \ALU_inst|Zflag_o~5_combout\ & ( (!\ALU_inst|Logic_inst|Logic_out[6]~6_combout\ & (!\ALU_inst|Logic_inst|Logic_out[5]~5_combout\ & 
-- !\ALU_inst|Logic_inst|Logic_out[4]~4_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000010100000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Logic_inst|ALT_INV_Logic_out[6]~6_combout\,
	datac => \ALU_inst|Logic_inst|ALT_INV_Logic_out[5]~5_combout\,
	datad => \ALU_inst|Logic_inst|ALT_INV_Logic_out[4]~4_combout\,
	datae => \ALU_inst|Logic_inst|ALT_INV_Logic_out[7]~7_combout\,
	dataf => \ALU_inst|ALT_INV_Zflag_o~5_combout\,
	combout => \ALU_inst|Zflag_o~6_combout\);

-- Location: MLABCELL_X82_Y30_N48
\ALU_inst|AdderSub_inst|rest:7:chain|s\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ = ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ ) ) # ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( 
-- !\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~0_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\,
	combout => \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\);

-- Location: LABCELL_X83_Y30_N42
\ALU_inst|Zflag_o~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~3_combout\ = ( !\ALU_inst|Shifter_inst|Shifter_out[5]~15_combout\ & ( (ALUFN_i_reg(4) & (!ALUFN_i_reg(3) & (!\ALU_inst|Shifter_inst|Shifter_out[1]~4_combout\ & !\ALU_inst|Shifter_inst|Shifter_out[3]~9_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000010000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(4),
	datab => ALT_INV_ALUFN_i_reg(3),
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[1]~4_combout\,
	datad => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[3]~9_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[5]~15_combout\,
	combout => \ALU_inst|Zflag_o~3_combout\);

-- Location: LABCELL_X83_Y30_N6
\ALU_inst|Zflag_o~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~4_combout\ = ( \ALU_inst|Shifter_inst|Shifter_out[0]~2_combout\ & ( \ALU_inst|Shifter_inst|Shifter_out[4]~12_combout\ & ( (!\ALU_inst|Shifter_inst|Shifter_out[6]~18_combout\ & (\ALU_inst|Shifter_inst|Shifter_out[7]~20_combout\ & 
-- (\ALU_inst|Shifter_inst|Shifter_out[2]~7_combout\ & \ALU_inst|Zflag_o~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[6]~18_combout\,
	datab => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[7]~20_combout\,
	datac => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[2]~7_combout\,
	datad => \ALU_inst|ALT_INV_Zflag_o~3_combout\,
	datae => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[0]~2_combout\,
	dataf => \ALU_inst|Shifter_inst|ALT_INV_Shifter_out[4]~12_combout\,
	combout => \ALU_inst|Zflag_o~4_combout\);

-- Location: LABCELL_X83_Y30_N24
\ALU_inst|Zflag_o\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Zflag_o~combout\ = ( \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ & ( \ALU_inst|Zflag_o~4_combout\ ) ) # ( !\ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ & ( \ALU_inst|Zflag_o~4_combout\ ) ) # ( 
-- \ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ & ( !\ALU_inst|Zflag_o~4_combout\ & ( ((!ALUFN_i_reg(3) & !ALUFN_i_reg(4))) # (\ALU_inst|Zflag_o~6_combout\) ) ) ) # ( !\ALU_inst|AdderSub_inst|rest:7:chain|s~combout\ & ( !\ALU_inst|Zflag_o~4_combout\ & ( 
-- ((!ALUFN_i_reg(4) & ((!ALUFN_i_reg(3)) # (\ALU_inst|Zflag_o~2_combout\)))) # (\ALU_inst|Zflag_o~6_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000110011111111100010001111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(3),
	datab => ALT_INV_ALUFN_i_reg(4),
	datac => \ALU_inst|ALT_INV_Zflag_o~2_combout\,
	datad => \ALU_inst|ALT_INV_Zflag_o~6_combout\,
	datae => \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~combout\,
	dataf => \ALU_inst|ALT_INV_Zflag_o~4_combout\,
	combout => \ALU_inst|Zflag_o~combout\);

-- Location: FF_X83_Y30_N25
Zflag_o_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|Zflag_o~combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Zflag_o_reg~q\);

-- Location: LABCELL_X79_Y30_N30
\ALU_inst|Vflag_o~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Vflag_o~0_combout\ = ( \ALU_inst|ALUout_o[7]~6_combout\ & ( (!Y_i_reg(7) & (!ALUFN_i_reg(0) $ (X_i_reg(7)))) ) ) # ( !\ALU_inst|ALUout_o[7]~6_combout\ & ( !ALUFN_i_reg(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010000100100001001000010010000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => ALT_INV_Y_i_reg(7),
	datac => ALT_INV_X_i_reg(7),
	dataf => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	combout => \ALU_inst|Vflag_o~0_combout\);

-- Location: LABCELL_X79_Y30_N33
\ALU_inst|Vflag_o~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Vflag_o~1_combout\ = ( X_i_reg(7) & ( (Y_i_reg(7) & ((!ALUFN_i_reg(0)) # (!\ALU_inst|ALUout_o[7]~6_combout\))) ) ) # ( !X_i_reg(7) & ( (ALUFN_i_reg(0) & Y_i_reg(7)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100110010001100100011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ALUFN_i_reg(0),
	datab => ALT_INV_Y_i_reg(7),
	datac => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	dataf => ALT_INV_X_i_reg(7),
	combout => \ALU_inst|Vflag_o~1_combout\);

-- Location: LABCELL_X79_Y30_N54
\ALU_inst|Vflag_o~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ALU_inst|Vflag_o~2_combout\ = ( \ALU_inst|ALUout_o[7]~6_combout\ & ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & ((!\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ & 
-- ((\ALU_inst|Vflag_o~1_combout\))) # (\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ & (\ALU_inst|Vflag_o~0_combout\)))) ) ) ) # ( !\ALU_inst|ALUout_o[7]~6_combout\ & ( \ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & (\ALU_inst|Vflag_o~0_combout\ & \ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) ) ) ) # ( \ALU_inst|ALUout_o[7]~6_combout\ & ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( 
-- (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & ((!\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ & (\ALU_inst|Vflag_o~0_combout\)) # (\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\ & ((\ALU_inst|Vflag_o~1_combout\))))) ) ) ) # ( 
-- !\ALU_inst|ALUout_o[7]~6_combout\ & ( !\ALU_inst|AdderSub_inst|rest:6:chain|cout~0_combout\ & ( (\ALU_inst|AdderSub_inst|y_adderSub_gated[7]~3_combout\ & (\ALU_inst|Vflag_o~0_combout\ & !\ALU_inst|AdderSub_inst|rest:7:chain|s~0_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000000000100010000010100000000000100010000010100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALU_inst|AdderSub_inst|ALT_INV_y_adderSub_gated[7]~3_combout\,
	datab => \ALU_inst|ALT_INV_Vflag_o~0_combout\,
	datac => \ALU_inst|ALT_INV_Vflag_o~1_combout\,
	datad => \ALU_inst|AdderSub_inst|rest:7:chain|ALT_INV_s~0_combout\,
	datae => \ALU_inst|ALT_INV_ALUout_o[7]~6_combout\,
	dataf => \ALU_inst|AdderSub_inst|rest:6:chain|ALT_INV_cout~0_combout\,
	combout => \ALU_inst|Vflag_o~2_combout\);

-- Location: FF_X79_Y30_N55
Vflag_o_reg : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \ALU_inst|Vflag_o~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \ena~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Vflag_o_reg~q\);

-- Location: LABCELL_X2_Y3_N0
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


