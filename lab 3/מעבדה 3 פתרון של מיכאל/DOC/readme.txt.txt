# LAB3 - Digital System Design with VHDL (Multi-cycle CPU design)

In this lab we will use the knowledge we learned in lab1 and lab2 of a system design using concurrent and sequential logic principles.
The controller design is based on methodology of Control and Datapath separation.
We will design a controller based processing machine as a multi-cycle CPU in order to run a given program code

The Controller System is - 

INPUTS - 
* Signals Data from Test Bench - rst, ena, clk
* Data to initial ProgMem content
* Data to initial dataMem content

OUTPUTS - 
* Signal to Test Bench - done
* Data out to read dataMem content to a text file

## top (top.vhd) or Controller System
Contains The Control Unit (FSM) and the Datapath unit. From the datapath we get the status registers of which insturction we need to perform, and the FSM will output the control data for the datapath to perform the needed task

## Control Unit (Control.vhd)
The brain of the system, it's purpose is to receive the op code the system needs to perform, and from that status flag the right control flags will turn on to the datapath and dictating the needed operation. The FSM is based on a synchronized Mealy output machine and the full FSM is described in pre3.pdf

## Datapath Unit (Datapath.vhd)
The muscles of the system, its purpose is to recieve the op code we want to perform from the program memory and from the opcode using the opc decoder to send the status of the needed instruction to the Control Unit, where then the control unit will send the needed control signals to perform the needed task using synchronized and asynchronized modules


## ALU Unit (ALU.vhd)
The IR module is responsible for assigned signals that belong to the command that came from the ProgMem. Therefore, this module must know how to insert a new command only when IRin='1' along with getting the OP derived from the IR. In addition, he will be responsible for issuing the Offset and Immediate if necessary.

## Full Adder (FA.vhd)
Full Adder is the adder that adds three inputs and produces two outputs. The first two inputs are A and B and the third input is an input carry as C-IN. The output carry is designated as C-OUT and the normal output is designated as S which is SUM.

## IR (IR.vhd)
The IR module is responsible for assigned signals that belong to the command that came from the ProgMem. Therefore, this module must know how to insert a new command only when IRin='1' along with getting the OP derived from the IR. In addition, he will be responsible for issuing the Offset and Immediate if necessary.

## OPC decoder (OPCdecoder.vhd)
A decoder that recieves the IR opcode from the program memory and outputs the right status flag to the Control Unit


## PC Unit (PCLogic.vhd)
A module to perform the progress of the PC regarding the right instruction and the PCsel Mux. The PC output is the read Address of the program Memory


## Package (`aux_package.vhd`)
This file contains in the form of a package all the components that we would like to use throughout the laboratory.

## Credits
The lab created by Roy Kislev and Michael Grenader.