LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE work.aux_package.ALL;

ENTITY MCU IS
	GENERIC(ControlBusSize: integer := 8;
			AddrBusSize	: integer := 32;
			DataBusSize	: integer := 32
			);
	PORT( 	reset, clock			: IN 	STD_LOGIC; 
			SW						: IN 	STD_LOGIC_VECTOR(7 DOWNTO 0);
			HEX0					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX1					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX2					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX3					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX4					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			HEX5					: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
			LEDR					: OUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out, 
		Regwrite_out					: OUT 	STD_LOGIC );
END MCU;

ARCHITECTURE arch OF MCU IS
		SIGNAL ControlBus	        : STD_LOGIC_VECTOR (ControlBusSize-1 DOWNTO 0);
		SIGNAL DataBus		        : STD_LOGIC_VECTOR (DataBusSize-1    DOWNTO 0);
		SIGNAL AddressBus           : STD_LOGIC_VECTOR (AddrBusSize-1    DOWNTO 0);
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
		--SIGNAL            : STD_LOGIC;
BEGIN


	cpu: MIPS 	GENERIC map(ControlBusSize, AddrBusSize, DataBusSize)
				PORT map   (reset			=> reset,
							clock			=> clock,
							ControlBus		=> ControlBus,
							DataBus			=> DataBus,
							AddressBus		=> AddressBus,
							PC				=> PC,
							ALU_result_out  => ALU_result_out,
							read_data_1_out => read_data_1_out,
							read_data_2_out => read_data_2_out,
							write_data_out  => write_data_out,
							Instruction_out => Instruction_out,
							Branch_out		=> Branch_out,
							Zero_out		=> Zero_out,
							Memwrite_out	=> Memwrite_out,
							Regwrite_out	=> Regwrite_out
							);
							
	GPIO: GPIO_handler 	GENERIC map(AddrBusSize, DataBusSize)
						PORT    map(MemRead_Signal 	=> ControlBus(0),
									clock			=> clock,
									reset			=> reset,
									MemWrite_Signal => ControlBus(1),
									AddressBus		=> AddressBus,
									DataBus			=> DataBus,
									HEX0			=> HEX0,
									HEX1			=> HEX1,
									HEX2			=> HEX2,
									HEX3			=> HEX3,
									HEX4			=> HEX4,
									HEX5			=> HEX5,
									LEDR			=> LEDR,
									SW				=> SW
								);
							
							
							
END arch;
