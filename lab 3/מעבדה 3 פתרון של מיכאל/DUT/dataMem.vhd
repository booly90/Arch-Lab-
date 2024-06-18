library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
--------------------------------------------------------------
entity dataMem is
generic( Dwidth: integer:=16;
		 Awidth: integer:=6;
		 dept:   integer:=64);
port(	clk,memEn: in std_logic;	
		WmemData:	in std_logic_vector(Dwidth-1 downto 0);
		WmemAddr,RmemAddr:	
					in std_logic_vector(Awidth-1 downto 0);
		RmemData: 	out std_logic_vector(Dwidth-1 downto 0)
);
end dataMem;
--------------------------------------------------------------
architecture behav of dataMem is

type RAM is array (0 to dept-1) of 
	std_logic_vector(Dwidth-1 downto 0);
signal sysRAM: RAM;

begin			   
  process(clk)
  begin
	if (clk'event and clk='1') then
		RmemData <= sysRAM(conv_integer(RmemAddr));
	    if (memEn='1') then
		    -- index is type of integer so we need to use 
			-- buildin function conv_integer in order to change the type
		    -- from std_logic_vector to integer
			sysRAM(conv_integer(WmemAddr)) <= WmemData;
			---------- report registers values ----------
			report 		"*************** Data Memory Content ***************"
				& LF & 	"0  = " & to_hstring(sysRAM(0))
				& LF & 	"1  = " & to_hstring(sysRAM(1))
				& LF & 	"2  = " & to_hstring(sysRAM(2))
				& LF & 	"3  = " & to_hstring(sysRAM(3))
				& LF & 	"4  = " & to_hstring(sysRAM(4))
				& LF & 	"5  = " & to_hstring(sysRAM(5))
				& LF & 	"6  = " & to_hstring(sysRAM(6))
				& LF & 	"7  = " & to_hstring(sysRAM(7))
				& LF & 	"8  = " & to_hstring(sysRAM(8))
				& LF & 	"9  = " & to_hstring(sysRAM(9))
				& LF & 	"10 = " & to_hstring(sysRAM(10))
				& LF & 	"11 = " & to_hstring(sysRAM(11))
				& LF & 	"12 = " & to_hstring(sysRAM(12))
				& LF & 	"13 = " & to_hstring(sysRAM(13))
				& LF & 	"14 = " & to_hstring(sysRAM(14))
				& LF &  "********************** UPDATED **********************"
				& LF & 	"" & to_hstring(WmemAddr) & " = " & to_hstring(WmemData)
				& LF & 	"*****************************************************";
	    end if;
	end if;
  end process;
	
  --RmemData <= sysRAM(conv_integer(RmemAddr));

end behav;
