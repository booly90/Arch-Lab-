LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;

----------------------------------------
entity IR is 
    generic(
        bussize      : integer := 16;
        RFAdWidth    : integer := 4;
        OffsetSize   : integer := 8;
        immSize_1    : integer := 4;
		immSize_2    : integer := 8
    );
    port(
        PMdataOut      : in  std_logic_vector(bussize-1 downto 0);
        IRin           : in  std_logic;
        RFaddr         : in  std_logic_vector(1 downto 0);
        RWAddrRF       : out std_logic_vector(RFAdWidth-1 downto 0);
        OffsetAddr     : out std_logic_vector(OffsetSize-1 downto 0);
        Immid_1        : out std_logic_vector(immSize_1-1 downto 0);
		Immid_2        : out std_logic_vector(immSize_2-1 downto 0);
        IR_op          : out std_logic_vector(RFAdWidth-1 downto 0)

    );
end IR;

-----------------------------------------
ARCHITECTURE dlf OF IR IS
    signal IR_reg : std_logic_vector(bussize-1 downto 0) := (others => '0');

begin 
    process(IRin, PMdataOut)
    begin
        if IRin = '1' then
            IR_reg <= PMdataOut;
        end if;
    end process;

    IR_op <= IR_reg(4 * RFAdWidth - 1 downto 3 * RFAdWidth); --we put only 4 msb in IR

    with RFaddr select
        RWAddrRF <= IR_reg(RFAdWidth-1 downto 0) when "00",  -- R[c]
                    IR_reg(2 * RFAdWidth - 1 downto RFAdWidth) when "01",  -- R[b]
                    IR_reg(3 * RFAdWidth - 1 downto 2 * RFAdWidth) when others;  -- R[a]

    OffsetAddr <= IR_reg(OffsetSize-1 downto 0);

    Immid_1 <= IR_reg(immSize_1-1 downto 0);
	Immid_2 <= IR_reg(immSize_2-1 downto 0);

end dlf;
	
	