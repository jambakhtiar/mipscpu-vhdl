LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY  unsigned_division IS
	PORT(	DIVCLK		 	: IN 	STD_LOGIC;
			RST		 	: IN 	STD_LOGIC;
			EN		 	: IN 	STD_LOGIC;
			address		 	: IN 	STD_LOGIC_VECTOR( 6 DOWNTO 0 ); -- a11, a5 downto a0
			DataBus		 	: INOUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			MemRead 		: IN 	STD_LOGIC;
			MemWrite 		: IN 	STD_LOGIC;
			DIVIFG 		: OUT 	STD_LOGIC
			);
END unsigned_division;

ARCHITECTURE behavior OF unsigned_division IS

	COMPONENT BidirPin
		GENERIC( WIDTH: INTEGER:=16 );
		PORT(   Dout: 	IN 		STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
				en:		IN 		STD_LOGIC;
				Din:	OUT		STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
				IOpin: 	INOUT 	STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0)
		);
	END COMPONENT;

	
	COMPONENT Divider
    port (
        clk        : in std_logic;
        reset      : in std_logic;
        start      : in std_logic;
        dividend   : in std_logic_vector(31 downto 0);
        divisor    : in std_logic_vector(31 downto 0);
        quotient   : out std_logic_vector(31 downto 0);
        remainder  : out std_logic_vector(31 downto 0);
        done       : out std_logic
    );
end COMPONENT;


  SIGNAL CS			 		: STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL Dout	, Din			: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	--SIGNAL en					: STD_LOGIC;

	
	SIGNAL DIVIDEND_reg			: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL DIVISOR_reg		    : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL RESIDUE_reg           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL QUOTIENT_reg           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );

    SIGNAL Dout_DIVIDEND           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Dout_DIVISOR           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Dout_RESIDUE          : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Dout_QUOTIENT          : STD_LOGIC_VECTOR( 31 DOWNTO 0 );

    SIGNAL Din_DIVIDEND            : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Din_DIVISOR            : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Din_RESIDUE           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Din_QUOTIENT           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	
	SIGNAL EN_DIVISOR_W, EN_DIVIDEND_W, EN_RESIDUE_W, EN_QUOTIENT_W		: STD_LOGIC;
	SIGNAL EN_DIVISOR_R, EN_DIVIDEND_R, EN_RESIDUE_R, EN_QUOTIENT_R		: STD_LOGIC;
	
BEGIN
	
	BiDirPin_DIVIDEND: BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> Dout_DIVIDEND, --bus input
				en				=> EN_DIVIDEND_W, --enable input
				Din			=> Din_DIVIDEND, --data output
				IOpin 		=> DataBUS ); --databus
	
BiDirPin_DIVISOR : BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> Dout_DIVISOR , --bus input
				en				=> EN_DIVISOR_W, --enable input
				Din			=> Din_DIVISOR , --data output
				IOpin 		=> DataBUS ); --databus


BiDirPin_QUOTIENT: BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> QUOTIENT_reg,--,--Dout_QUOTIENT, --bus input
				en				=> EN_QUOTIENT_R, --enable input
				Din			=> Dout_QUOTIENT,--Din_QUOTIENT, --data output
				IOpin 		=> DataBUS ); --databus
	
	BiDirPin_RESIDUE: BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> RESIDUE_reg,--Dout_RESIDUE, --bus input
				en				=> EN_RESIDUE_R, --enable input
				Din			=> Dout_RESIDUE,--Din_RESIDUE, --data output
				IOpin 		=> DataBUS ); --databus
	

	Division: Divider
    port map(
        clk        => DIVCLK,
        reset      => RST,
        start      => EN,
        dividend   => DIVIDEND_reg,
        divisor    => DIVISOR_reg,
        quotient   => Din_QUOTIENT,
        remainder  => Din_RESIDUE,
        done       => DIVIFG
    );
	
   Dout_DIVIDEND <= DIVIDEND_reg;
	Dout_DIVISOR  <= DIVISOR_reg;
	--Dout_QUOTIENT <= QUOTIENT_reg;
	--Dout_RESIDUE <= RESIDUE_reg;
	
	
	EN_DIVIDEND_W <= MemWrite AND CS(0);
	EN_DIVISOR_W <= MemWrite AND CS(1);
	--EN_QUOTIENT_W <= MemWrite AND CS(2);
	--EN_RESIDUE_W <= MemWrite AND CS(3);
	
	
	--EN_DIVIDEND_R <= MemRead AND CS(0);
	--EN_DIVISOR_R <= MemRead AND CS(1);
	EN_QUOTIENT_R <= MemRead AND CS(2);
	EN_RESIDUE_R <= MemRead AND CS(3);

	
	
	WITH address SELECT
	CS <= "0001" WHEN "1101100",  --0x82C  ----- ICaddress 	<= address(11) & address(5 DOWNTO 0);
		   "0010" WHEN "1110000", --0x830
         "0100" WHEN "1110100", --0x834
		   "1000" WHEN "1111000", --0x838
		   "0000" WHEN OTHERS;
	
	
-------------------------------------write to registers---------------------------------------------------------------------------------
	PROCESS (RST, DIVCLK, EN_DIVIDEND_W)
	BEGIN
		IF RST = '1' THEN
			DIVIDEND_reg <= X"00000000";
		ELSIF ( DIVCLK'EVENT ) AND ( DIVCLK = '1' ) THEN
					IF EN_DIVIDEND_W = '1' THEN
				DIVIDEND_reg <= Din_DIVIDEND;
			END IF;
		END IF;
	END PROCESS;--write to registerswrite to registers
	
	
	PROCESS (RST, DIVCLK, EN_DIVISOR_W)
	BEGIN
		IF RST = '1' THEN
			DIVISOR_reg <= X"00000000";
		ELSIF ( DIVCLK'EVENT ) AND ( DIVCLK = '1' ) THEN
					IF EN_DIVISOR_W = '1' THEN
				DIVISOR_reg <= Din_DIVISOR;
			END IF;
		END IF;
	END PROCESS;--write to registerswrite to registers
	
	PROCESS (RST, DIVCLK, EN_QUOTIENT_R)
	BEGIN
		IF RST = '1' THEN
			QUOTIENT_reg <= X"00000000";
		ELSIF ( DIVCLK'EVENT ) AND ( DIVCLK = '1' ) THEN
					IF EN_QUOTIENT_R = '1' THEN
				QUOTIENT_reg <= Din_QUOTIENT;
			END IF;
		END IF;
	END PROCESS;--write to registerswrite to registers
	
	
	PROCESS (RST, DIVCLK, EN_RESIDUE_R)
	BEGIN
		IF RST = '1' THEN
			RESIDUE_reg <= X"00000000";
		ELSIF ( DIVCLK'EVENT ) AND ( DIVCLK = '1' ) THEN
					IF EN_RESIDUE_R = '1' THEN
				RESIDUE_reg <= Din_RESIDUE;
			END IF;
		END IF;
	END PROCESS;--write to registerswrite to registers
	
	
END behavior;