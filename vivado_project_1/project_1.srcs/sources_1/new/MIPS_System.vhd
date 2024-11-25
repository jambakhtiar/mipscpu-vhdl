----------------------------------------------------------------------------------

-- Module Name:   MIPS_System = TOP - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MIPS_System is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           SW     : in std_logic_vector(7 downto 0);
           KEYs   : in std_logic_vector(3 downto 1);
           LEDR_o : out  STD_LOGIC_vector(7 downto 0);
           HEX0 : out  STD_LOGIC_vector(7 downto 0);
           HEX1 : out  STD_LOGIC_vector(7 downto 0);
           HEX2 : out  STD_LOGIC_vector(7 downto 0);
           HEX3 : out  STD_LOGIC_vector(7 downto 0);
           HEX4 : out  STD_LOGIC_vector(7 downto 0);
           HEX5 : out  STD_LOGIC_vector(7 downto 0);
           PWMout : out std_logic
           );
end MIPS_System;

architecture Behavioral of MIPS_System is

---- mips
COMPONENT MIPS
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		readdata : IN std_logic_vector(31 downto 0);          
		MemWrite : OUT std_logic;
		WriteData : OUT std_logic_vector(31 downto 0);
		address : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;	
	
--address decoder
    component addr_decoder is
        Port ( 
               address          : in  STD_LOGIC_VECTOR (11 downto 0);
               data_memory_cs   : out std_logic;
               LEDS_cs      : out std_logic;
               Hex0_cs      : out std_logic;
               Hex1_cs      : out std_logic;
               Hex2_cs      : out std_logic;
               Hex3_cs      : out std_logic;
               Hex4_cs      : out std_logic;
               Hex5_cs      : out std_logic;
               switches_cs  : out std_logic;
               button_cs    : out std_logic;
               UCTL_cs      : out std_logic;
               RXBF_cs      : out std_logic;
               TXBF_cs      : out std_logic;
               BTCTL_cs     : out std_logic;
               BTCNT_cs     : out std_logic;
               BTCCR0_cs    : out std_logic;
               BTCCR1_cs    : out std_logic;
               Dividend_cs  : out std_logic;
               Divisor_cs   : out std_logic;
               Quotient_cs  : out std_logic;
               Residue_cs   : out std_logic;
               IE_cs        : out std_logic;
               IFG_cs       : out std_logic;
               Type_cs      : out std_logic           
               );
    end component;	
	
--data cache memory
COMPONENT data_memory
    port (
        clk   : in  std_logic;
        CS   : in  std_logic;  -- Memory select signal from address decoder
        we    : in  std_logic;  -- Write enable
        addr  : in  std_logic_vector(11 downto 0);  -- 11-bit address for 2KB memory
        din   : in  std_logic_vector(31 downto 0);  -- Data input (for write operations)
        dout  : out std_logic_vector(31 downto 0)  -- Data output (for read operations)
    );
   END COMPONENT; 

--LEDs output component    
 COMPONENT LEDR
      Port ( 
        CS : in std_logic;
        MemRead: in std_logic;
        MemWrite : in std_logic; --MemWrite
        din : in std_logic_vector(7 downto 0); --from mips
        LEDs: out std_logic_vector(7 downto 0)
      );
end COMPONENT;   
  
--HEX display compoent
COMPONENT HEX
      Port ( 
        CS : in std_logic;
        MemRead: in std_logic;
        MemWrite : in std_logic; --MemWrite
        din : in std_logic_vector(7 downto 0); --from mips
        HEXout: out std_logic_vector(7 downto 0)
      );
end COMPONENT;  
  
--switches
COMPONENT sw_module 
  Port (
        CS      : in std_logic;
        MemRead : in std_logic;
        SW      : in std_logic_vector(7 downto 0);
        sw_out  : out std_logic_vector(7 downto 0) --to processor
   );
end COMPONENT; 
 
component debouncer
    port (
        clk         : in  std_logic;  -- 50 MHz clock input
        reset     : in  std_logic;  -- Active-low reset
        button_in   : in  std_logic;  -- Raw button input
        button_out  : out std_logic   -- Debounced button output
    );
end component; 
 
 
 component Basic_Timer
    Port (
        clk              : in  std_logic;                     -- Clock input
        reset            : in  std_logic;                     -- Synchronous reset
        BTCTL_cs     : in std_logic;
        BTCNT_cs     : in std_logic;
        BTCCR0_cs    : in std_logic;
        BTCCR1_cs    : in std_logic;
        DataWrite   : in  std_logic_vector(31 downto 0); -- mips to basic timer
        Set_BTIFG : out std_logic;
        PWMout   : out std_logic
    );
end component;
  
 
 ------------- Internal signal -------------------------------------
 
 
---MIPS Internal signals
signal Readdata :  std_logic_vector(31 downto 0);    --in: io to mips        
signal MemWrite :  std_logic;                       --out: mips to io
signal WriteData : std_logic_vector(31 downto 0);  --out: mips to io
signal address :  std_logic_vector(31 downto 0);     -- out: mips to io
    
