LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

ENTITY  USART IS
	PORT(	CLK		 	: IN 	STD_LOGIC;
			RST		 	: IN 	STD_LOGIC;
			address		 	: IN 	STD_LOGIC_VECTOR( 6 DOWNTO 0 ); -- a11, a5 downto a0
			DataBus		 	: INOUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
			MemRead 		: IN 	STD_LOGIC;
			MemWrite 		: IN 	STD_LOGIC;
		 -- UART INTERFACE
        UART_TXD    : out std_logic; -- serial transmit data
        UART_RXD    : in  std_logic; -- serial receive data
		  TXIFG 		: out 	STD_LOGIC;
		  RXIFG 		: out	STD_LOGIC;
		  RXError 		: out	STD_LOGIC
			);
END USART;

ARCHITECTURE behavior OF USART IS

	COMPONENT BidirPin
		GENERIC( WIDTH: INTEGER:=16 );
		PORT(   Dout: 	IN 		STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
				en:		IN 		STD_LOGIC;
				Din:	OUT		STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0);
				IOpin: 	INOUT 	STD_LOGIC_VECTOR(WIDTH-1 DOWNTO 0)
		);
	END COMPONENT;

	
	COMPONENT UART
    Generic (
        CLK_FREQ      : integer := 50e6;   -- system clock frequency in Hz
        BAUD_RATE     : integer := 115200; -- baud rate value
        PARITY_BIT    : string  := "none"; -- type of parity: "none", "even", "odd", "mark", "space"
        USE_DEBOUNCER : boolean := True    -- enable/disable debouncer
    );
    Port (
        -- CLOCK AND RESET
        CLK         : in  std_logic; -- system clock
        RST         : in  std_logic; -- high active synchronous reset
        -- UART INTERFACE
        UART_TXD    : out std_logic; -- serial transmit data
        UART_RXD    : in  std_logic; -- serial receive data
        -- USER DATA INPUT INTERFACE
        DIN         : in  std_logic_vector(7 downto 0); -- input data to be transmitted over UART
        DIN_VLD     : in  std_logic; -- when DIN_VLD = 1, input data (DIN) are valid
        DIN_RDY     : out std_logic; -- when DIN_RDY = 1, transmitter is ready and valid input data will be accepted for transmiting
        -- USER DATA OUTPUT INTERFACE
        DOUT        : out std_logic_vector(7 downto 0); -- output data received via UART
        DOUT_VLD    : out std_logic; -- when DOUT_VLD = 1, output data (DOUT) are valid (is assert only for one clock cycle)
        FRAME_ERROR : out std_logic  -- when FRAME_ERROR = 1, stop bit was invalid (is assert only for one clock cycle)
    );
end COMPONENT;


  SIGNAL CS			 		: STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL Dout	, Din			: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	--SIGNAL en					: STD_LOGIC;

	SIGNAL UCTL_reg			: STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	SIGNAL RXBF_reg		    : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL TXBF_reg           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );

    SIGNAL Dout_UCTL           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Dout_RXBF           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Dout_TXBF          : STD_LOGIC_VECTOR( 31 DOWNTO 0 );

    SIGNAL Din_UCTL            : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Din_RXBF            : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
    SIGNAL Din_TXBF           : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
	
	SIGNAL EN_UCTL_W, EN_RXBF_W, EN_TXBF_W		: STD_LOGIC;
	SIGNAL EN_UCTL_R, EN_RXBF_R, EN_TXBF_R		: STD_LOGIC;
	
BEGIN
	
	BiDirPin_UCTL: BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> Dout_UCTL, --bus input
				en				=> EN_UCTL_W, --enable input
				Din			=> Din_UCTL, --data output
				IOpin 		=> DataBUS ); --databus
	
BiDirPin_RXBF : BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> Dout_RXBF , --bus input
				en				=> EN_RXBF_W, --enable input
				Din			=> Din_RXBF , --data output
				IOpin 		=> DataBUS ); --databus

