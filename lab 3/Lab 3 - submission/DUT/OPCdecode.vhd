library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
---------------------------------------------------------
-- A test bench which checks the Control unit's proper function. 
---------------------------------------------------------
entity OPCdecode is
	generic(RFAddrWidth: integer:=4); 	-- Register Size
	port(	IRopBits	:IN std_logic_vector (RFAddrWidth - 1 downto 0);
			mov, done_DTCM, and_op, or_op, xor_op : OUT std_logic;
			jnc, jc, jmp, sub, add, ld, st : OUT std_logic
		);
end OPCdecode;

architecture OPCdecode of OPCdecode is
begin 
	add			<= '1' when IRopBits ="0000" ;
	sub			<= '1' when IRopBits ="0001" ;
	and_op		<= '1' when IRopBits ="0010" ;
	or_op		<= '1' when IRopBits ="0011" ;
	xor_op		<= '1' when IRopBits ="0100" ;
	--			<= '1' when IRopBits ="0101" ; R-type unused opcode
	--			<= '1' when IRopBits ="0110" ; R-type unused opcode
	jmp			<= '1' when IRopBits ="0111" ;
	jc			<= '1' when IRopBits ="1000" ;
	jnc			<= '1' when IRopBits ="1001" ;
	--			<= '1' when IRopBits ="1010" ; J-type unused opcode
	--			<= '1' when IRopBits ="1011" ; J-type unused opcode
	mov			<= '1' when IRopBits ="1100" ;
	ld			<= '1' when IRopBits ="1101" ;
	st			<= '1' when IRopBits ="1110" ;
	done_DTCM	<= '1' when IRopBits ="1111" ;
end OPCdecode;