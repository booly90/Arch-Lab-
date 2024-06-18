library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
USE work.aux_package.all;
---------------------------------------------------------------
entity OPCdecoder is
	generic( RegSize: integer:=4);
	port(	IROp : in std_logic_vector(RegSize-1 downto 0);
			st, ld, mov, done_DM, add, sub, jmp, jc, jnc, nop: out std_logic
);
end OPCdecoder;
---------------------------------------------------------------
architecture behav of OPCdecoder is

begin
-- IRreg(BusSize-1 downto BusSize-RegSize) = Last 4 bits of IR register which is Op
add  	<=	'1' when IROp = "0000" else '0';
sub  	<=	'1' when IROp = "0001" else '0';
nop  	<=	'1' when IROp = "0010" else '0';
-- TBD  <=  '1' when IROp = "0011" else '0'; R-Type Unused
jmp  	<=	'1' when IROp = "0100" else '0';
jc   	<=	'1' when IROp = "0101" else '0';
jnc  	<=	'1' when IROp = "0110" else '0';
-- TBD  <=  '1' when IROp = "0111" else '0'; J-Type Unused
mov  	<=	'1' when IROp = "1000" else '0';
ld   	<=  '1' when IROp = "1001" else '0';
st   	<=	'1' when IROp = "1010" else '0';
done_DM <=  '1' when IROp = "1011" else '0';




end behav;