BiDirPin_TXBF: BidirPin
	GENERIC MAP ( 32 )
	PORT MAP (	Dout 		=> Dout_TXBF,--Dout_RESIDUE, --bus input
				en				=> EN_TXBF_R, --enable input
				Din			=> Din_TXBF,--Din_RESIDUE, --data output
				IOpin 		=> DataBUS ); --databus

RxTx: UART
    Generic map(
        CLK_FREQ  => 50e6,   -- system clock frequency in Hz
        BAUD_RATE =>  (115200), -- baud rate value
        PARITY_BIT =>   ("none"), -- type of parity: "none", "even", "odd", "mark", "space"
        USE_DEBOUNCER => (True)    -- enable/disable debouncer
    )
    Port map(
        -- CLOCK AND RESET
        CLK        => CLK,-- system clock
        RST        => RST, -- high active synchronous reset
        -- UART INTERFACE
        UART_TXD    => UART_TXD,-- serial transmit data
        UART_RXD    => UART_RXD,-- serial receive data
        -- USER DATA INPUT INTERFACE
        DIN         => Din_TXBF(7 downto 0),--: in  std_logic_vector(7 downto 0); -- input data to be transmitted over UART
        DIN_VLD     => EN_TXBF_W,-- when DIN_VLD = 1, input data (DIN) are valid
        DIN_RDY     => TXIFG,-- when DIN_RDY = 1, transmitter is ready and valid input data will be accepted for transmiting
        -- USER DATA OUTPUT INTERFACE
        DOUT        => Dout_RXBF(7 downto 0),-- out std_logic_vector(7 downto 0); -- output data received via UART
        DOUT_VLD    => RXIFG, --std_logic; -- when DOUT_VLD = 1, output data (DOUT) are valid (is assert only for one clock cycle)
        FRAME_ERROR => RXError --std_logic  -- when FRAME_ERROR = 1, stop bit was invalid (is assert only for one clock cycle)
    );
	
   Dout_UCTL <=  UCTL_reg;
	--Dout_RXBF  <= RXBF_reg;
	Dout_TXBF <=  TXBF_reg;
	
	EN_UCTL_W <= MemWrite AND CS(0); 
	--EN_RXBF_W <= MemWrite AND CS(1); 
	EN_TXBF_W <= MemWrite AND CS(2);
	
   --EN_UCTL_R <= MemRead AND CS(0); 
	EN_RXBF_R <= MemRead AND CS(1); 
	--EN_TXBF_R <= MemRead AND CS(2);

	WITH address SELECT
	CS <= "0001" WHEN "1011000",  --0x818  ----- ICaddress 	<= address(11) & address(5 DOWNTO 0);
		   "0010" WHEN "1011001", --0x819
         "0100" WHEN "1011010", --0x81A
		   "0000" WHEN OTHERS;
	
-------------------------------------write to registers---------------------------------------------------------------------------------
	PROCESS (RST, CLK, EN_UCTL_W)
	BEGIN
		IF RST = '1' THEN
			UCTL_reg <= X"00000000";
		ELSIF ( CLK'EVENT ) AND ( CLK = '1' ) THEN
					IF EN_UCTL_W = '1' THEN
				UCTL_reg <= Din_UCTL;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (RST, CLK, EN_RXBF_W)
	BEGIN
		IF RST = '1' THEN
			RXBF_reg <= X"00000000";
		ELSIF ( CLK'EVENT ) AND ( CLK = '1' ) THEN
					IF EN_RXBF_W = '1' THEN
				RXBF_reg <= Din_RXBF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS (RST, CLK, EN_TXBF_W)
	BEGIN
		IF RST = '1' THEN
			TXBF_reg <= X"00000000";
		ELSIF ( CLK'EVENT ) AND ( CLK = '1' ) THEN
					IF EN_TXBF_W = '1' THEN
				TXBF_reg <= Din_TXBF;
			END IF;
		END IF;
	END PROCESS;

END behavior;