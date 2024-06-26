LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;

-- ALU_UNIT
-- THIS UNIT IS GOING TO IMPLEMENT THE ALU, REGISTER A, REGISTER C AND Cout.
-- THE UNIT WILL SUPPORT ALL THE FUNCTIONS AS SPECIFIED IN THE MAIN file

-- ENTITY
ENTITY ALU_UNIT IS
  GENERIC (BusSize : INTEGER := 16);
  PORT ( A, B          : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
         OPC           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         CFlag, Zflag, Nflag : OUT STD_LOGIC := '0';
         C             : OUT STD_LOGIC_VECTOR(BusSize-1 DOWNTO 0);
         Ain           : IN STD_LOGIC;
         Cout          : IN STD_LOGIC;
		 clk		   : in std_logic;
		 Cin           : in std_logic);
END ALU_UNIT;

-- Architecture
ARCHITECTURE intel_i9 OF ALU_UNIT IS
    subtype bus_wire IS std_logic_vector(BusSize-1 DOWNTO 0);
    signal REG_A : bus_wire := (others => '0');
    signal A_temp, B_temp: bus_wire;
    signal MASTER_C: bus_wire := (others => '0');
    signal s : bus_wire;
    signal wire_c: bus_wire;
    signal carryin : STD_LOGIC := '0';
    signal internal_carry : STD_LOGIC;
	signal c_slave : bus_wire;
BEGIN

    adder_inst: Adder generic map (BusSize) port map(A_temp, B_temp, carryin, s, internal_carry);
	process(clk)
	BEGIN
		if clk'event and clk = '1' then
			if Ain = '1' then
				REG_A <= A;	
			end if;
			
			if Cin = '1' then
				MASTER_C <= wire_c;
			end if;				

		end if;
		
--		if clk'event and clk = '0' then
--			c_slave <= MASTER_C;
		
--		end if;
	end process;
	
    process(A, B, OPC, Ain)
    begin
        if OPC = "0000" then
            A_temp <= REG_A;
            B_temp <= B;
            carryin <= '0';
			wire_c <= s;
			CFlag <= internal_carry;

        elsif OPC = "0001" then
            A_temp <= REG_A;
            B_temp <= not B;
            carryin <= '1';
			wire_c <= s;
			CFlag <= internal_carry;

        elsif OPC = "0010" then
            A_temp <= REG_A;
            B_temp <= B;
            wire_c <= A_temp and B_temp;

        elsif OPC = "0011" then
            A_temp <= REG_A;
            B_temp <= B;
            wire_c <= A_temp or B_temp;

        elsif OPC = "0100" then
            A_temp <= REG_A;
            B_temp <= B;
            wire_c <= A_temp xor B_temp;
		end if;
    end process;

    

	
    -- 
	
--    C <= c_slave when Cout = '1' else (others => 'Z');
	C <= MASTER_C when Cout = '1' else (others => 'Z');

    -- flags
    Zflag <= '1' when c_slave = (BusSize - 1 downto 0 => '0') else '0';
    Nflag <= c_slave(BusSize-1);
END intel_i9;
