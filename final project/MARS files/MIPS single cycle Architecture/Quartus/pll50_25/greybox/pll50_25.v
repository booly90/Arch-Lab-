// Copyright (C) 2021  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

// DATE "08/31/2024 12:49:39"

// 
// Device: Altera 5CSXFC6D6F31C6 Package FBGA896
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module pll50_25 (
	locked,
	outclk_0,
	refclk,
	rst)/* synthesis synthesis_greybox=0 */;
output 	locked;
output 	outclk_0;
input 	refclk;
input 	rst;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \pll_0|altera_pll_i|outclk_wire[0] ;
wire \pll_0|altera_pll_i|locked_wire[0] ;
wire \refclk~input_o ;
wire \rst~input_o ;


pll50_25_pll50_25_pll_0 pll_0(
	.outclk_wire_0(\pll_0|altera_pll_i|outclk_wire[0] ),
	.locked(\pll_0|altera_pll_i|locked_wire[0] ),
	.refclk(\refclk~input_o ),
	.rst(\rst~input_o ));

assign \refclk~input_o  = refclk;

assign \rst~input_o  = rst;

assign locked = \pll_0|altera_pll_i|locked_wire[0] ;

assign outclk_0 = \pll_0|altera_pll_i|outclk_wire[0] ;

endmodule

module pll50_25_pll50_25_pll_0 (
	outclk_wire_0,
	locked,
	refclk,
	rst)/* synthesis synthesis_greybox=0 */;
output 	outclk_wire_0;
output 	locked;
input 	refclk;
input 	rst;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



pll50_25_altera_pll_1 altera_pll_i(
	.outclk({outclk_wire_0}),
	.locked(locked),
	.refclk(refclk),
	.rst(rst));

endmodule

module pll50_25_altera_pll_1 (
	outclk,
	locked,
	refclk,
	rst)/* synthesis synthesis_greybox=0 */;
output 	[0:0] outclk;
output 	locked;
input 	refclk;
input 	rst;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \fboutclk_wire[0] ;


generic_pll \general[0].gpll (
	.refclk(refclk),
	.fbclk(\fboutclk_wire[0] ),
	.rst(rst),
	.writerefclkdata({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd}),
	.writeoutclkdata({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd}),
	.writephaseshiftdata({gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd,gnd}),
	.writedutycycledata(64'b0000000000000000000000000000000000000000000000000000000000000000),
	.outclk(outclk[0]),
	.fboutclk(\fboutclk_wire[0] ),
	.locked(locked),
	.readrefclkdata(),
	.readoutclkdata(),
	.readphaseshiftdata(),
	.readdutycycledata());
defparam \general[0].gpll .clock_name_global = "false";
defparam \general[0].gpll .duty_cycle = 50;
defparam \general[0].gpll .fractional_vco_multiplier = "false";
defparam \general[0].gpll .output_clock_frequency = "25.0 mhz";
defparam \general[0].gpll .phase_shift = "0 ps";
defparam \general[0].gpll .reference_clock_frequency = "50.0 mhz";
defparam \general[0].gpll .simulation_type = "timing";

endmodule
