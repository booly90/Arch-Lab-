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
		clk in std_logic;	
		WmemData_muxed:	in std_logic_vector(Dwidth-1 downto 0);
		WmemAddr_muxed,RmemAddr_muxed:	
		in std_logic_vector(Awidth-1 downto 0);
		RmemData: 	out std_logic_vector(Dwidth-1 downto 0)
		dataBUS: in std_logic_vector(Dwidth-1 downto 0);
--control signals
		mem_wr, mem_in, mem_out: in std_logic;
--TB signals	
		TBactive, TB_wren: in std_logic;
		TB_data_in: in std_logic_vector(Dwidth-1 downto 0);
		T_rData  : out std_logic_vector(Dwidth-1 downto 0)
	);	
	
end top;

architecture  dfl of datamem_wrap is
	subtype data_wire of std_logic_vector(Dwidth-1 downto 0);
	
	signal memEn_muxed : std_logic
	signal WmemAddr_muxed, RmemAddr_muxed, wAdrr_reg: data_wire;
	signal WmemData_muxed, RmemData: data_wire;
		
BEGIN
-- mux inputs into data memory for when TB is active
	memEn_muxed    <= TB_wren  when TBactive = '1' else mem_wr;
	WmemData_muxed <= TB_wData when TBactive = '1' else dataBUS;
	WmemAddr_muxed <= TB_wAddr when TBactive = '1' else wAdrr_reg;
	RmemAddr_muxed <= TB_rAddr when TBactive = '1' else Rmem;

	TB_rData <= RmemData;
	
	--instatiations------------------------------------------
		dataMem2Bus: BidirPin	generic map(Dwidth)	port map(RmemData, Mem_out, RmemAddr_muxed, DataBUS);
	
	data_mem_inst: dataMem GENERIC map (
	Dwidth => Dwidth,
	Awidth => Awidth,
	dept   => dept)
	PORT map (clk, memEn_muxed, WmemData_muxed,WmemAddr_muxed,RmemAddr_muxed,RmemData);
	

	process (clk,rst)
	BEGIN
		if rst = '1' then
			wAdrr_reg <= (others => '0');
		elsif (clk'event && clk == '1') then
			wAdrr_reg <= dataBUS;
		end if
	end process

end dfl;

