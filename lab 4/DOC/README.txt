# VHDL Project - ALU and PWM Modules

## Overview
This project involves synthesizing a synchronous digital system based on an ALU for the Cyclone V FPGA, focusing on performance and logic usage.

## Modules

### 1. TopIO_Interface

**Entity Declaration:**
```vhdl
ENTITY TopIO_Interface IS
  GENERIC ( HEX_num : integer := 7;
            n : INTEGER := 8 );
  PORT (
          PIN_AF14, SW8  						: in std_logic; 
          SW_i 									: in std_logic_vector(n-1 downto 0);
          KEY0, KEY1, KEY2, KEY3				: in std_logic;
          HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	: out std_logic_vector(HEX_num-1 downto 0);
          LEDs 									: out std_logic_vector(9 downto 0) ;
          PWM_OUT 								: OUT std_logic
  );
END TopIO_Interface;
Description:

The TopIO_Interface module interfaces with an FPGA, receiving inputs from switches and keys, and driving outputs to 7-segment displays and LEDs. It includes instantiations of Top, SegDecoder, and CounterEnvelope modules for ALU operations and PWM signal generation.

ENTITY top IS
  GENERIC ( n : INTEGER := 8;
            k : integer := 3;
            m : integer := 4 );
  PORT (
          Y_i, X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
          ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0);
          ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
          Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT STD_LOGIC;
          ena, rst, clk : in STD_LOGIC;
          PWM_OUT : out STD_LOGIC
  );
END top;

Description:

The top module integrates the PWM and ALU modules. It manages the input signals and distributes them to the appropriate sub-modules for processing, then collects and outputs the results.
3. PWM

ENTITY PWM IS
  GENERIC ( n : INTEGER := 8;
            k : integer := 3;
            m : integer := 4 );
  PORT (
          Y_PWM_in, X_PWM_in : IN STD_LOGIC_vector (n-1 DOWNTO 0);
          ENA, RST, CLK: in STD_LOGIC;
          ALUFN : IN  STD_LOGIC_vector (4 DOWNTO 0);
          PWM_OUT : out STD_LOGIC
  );
END ENTITY PWM;


Sure! Below is a README file for the VHDL project that includes descriptions of all the modules mentioned:

markdown
Copy code
# VHDL Project - ALU and PWM Modules

## Overview
This project contains VHDL modules that implement an Arithmetic Logic Unit (ALU) and a Pulse Width Modulation (PWM) generator. These modules are designed to work together within a top-level interface.

## Modules

### 1. TopIO_Interface

**Entity Declaration:**
```vhdl
ENTITY TopIO_Interface IS
  GENERIC ( HEX_num : integer := 7;
            n : INTEGER := 8 );
  PORT (
          PIN_AF14, SW8  						: in std_logic; 
          SW_i 									: in std_logic_vector(n-1 downto 0);
          KEY0, KEY1, KEY2, KEY3				: in std_logic;
          HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	: out std_logic_vector(HEX_num-1 downto 0);
          LEDs 									: out std_logic_vector(9 downto 0) ;
          PWM_OUT 								: OUT std_logic
  );
END TopIO_Interface;
Description:

The TopIO_Interface module interfaces with an FPGA, receiving inputs from switches and keys, and driving outputs to 7-segment displays and LEDs. It includes instantiations of Top, SegDecoder, and CounterEnvelope modules for ALU operations and PWM signal generation.
2. Top
Entity Declaration:

vhdl
Copy code
ENTITY top IS
  GENERIC ( n : INTEGER := 8;
            k : integer := 3;
            m : integer := 4 );
  PORT (
          Y_i, X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
          ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0);
          ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
          Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT STD_LOGIC;
          ena, rst, clk : in STD_LOGIC;
          PWM_OUT : out STD_LOGIC
  );
END top;
Description:

The top module integrates the PWM and ALU modules. It manages the input signals and distributes them to the appropriate sub-modules for processing, then collects and outputs the results.
3. PWM
Entity Declaration:

vhdl
Copy code
ENTITY PWM IS
  GENERIC ( n : INTEGER := 8;
            k : integer := 3;
            m : integer := 4 );
  PORT (
          Y_PWM_in, X_PWM_in : IN STD_LOGIC_vector (n-1 DOWNTO 0);
          ENA, RST, CLK: in STD_LOGIC;
          ALUFN : IN  STD_LOGIC_vector (4 DOWNTO 0);
          PWM_OUT : out STD_LOGIC
  );
END ENTITY PWM;
Description:

The PWM module generates a Pulse Width Modulation (PWM) signal. The duty cycle of the PWM is controlled by the input vectors and the ALUFN control signal, allowing for adjustable output based on the provided parameters.


ENTITY ALU IS
  GENERIC ( n : INTEGER := 8;
            k : integer := 3;
            m : integer := 4 );
  PORT (
          Y_i, X_i: IN STD_LOGIC_vector (n-1 DOWNTO 0);
          ALUFN_i : IN STD_LOGIC_vector (4 DOWNTO 0);
          ALUout_o: OUT STD_LOGIC_vector(n-1 downto 0);
          Nflag_o, Cflag_o, Zflag_o, Vflag_o: OUT STD_LOGIC
  );
END ALU;


Description:

The ALU module performs arithmetic, logical, and shift operations based on the ALUFN_i control signal. It outputs the result of the operation and several status flags indicating the state of the operation.
5. AdderSub
Description:

The AdderSub module performs addition and subtraction operations. It is instantiated within the ALU module and provides the result and carry out for these operations.
6. Shifter
Description:

The Shifter module performs bitwise shift operations. It is instantiated within the ALU module and provides the result and carry out for these operations.
7. Logic
Description:

The Logic module performs logical operations (AND, OR, etc.). It is instantiated within the ALU module and provides the result for these operations.
Usage
Compilation: Ensure all VHDL files are compiled in the correct order, respecting dependencies among modules.
Simulation: Use a VHDL simulator to test the functionality of each module and the top-level TopIO_Interface module.
Synthesis: Synthesize the design onto an FPGA, ensuring all pin mappings are correctly assigned.


