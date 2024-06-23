LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.aux_package.all;
use ieee.std_logic_arith.all;

entity datamem_wrap is
generic( 
		Dwidth: integer:=16;
		Awidth: integer:=6;
		dept:   integer:=64
		);
    port(
--DUT signals		
		clk, rst :in std_logic;	

		dataBUS: inout std_logic_vector(Dwidth-1 downto 0);
--control signals
		mem_wr, mem_in, mem_out: in std_logic;
--TB signals	
		TBactive, TB_wren: in std_logic;
		TB_wAddr, TB_rAddr	: in std_logic_vector(Awidth-1 downto 0);
		TB_wData 			: in std_logic_vector(Dwidth-1 downto 0);
		TB_rData  			: out std_logic_vector(Dwidth-1 downto 0)
	);	
		
	
end datamem_wrap;

architecture  dfl of datamem_wrap is
	signal memEn_muxed : std_logic;
	signal WmemAddr_muxed, RmemAddr_muxed, wAdrr_reg: std_logic_vector(Dwidth-1 downto 0);
	signal WmemData_muxed, RmemData: std_logic_vector(Dwidth-1 downto 0);
		
BEGIN
-- mux inputs into data memory for when TB is active
	memEn_muxed    <= TB_wren  when TBactive = '1' else mem_wr;
	WmemData_muxed <= TB_wData when TBactive = '1' else dataBUS;
	WmemAddr_muxed <= TB_wAddr when TBactive = '1' else wAdrr_reg;
--	RmemAddr_muxed <= TB_rAddr when TBactive = '1' else Rmem;

	TB_rData <= RmemData;
	
	--instatiations------------------------------------------
	dataMem2Bus: BidirPin	generic map(Dwidth)	port map(RmemData, Mem_out, RmemAddr_muxed, DataBUS);
	
	data_mem_inst: dataMem 	GENERIC map (Dwidth, Awidth, dept)  
							PORT map (clk, memEn_muxed, WmemData_muxed, WmemAddr_muxed, RmemAddr_muxed, RmemData);
	

	process (clk,rst,mem_in)
	BEGIN
		if rst = '1' then
			wAdrr_reg <= (others => '0');
		elsif ( mem_in ='1' and (clk'event and clk = '1')) then
			wAdrr_reg <= dataBUS;
		end if;
	end process;

end dfl;

