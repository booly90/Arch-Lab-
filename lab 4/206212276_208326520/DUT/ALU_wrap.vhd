LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE wORk.aux_package.all;
-------------------------------------
ENTITY ALU_wrap IS
  GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
  PORT 
  (
	clk, rst,ena :in STD_LOGIC;
	Y,X: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	ALUFN : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	ALUout: OUT STD_LOGIC_VECTOR(n-1 downto 0);
	Nflag,Cflag,Zflag,Vflag: OUT STD_LOGIC
  ); -- Zflag,Cflag,Nflag,Vflag
END ALU_wrap;

architecture rtl of ALU_wrap IS
	subtype vector IS STD_LOGIC_VECTOR(n-1 DOWNTO 0);

signal Y_i,X_i : vector;
signal	ALUFN_i : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal	ALUout_o:  STD_LOGIC_VECTOR(n-1 downto 0);
signal	Nflag_o,Cflag_o,Zflag_o,Vflag_o:  STD_LOGIC;
signal Y_i_reg,X_i_reg : vector;
signal	ALUFN_i_reg : STD_LOGIC_VECTOR (4 DOWNTO 0);
signal	ALUout_o_reg:  STD_LOGIC_VECTOR(n-1 downto 0);
signal	Nflag_o_reg,Cflag_o_reg,Zflag_o_reg,Vflag_o_reg:  STD_LOGIC;	
begin
	ALU_inst: ALU port map(Y_i,X_i,ALUFN_i,ALUout_o,Nflag_o,Cflag_o,Zflag_o,Vflag_o);


	process (clk,rst)
	begin
		if (rst = '1') then
			Y_i_reg        <= (others =>	 '0');
			X_i_reg        <= (others =>	 '0');
			ALUFN_i_reg    <= (others =>	 '0');
			ALUout_o_reg   <= (others =>	 '0');
			Nflag_o_reg    <= '0';
			Cflag_o_reg    <= '0';
			Zflag_o_reg    <= '0';
			Vflag_o_reg    <= '0';
		elsif (rising_edge(clk) and ena = '1') then
			Y_i_reg        	<=Y      ;
			X_i_reg        	<=X      ;
			ALUFN_i_reg   		<=ALUFN  ;
			ALUout_o_reg  	<=ALUout_o ;
			Nflag_o_reg  		<=Nflag_o  ;
			Cflag_o_reg  		<=Cflag_o  ;
			Zflag_o_reg  		<=Zflag_o  ;
			Vflag_o_reg  		<=Vflag_o  ;
		end if;
	end process;
	Y_i <= Y_i_reg;
	X_i <= X_i_reg;
	ALUFN_i <= ALUFN_i_reg;
	Zflag   <= Zflag_o_reg;  
	Cflag   <= Cflag_o_reg;  
	Nflag   <= Nflag_o_reg;  
	Vflag   <= Vflag_o_reg;  

	ALUout  <= ALUout_o_reg; 
end architecture;