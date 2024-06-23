LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;
------------------------- ALU MODULE
-- Module for ALU functions
-- Supports addition, subtraction and Getting Negative of a number
-- Outputs Zero, Carry, Negative flags when needed
--------ALU Entity---------------------------
ENTITY ALU IS
  GENERIC (BusSize : INTEGER := 16;
			k	: INTEGER := 4);
  PORT ( A,B	  				  : IN STD_LOGIC_VECTOR (BusSize-1 DOWNTO 0);
		 OPC 					  : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
         CFlag, Zflag, Nflag	  :	OUT STD_LOGIC;
         C		  				  :	OUT STD_LOGIC_VECTOR(BusSize-1 downto 0));
END ALU;
---------ALU Architecture--------------------
ARCHITECTURE dfl OF ALU IS
	SIGNAL reg : std_logic_vector(BusSize-1 DOWNTO 0) := (others => '0');
	SIGNAL A_temp, B_temp: std_logic_vector(BusSize-1 DOWNTO 0);
	SIGNAL cin : std_logic;
	SIGNAL S_out : std_logic_vector(BusSize-1 DOWNTO 0) := (others => '0');
	--- SHL
	SUBTYPE vector IS std_logic_vector (BusSize-1 DOWNTO 0);
	TYPE matrix IS ARRAY (k DOWNTO 0) OF vector;
	SIGNAL mat		: matrix; -- Store each shift step vector
	SIGNAL carry : std_logic_vector(k-1 DOWNTO 0) := (others => '0');
	signal res : std_logic_vector(BusSize-1 DOWNTO 0) := (others => '0');
	---
	constant zero_vec : std_logic_vector(BusSize-1 downto 0) := (others => '0');
BEGIN


	------------------- SHL ---------------------------------------------------
	
	-- Init shifted vector according the direction 
	init : for i in 0 to BusSize-1 generate
		mat(0)(i) <= A(i) 	WHEN OPC = "0011" ELSE unaffected;
	end generate;
	
	shift: for step in 1 to k generate
		-- ADD ZEROS TO START IF SHIFT NEEDED
		mat(step)(2**(step-1) - 1 DOWNTO 0) <= mat(step-1)(2**(step-1) - 1 DOWNTO 0)	WHEN B(step-1)='0' ELSE
										   (OTHERS => '0') 					 			WHEN B(step-1)='1';
		-- SHIFT IF NEEDED otherwise DONT CHANGE
		mat(step)(BusSize-1 DOWNTO 2**(step-1)) <= mat(step-1)(BusSize-1 DOWNTO 2**(step-1))	WHEN B(step-1)='0' ELSE
											 mat(step-1)(BusSize-1-2**(step-1) DOWNTO 0)	WHEN B(step-1)='1';
	end generate;
	
	-- Take Last row of matrix. If Dir=1(SHR), inverse the result
	inv	: for i in 0 to BusSize-1 generate
		res(i) <= mat(k)(i)	 	WHEN OPC = "0011" ELSE unaffected;
	end generate;
	
	-----------------Carry Out-------------------------
	--	At the start take the lsb of the vector if first shift performed.
	carry(0) <= mat(0)(BusSize-1) WHEN B(0) = '1' ELSE
				'0' 		WHEN B(0) = '0';
	-- Take BusSize-1-2**(step-1)	position value of the shifted vector if shift was performed in the corresponding step.
	carry_out : for step in 1 to k-1 generate
		carry(step) <= mat(step)(BusSize-1-2**(step-1))	WHEN B(step) = '1' ELSE
					   carry(step-1) 				WHEN B(step) = '0';
	end generate;
	
	
	---------------------------------------------------------------

	-- carry in should be LSB of OPC
	cin <= '1' WHEN (OPC = "0001") ELSE '0';
	
	-- For NEG - Make A zero vector
	A_temp <= 	(OTHERS => '0') WHEN (OPC = "0011") ELSE A;
	
	-- B_tmp - OPC(0) = 0 - make sum; OPC(0) = 1 - make subtraction
	-- For subtraction, need xor with '1'
	B_tmp  : for i in 0 to BusSize-1 generate
		B_temp(i) <= (B(i) xor '1')			WHEN (OPC = "0001" or OPC = "0011") ELSE  
					  B(i);
	end generate;
	
	-- First FA operation to ALU
	first: FA port map(A_temp(0), B_temp(0), cin, S_out(0), reg(0));
	
	-- Make the rest of the FA operations
	rest : for i in 1 to BusSize-1 generate
		chain : FA port map(A_temp(i), B_temp(i), reg(i-1), S_out(i), reg(i));
	end generate;
	
	-- Take care of Flags only when the alu does an operation otherwise the flags stays unaffected
	CFlag <= reg(BusSize-1) when (OPC = "0000" or OPC = "0001") else
			 carry(k-1) 	WHEN (OPC = "0011") else
			unaffected; -- Get carry of the last FA ;
			
	Nflag <= unaffected when (OPC = "1111" or OPC = "0010") else S_out(BusSize-1);   --Check MSB of the result 
	Zflag <= unaffected when (OPC = "1111" or OPC = "0010") else 
			'1' WHEN (S_out = zero_vec) ELSE '0'; -- Compare with zero vector  
	-- Sum to ALU output
	C <=	res when OPC = "0011" else
			S_out;

END dfl;