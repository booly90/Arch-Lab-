LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE work.aux_package.all;
--------------------------------------------------------------
entity top is
	generic (
		n : positive := 8 ;
		m : positive := 7 ;
		k : positive := 3
	); -- where k=log2(m+1)
	port(
		rst,ena,clk : in std_logic;
		x : in std_logic_vector(n-1 downto 0);
		DetectionCode : in integer range 0 to 3;
		detector : out std_logic
	);
end top;
------------- complete the top Architecture code --------------
architecture arc_sys of top is
subtype vector IS std_logic_vector (n-1 downto 0);


signal internal_SR : std_logic_vector (m-1 downto 0);
begin
--------------------------------------------------------------
process1:
				
	
	




--------------------------------------------------------------
process2:






--------------------------------------------------------------
process3: 
PROCESS (clk, rst)    -- process generates an m-bit Shift Register, where the output is the value of the entire register (internal)
  BEGIN
	IF (rst='1') THEN
		internal_SR <= (others => '0');
	ELSIF (ena='0') THEN
		internal_SR <= internal_SR;
	ELSIF (clk'EVENT and clk='1') THEN
		internal_SR(0) <= din;
		for i in 0 to n-2 loop
			internal_SR(i+1) <= internal_SR(i);
		end loop;
	END IF;
END PROCESS;
detector <= (valid & internal_SR) = (m downto 0 => '1');

--------------------------------------------------------------
end arc_sys;