--address decoder internal signals
--signal address : STD_LOGIC_VECTOR (11 downto 0);
signal data_memory_cs   :  std_logic;
signal LEDS_cs      :  std_logic;
signal Hex0_cs      : std_logic;
signal Hex1_cs      :  std_logic;
signal Hex2_cs      :  std_logic;
signal Hex3_cs      :  std_logic;
signal Hex4_cs      :  std_logic;
signal Hex5_cs      :  std_logic;
signal switches_cs  :  std_logic;
signal button_cs    :  std_logic;
signal UCTL_cs      :  std_logic;
signal RXBF_cs      :  std_logic;
signal TXBF_cs      :  std_logic;
signal BTCTL_cs     :  std_logic;
signal BTCNT_cs     :  std_logic;
signal BTCCR0_cs    :  std_logic;
signal BTCCR1_cs    :  std_logic;
signal Dividend_cs  :  std_logic;
signal Divisor_cs   :  std_logic;
signal Quotient_cs  :  std_logic;
signal Residue_cs   :  std_logic;
signal IE_cs        :  std_logic;
signal IFG_cs       :  std_logic;
signal Type_cs      :  std_logic;      
    
    
signal MemRead_i: std_logic;

signal Readdata_dm: std_logic_vector(31 downto 0);
signal Readdata_sw: std_logic_vector(7 downto 0);

--keys internal signals
signal key1: std_logic;
signal key2: std_logic;
signal key3: std_logic;


-- Basic timer signal
signal Set_BTIFG : std_logic;
--------------------------- End of Internal signal declarations --------------
  
begin
MemRead_i <= not MemWrite;

--- mips
MIPS_Inst: MIPS PORT MAP(
		clk =>clk,
		reset => reset,
		readdata => Readdata,
		MemWrite => MemWrite,
		WriteData =>WriteData,
		address => address
	);
	
-- address decoder	
addr_dec_ins: addr_decoder Port map( 
               address         => address(11 downto 0),
               data_memory_cs  => data_memory_cs,
               LEDS_cs      => LEDS_cs,
               Hex0_cs      => Hex0_cs,
               Hex1_cs      => Hex1_cs,
               Hex2_cs      => Hex2_cs,
               Hex3_cs      => Hex3_cs,
               Hex4_cs      => Hex4_cs,
               Hex5_cs      => Hex5_cs,
               switches_cs  => switches_cs,
               button_cs    => button_cs,
               UCTL_cs      => UCTL_cs,
               RXBF_cs      => RXBF_cs,
               TXBF_cs      => TXBF_cs,
               BTCTL_cs     => BTCTL_cs,
               BTCNT_cs     => BTCNT_cs,
               BTCCR0_cs    => BTCCR0_cs,
               BTCCR1_cs    => BTCCR1_cs,
               Dividend_cs  => Dividend_cs,
               Divisor_cs   => Divisor_cs,
               Quotient_cs  => Quotient_cs,
               Residue_cs   => Residue_cs,
               IE_cs        => IE_cs,
               IFG_cs       => IFG_cs,
               Type_cs      => Type_cs         
               );

-- data memory
data_mem_ins: data_memory
    port map (
        clk   =>clk,
        CS   => data_memory_cs, -- Memory select signal from address decoder
        we   => MemWrite,   -- Write enable
        addr => address(11 downto 0),    -- 12-bit address for 2KB memory
        din  =>  WriteData,  -- mips to io
        dout =>  Readdata_dm  -- io to mips
    );
 
 ---LEDS   
LEDR_ins: LEDR
      Port map( 
        CS      => LEDS_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,
        din     => WriteData(7 downto 0), --from mips
        LEDs    => LEDR_o
      );    
    
--HEX0    
Hex0_ins: HEX Port map ( 
        CS  => Hex0_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX0
      );

Hex1_ins: HEX Port map ( 
        CS  => Hex1_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX1
      );
      
Hex2_ins: HEX Port map ( 
        CS  => Hex2_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX2
      );
Hex3_ins: HEX Port map ( 
        CS  => Hex3_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX3
      );
Hex4_ins: HEX Port map ( 
        CS  => Hex4_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX4
      );

Hex5_ins: HEX Port map ( 
        CS  => Hex5_cs,
        MemRead => MemRead_i,
        MemWrite => MemWrite,       --MemWrite
        din  => WriteData(7 downto 0),--from mips
        HEXout =>HEX5
      );

-- switches
sw_ins: sw_module Port map(
        CS      => switches_cs,
        MemRead => MemRead_i,
        SW      => SW,
        sw_out  => Readdata_sw--to processor
   );     

--debouncers for keys      
key1_debounced: debouncer port map(
        clk       => clk,  -- 50 MHz clock input
        reset     => reset, -- Active-low reset
        button_in   =>KEYs(1),  -- Raw button input
        button_out  =>key1   -- Debounced button output
    );

key2_debounced: debouncer port map(
        clk       => clk,  -- 50 MHz clock input
        reset     => reset, -- Active-low reset
        button_in   =>KEYs(2),  -- Raw button input
        button_out  =>key2   -- Debounced button output
    );

key3_debounced: debouncer port map(
        clk       => clk,  -- 50 MHz clock input
        reset     => reset, -- Active-low reset
        button_in   =>KEYs(3),  -- Raw button input
        button_out  =>key3   -- Debounced button output
    );


BT_ins: Basic_Timer Port map(
        clk         => clk,                    -- Clock input
        reset       => reset,                    -- Synchronous reset
        BTCTL_cs    => BTCTL_cs,
        BTCNT_cs    => BTCNT_cs,
        BTCCR0_cs   => BTCCR0_cs,
        BTCCR1_cs   => BTCCR1_cs,
        DataWrite   => WriteData,-- mips to basic timer
        Set_BTIFG   => Set_BTIFG,
        PWMout      => PWMout
    );


Readdata <= Readdata_dm when (data_memory_cs = '1') else
            (x"000000" & Readdata_sw) when (switches_cs = '1') else
            (x"0000000" & '0' & key3 & key2 & key1) when (button_cs = '1') else
            x"00000000";

 

end Behavioral;

