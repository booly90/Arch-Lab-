
library IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE work.aux_package.ALL;
----------------------------------
ENTITY GPO IS
	GENERIC (	useSevenSeg: BOOLEAN :=TRUE;
				IOWidth	: INTEGER := 7); -- 7 WHEN HEX, 8 WHEN LEDs
	PORT( 
		MemRead			: IN	STD_LOGIC;
		reset			: IN 	STD_LOGIC;
		MemWrite		: IN	STD_LOGIC;
		ChipSelect		: IN 	STD_LOGIC;
		Data			: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		GPOutput		: OUT	STD_LOGIC_VECTOR(IOWidth-1 DOWNTO 0)
		);
END GPO;
----------------------------
ARCHITECTURE structure OF GPO IS
	SIGNAL Latch_IO	: STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	
	PROCESS(ChipSelect,MemWrite)
	BEGIN
	IF (reset = '1') THEN
		Latch_IO	<= X"00";
	ELSE
		IF (MemWrite = '1' AND ChipSelect = '1') THEN
			Latch_IO <= Data;
		END IF;
	END IF;
	END PROCESS;
	
	---

	-- read bus Tri-State controller
	Data	<=	Latch_IO WHEN (MemRead = '1' AND ChipSelect = '1') 	ELSE (others => 'Z'); 

	
	-- for HEX Outputs
	SEG: 
		IF (useSevenSeg = TRUE) GENERATE
			segDecoder: 	segDecoder
							PORT MAP(	data	=> Latch_IO(3 DOWNTO 0),
										seg		=> GPOutput);
		END GENERATE SEG;
	
	-- for LEDSx Outputs
	NO_SEG:
		IF (useSevenSeg = FALSE) GENERATE
			GPOutput <= Latch_IO;
		END GENERATE NO_SEG;
	
END structure;