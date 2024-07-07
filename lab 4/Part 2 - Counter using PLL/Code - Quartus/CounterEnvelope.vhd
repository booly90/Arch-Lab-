library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
 
entity CounterEnvelope is port (
	Clk,En : in std_logic;	
	Qout          : out std_logic; 
end CounterEnvelope;

architecture rtl of CounterEnvelope is
     
    signal PLLOut : std_logic ;

begin
     m0: counter port map(PLLOut,En,Qout);
	  u0: pll port map(
	     inclk0 => Clk,
		  c0 => PLLOut
	   );
end rtl;


