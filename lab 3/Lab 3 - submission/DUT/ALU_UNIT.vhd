LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;

-- ALU_UNIT
-- THIS UNIT IS GOING TO IMPLEMENT THE ALU, REGISTER A, REGISTER C AND COUT.
-- THE UNIT WILL SUPPORT ALL THE FUNCTIONS AS SPECIFIED IN THE MAIN file

-- ENTITY
ENTITY ALU_UNIT IS
  GENERIC (BusSize : INTEGER := 16);
  PORT ( A, B          : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
         OPC           : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         CFlag, Zflag, Nflag : OUT STD_LOGIC;
         C             : OUT STD_LOGIC_VECTOR(BusSize-1 DOWNTO 0);
         Ain           : IN STD_LOGIC;
         COUT          : IN STD_LOGIC);
END ALU_UNIT;

-- Architecture
ARCHITECTURE intel_i9 OF ALU_UNIT IS
    subtype bus_wire IS std_logic_vector(BusSize-1 DOWNTO 0);
    signal REG_A : bus_wire := (others => '0');
    signal A_temp, B_temp: bus_wire;
    signal REG_C: bus_wire := (others => '0');
    signal s : bus_wire;
    signal wire_c: bus_wire;
    signal carryin : STD_LOGIC := '0';
    signal internal_carry : STD_LOGIC;
BEGIN

    adder_inst: Adder port map(A_temp, B_temp, carryin, s, internal_carry);

    process(A, B, OPC, Ain, cout)
    begin
        if Ain = '1' then
            REG_A <= A;
        end if;

        if OPC = "0000" then
            A_temp <= REG_A;
            B_temp <= B;
            carryin <= '0';

        elsif OPC = "0001" then
            A_temp <= REG_A;
            B_temp <= not B;
            carryin <= '1';

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

        else
            REG_C <= (others => '0');
        end if;
    end process;

    process(wire_c, s)
    begin
        if OPC = "0000" or OPC = "0001" then
            REG_C <= s;
            CFlag <= internal_carry;

        elsif OPC = "0010" or OPC = "0011" or OPC = "0100" then
            REG_C <= wire_c;
            CFlag <= '0'; -- בדיקות AND, OR, XOR לא משפיעות על הדגל C

        else
            REG_C <= (others => '0');
            CFlag <= '0';
        end if;
    end process;
	
    -- 
	
    C <= REG_C when cout = '1';

    -- flags
    Zflag <= '1' when REG_C = (BusSize - 1 downto 0 => '0') else '0';
    Nflag <= REG_C(BusSize-1);
END intel_i9;
