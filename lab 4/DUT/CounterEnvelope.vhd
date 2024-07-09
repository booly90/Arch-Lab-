LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;

entity CounterEnvelope is 
generic(L :integer := 6 );
port (
	Clk,En,rst : in std_logic;	
	Qout          : out std_logic);
end CounterEnvelope;

architecture rtl of CounterEnvelope is
    
COMPONENT counter
generic(L :integer := 6 );
port(
	clk,enable,rst : in std_logic;	
	q          : out std_logic);
end COMPONENT;
	
component pll is
	port (
		locked   : out std_logic;        --  locked.export
		outclk_0 : out std_logic;        -- outclk0.clk
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'  --   reset.reset
	);
end component pll;
	
    signal PLLOut : std_logic ;

begin
     m0: counter generic map (L=>6) port map(PLLOut,En,rst,Qout);
	  u0: pll port map(
	     refclk => Clk,
		 rst => rst,
		  outclk_0 => PLLOut
	   );
end rtl;


