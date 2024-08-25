LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;
--------- System ALU  ---------------
-- Supports SHR and SHL according dir bit (dir = '1' - SHR; dir = '0' - SHL)
-- Input - Two n-bit vectors, X and Y and ALUFN of 5 bits
-- Output - Zero Flag, Carry Flag, Negative Flag, ALU result
-------------------------------------
ENTITY ALU IS
  GENERIC (n : INTEGER := 8;
		   k : integer := 3;   -- k=log2(n)
		   m : integer := 4	); -- m=2^(k-1)
  PORT 
  (  
	Y_i,X_i: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		  ALUFN_i : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		  ALUout_o: OUT STD_LOGIC_VECTOR(n-1 downto 0);
		  Nflag_o,Cflag_o,Zflag_o: OUT STD_LOGIC
  ); 
END ALU;
------------- complete the top Architecture code --------------
ARCHITECTURE struct OF ALU IS 
	SIGNAL coutAddSub, coutShifter : std_logic;
	--SIGNAL cout_vec: std_logic_vector(2 DOWNTO 0);
	-- Signals For Sub-Modules Output
	SIGNAL AddSub_out, Shifter_out, Logic_out : std_logic_vector(n-1 downto 0);
	SIGNAL AddSub_X, AddSub_Y, Logic_X, Logic_Y, Shifter_X, Shifter_Y : std_logic_vector(n-1 DOWNTO 0);
	--SIGNAL ALU_FN : std_logic_vector(2 DOWNTO 0);
	SIGNAL ALUout : std_logic_vector(n-1 downto 0); 
	SIGNAL zero_vec : std_logic_vector(n-1 downto 0);
BEGIN
-- Init Zero Vector
zero: for i in 0 to n-1 generate
	zero_vec(i) <= '0';
	end generate;
	
	-------------------Module Input Binding-----------------------------
	AddSub_X <= X_i 					WHEN ALUFN_i(4 DOWNTO 3) = "01" ELSE zero_vec;
	AddSub_Y <= Y_i 					WHEN ALUFN_i(4 DOWNTO 3) = "01" ELSE zero_vec;
	
	Logic_X <= X_i 						WHEN ALUFN_i(4 DOWNTO 3) = "11" ELSE zero_vec;
	Logic_Y <= Y_i 						WHEN ALUFN_i(4 DOWNTO 3) = "11" ELSE zero_vec;

	Shifter_X <= X_i					WHEN ALUFN_i(4 DOWNTO 3) = "10" ELSE zero_vec;
	Shifter_Y <= Y_i 					WHEN ALUFN_i(4 DOWNTO 3) = "10" ELSE zero_vec;

	-----------------------------------------------------------

	AddSubModule	: AdderSub 	GENERIC MAP(n)	 PORT MAP(AddSub_X, AddSub_Y, ALUFN_i(2 DOWNTO 0), coutAddSub, AddSub_out); 	-- AdderSub
	LogicModule		: Logic		GENERIC MAP(n)	 PORT MAP(Logic_X, Logic_Y, ALUFN_i(2 DOWNTO 0), Logic_out); 					-- Logic
	ShifterModule	: Shifter 	GENERIC MAP(n,k) PORT MAP(Shifter_X, Shifter_Y, ALUFN_i(2 DOWNTO 0), coutShifter, Shifter_out);	-- Shifter

	
	WITH ALUFN_i(4 DOWNTO 3) select
		ALUout <= 	AddSub_out  WHEN "01", -- AdderSub
					Logic_out   WHEN "11", -- Logic
					Shifter_out WHEN "10", -- Shifter
					unaffected    when others;
						
	WITH ALUFN_i(4 DOWNTO 3) select				
		Cflag_o <= 	coutAddSub WHEN "01", -- AdderSub
					'0'			WHEN "11", -- Logic
					coutShifter WHEN "10", -- Shifter
					unaffected when others; 
	                                                     
	Nflag_o <= ALUout(n-1);   --Check MSB of the result 
	Zflag_o <= '1' WHEN (ALUout = zero_vec) ELSE -- Compare with zero vector
			   '0';
	ALUout_o <= ALUout; 
	
			 
END struct;

