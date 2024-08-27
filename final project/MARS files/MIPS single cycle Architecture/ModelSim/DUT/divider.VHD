library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Unsigned_Binary_Divider is
    Port (
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        ENA : in STD_LOGIC;
        DIVCLK : in STD_LOGIC;
        DIVIDEND : in STD_LOGIC_VECTOR(31 downto 0);
        DIVISOR : in STD_LOGIC_VECTOR(31 downto 0);
        QUOTIENT : out STD_LOGIC_VECTOR(31 downto 0);
        RESIDUE : out STD_LOGIC_VECTOR(31 downto 0);
        DIVIFG : out STD_LOGIC
    );
end Unsigned_Binary_Divider;

architecture Behavioral of Unsigned_Binary_Divider is
    signal Dividend_Reg : STD_LOGIC_VECTOR(63 downto 0); -- 64-bit register to hold shifted Dividend
    signal Divisor_Reg : STD_LOGIC_VECTOR(31 downto 0);
    signal Quotient_Reg : STD_LOGIC_VECTOR(31 downto 0);
    signal Residue_Reg : STD_LOGIC_VECTOR(31 downto 0);
    signal Sub_Result : STD_LOGIC_VECTOR(31 downto 0);
    signal Counter : integer range 0 to 32 := 0;
    signal Done : STD_LOGIC := '0';

    type state_type is (Idle, Load, Subtract, Shift, Done_State);
    signal State : state_type := Idle;
    
begin

    process(CLK, RST)
    begin
        if RST = '1' then
            State <= Idle;
            Dividend_Reg <= (others => '0');
            Divisor_Reg <= (others => '0');
            Quotient_Reg <= (others => '0');
            Residue_Reg <= (others => '0');
            Counter <= 0;
            Done <= '0';
        elsif rising_edge(CLK) then
            case State is
                when Idle =>
                    if ENA = '1' then
                        State <= Load;
                    end if;

                when Load =>
                    Dividend_Reg(63 downto 32) <= DIVIDEND;  -- Load Dividend
                    Divisor_Reg <= DIVISOR;                  -- Load Divisor
                    Quotient_Reg <= (others => '0');         -- Reset Quotient
                    Residue_Reg <= (others => '0');          -- Reset Residue
                    Counter <= 32;                           -- Set Counter for 32 bits
                    State <= Subtract;

                when Subtract =>
                    -- Perform subtraction
                    if Dividend_Reg(63 downto 32) >= Divisor_Reg then
                        Sub_Result <= Dividend_Reg(63 downto 32) - Divisor_Reg;
                        Dividend_Reg(63 downto 32) <= Sub_Result;
                        Quotient_Reg(Counter-1) <= '1';
                    else
                        Quotient_Reg(Counter-1) <= '0';
                    end if;
                    State <= Shift;

                when Shift =>
                    -- Shift the Dividend Register left by 1
                    Dividend_Reg <= Dividend_Reg(62 downto 0) & '0';
                    Counter <= Counter - 1;
                    if Counter = 0 then
                        State <= Done_State;
                    else
                        State <= Subtract;
                    end if;

                when Done_State =>
                    Residue_Reg <= Dividend_Reg(63 downto 32);  -- The Residue is the remaining Dividend
                    Done <= '1';
                    State <= Idle;

                when others =>
                    State <= Idle;
            end case;
        end if;
    end process;

    -- Output assignments
    QUOTIENT <= Quotient_Reg;
    RESIDUE <= Residue_Reg;
    DIVIFG <= Done;  -- Set DIVIFG when done
end Behavioral;
