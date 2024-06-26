library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- For std_logic_vector arithmetic
use work.aux_package.all;

entity IR is
  generic (
    bus_size 	: integer := 16;
	RFAddrWidth	: integer := 4
  );
  port (
	clk, rst: in std_logic;
    bus_in : in std_logic_vector(bus_size-1 downto 0);
    IRin : in std_logic;
    RFaddr : in std_logic_vector(1 downto 0);
    reg_address : out std_logic_vector(RFAddrWidth-1 downto 0);
    Op : out std_logic_vector(3 downto 0);
    Imm1 : out std_logic_vector(bus_size-1 downto 0);
    Imm2 : out std_logic_vector(bus_size-1 downto 0);
    offset_addr : out std_logic_vector(7 downto 0)
  );
end IR;

architecture behavioral of IR is
  signal IR_reg : std_logic_vector(bus_size-1 downto 0);
  
  alias opcode is IR_reg(bus_size-1 downto bus_size-4);
  alias ra is IR_reg(bus_size-5 downto bus_size-8);
  alias rb is IR_reg(bus_size-9 downto bus_size-12);
  alias rc is IR_reg(bus_size-13 downto 0);
  alias IR_8 is IR_reg(7 downto 0);
  
begin
  process (clk,rst)
  begin
	if rst = '1' then
		IR_reg <= (others =>'0');
    elsif (IRin = '1' and (clk'event and clk='1')) then
      IR_reg <= bus_in;
    end if;
  end process;

  process (RFaddr, ra, rb, rc)
  begin
    case RFaddr is
      when "00" => reg_address <= ra;
      when "01" => reg_address <= rb;
      when "10" => reg_address <= rc;
      when others => reg_address <= (others => '0');
    end case;
  end process;

  process (IRin, opcode, IR_8, rc)
  begin
    if IRin = '1' then
      Op <= opcode;
      Imm1 <= std_logic_vector(resize(signed(IR_8), Imm1'length));
      Imm2 <= std_logic_vector(resize(signed(rc), Imm2'length));
      offset_addr <= IR_8;
    end if;
  end process;
  
end behavioral;
