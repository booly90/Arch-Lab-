LAB4 - FPGA based Digital Design
In this lab we will have to synthesize a synchronous digital system based LAB1 Assignment which was an ALU for the Cyclone V FPGA with impact on performance and logic usage


The Digital System Module (The ALU) is - 
INPUTS - 
* input signal `X`.
* input signal `Y`.
* control signal `ALUFN` where `ALUFN[4:3]` choose the selected module (`01 -> AdderSub`, `10 -> Shifter`, `11 -> Logic`), and each module act differently with control of `ALUFN[2:0]`.

OUTPUTS - 
* Flags `Z`(Zero), `C`(Carry), `N`(Negative) where the result of each of the flags will be according to its name.
* `ALUout` - The system output according to the module selected.

## AdderSub (`AdderSub.vhd`)
This module performs according to its ALUFN input either addition or subtraction between 2 signals X, Y with equal lengths by FA according to the sub_cont control signal (`sub_cont='1' -> SUB`, `sub_cont='0' -> ADD`). In addition NEG operation is performed which performs a subtraction between the X signal and zeros vector.


## Shifter (`Shifter.vhd`)
This module performs according to the `ALUFN` input a barrel-shifter-based shift, where if `ALUFN[2:0] = 000` then we will shift to the left and if `ALUFN[2:0] = 001` we will shift to the right. We decided to implement the module by going through all k layers (where k=log_2⁡n) and for each layer we will perform a shift accordingly so that if the bit in the relevant layer in X is 0 we will not perform a shift and then the origin of the layer will be the same as the entry and otherwise we will perform a shift according to the layer.

## Logic (`Logic.vhd`)
This module is required to perform various logical operations on the X, Y signals according to the `ALUFN` input. These logical operations can be performed in VHDL when they can be synthesized and therefore we used them easily when we chose the appropriate operation according to `ALUFN[2:0]`.

## Top (`top.vhd`)
This module is the module that wraps the entire system, it receives the transition inputs and transfers them according to the appropriate module and classifies the outputs accordingly.

## FullAdder (`FA.vhd`)
This module is the module that wraps the entire system, it receives the transition inputs and transfers them according to the appropriate module and classifies the outputs accordingly. This file implement FullAdder.

# Performance Test Case
Because the system is asynchronous, in order to perform timing analysis, we need to confine the ALU between two synchronous registers.

# Hardware Test Case
In the hardware test case, we will test our ALU into the D10-Standard FPGA board
We will use the switches, Keys, LEDS and 7-segment displays for our test case

## TopIO_Interface (TopIO_Interface.vhd)
Digital system with I/O interface for the hardware test case


## TopIO_PureLogicWithoutPLL (TopIO_PureLogicWithoutPLL.vhd)
Test case for the pure logic system as ALU without PLL 



by: Roy kislev and Michael grenader