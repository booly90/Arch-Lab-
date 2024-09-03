PLEASE README BEFORE USING ANY OTHER CODE OF THE PROJECT FILES :/

---

# MIPS Processor Core Project

## Overview

This project implements a MIPS processor core using VHDL. The design includes several key modules that together form a complete MIPS processor, capable of fetching, decoding, executing instructions, and performing memory operations. The processor is designed to be synthesizable for FPGA implementation, with simulation support included.

## Project Structure

- **MIPS.vhdl**: The top-level structural model that connects all the submodules to form the MIPS processor core.
  
- **Ifetch.vhdl**: Manages the program counter (PC) and instruction fetching from memory.
  
- **Idecode.vhdl**: Decodes instructions, reads data from the register file, and prepares operands for the ALU.
  
- **control.vhdl**: Generates control signals based on the opcode and function fields of the instruction.
  
- **Execute.vhdl**: Handles arithmetic and logical operations using the ALU, as well as branch calculations.
  
- **dmemory.vhdl**: Manages data memory operations, including reading and writing data.
  
- **GPIO_handler.vhdl**: Handles general-purpose input/output (GPIO) operations, interfacing with external peripherals like LED displays and switches.
  
- **interupt_handler.vhdl**: Manages interrupt requests (IRQs), enabling and handling interrupt-driven operations.

### Additional Modules

- **aux_package.vhd**: Contains auxiliary packages and definitions used across multiple modules in the project.
  
- **GPI.vhd**: Implements the General-Purpose Input (GPI) component used for reading input signals like switches.
  
- **GPO.vhd**: Implements the General-Purpose Output (GPO) component used for driving output signals like LEDs and seven-segment displays.
  
- **MCU.vhd**: Manages microcontroller unit functionalities, potentially including clock management and peripheral control.
  
- **OptAddressDecoder.vhd**: Provides address decoding functionality, crucial for mapping memory addresses to specific peripherals or memory regions.
  
- **pll.vhd**: Implements a Phase-Locked Loop (PLL) for clock management, potentially generating necessary clock signals for the processor.
  
- **segDecoder.vhd**: Decodes binary values into signals suitable for driving seven-segment displays, used in conjunction with the `GPO.vhd` module.

## Simulation and Testing

To test the design:

1. **Simulation**: 
   - Use your preferred VHDL simulator (e.g., ModelSim, Vivado) to simulate the behavior of the MIPS processor.
   - The commented-out signals in the `MIPS.vhdl` file can be used to observe key internal states during simulation.

2. **Synthesis**:
   - The design is synthesizable for FPGA targets. Ensure that the `SIM` parameter is set appropriately depending on whether you are simulating or synthesizing.

## Key Features

- **Multi-stage Pipeline**: The processor is divided into stages—fetch, decode, execute, memory access, and write-back—each implemented by a specific module.
  
- **Interrupt Handling**: The `interupt_handler.vhdl` module provides robust support for handling multiple interrupt sources, crucial for real-time applications.
  
- **GPIO Support**: The `GPIO_handler.vhdl` module allows for interfacing with external peripherals like LEDs and seven-segment displays, making it easier to debug and visualize operations.
  
- **Configurable Memory Width**: The memory width can be configured using the `MemWidth` generic parameter, making the design flexible for different applications.

- **Clock Management**: The `pll.vhd` module manages clock signals, ensuring that the processor operates at the desired frequency.

## Getting Started

1. **Setup**:
   - Ensure that all the VHDL files are included in your project workspace.
   - Set the top-level module to `MIPS.vhdl`.

2. **Compilation**:
   - Compile the project using your VHDL toolchain. Resolve any dependencies by ensuring all libraries are correctly referenced.

3. **Simulation**:
   - Run simulations to verify the functionality of each module. The testbenches should cover a wide range of scenarios, including normal operations, edge cases, and interrupt handling.

4. **Synthesis and Implementation**:
   - After successful simulation, proceed to synthesize the design for your target FPGA. Ensure that timing constraints are met.

5. **Testing on Hardware**:
   - Deploy the synthesized design onto your FPGA board. Use external peripherals connected via GPIO to observe the processor's behavior.

## Notes

- **Simulation vs. FPGA Mode**: The `SIM` generic parameter determines whether the design is in simulation or FPGA mode. Ensure this is set correctly depending on your workflow.
  
- **Memory Initialization**: The instruction memory is initialized using hex files (`.hex`). Ensure the paths to these files are correctly set in the `Ifetch.vhdl` file.

- **Clock Management**: The `pll.vhd` file must be correctly configured and instantiated to ensure proper clock signal generation.


---

This `README.txt` now includes references to all the files, ensuring a comprehensive guide for anyone working with or reviewing your project.