library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tb_addr_decoder is
end tb_addr_decoder;

architecture Behavioral of tb_addr_decoder is
    -- Component Declaration for the Unit Under Test (UUT)
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
    
    -- Signal declarations to connect to UUT
    signal address          : std_logic_vector(11 downto 0) := (others => '0');
    signal data_memory_cs   : std_logic;
    signal LEDS_cs      : std_logic;
    signal Hex0_cs      : std_logic;
    signal Hex1_cs      : std_logic;
    signal Hex2_cs      : std_logic;
    signal Hex3_cs      : std_logic;
    signal Hex4_cs      : std_logic;
    signal Hex5_cs      : std_logic;
    signal switches_cs  : std_logic;
    signal button_cs    : std_logic;
    signal UCTL_cs      : std_logic;
    signal RXBF_cs      : std_logic;
    signal TXBF_cs      : std_logic;
    signal BTCTL_cs     : std_logic;
    signal BTCNT_cs     : std_logic;
    signal BTCCR0_cs    : std_logic;
    signal BTCCR1_cs    : std_logic;
    signal Dividend_cs  : std_logic;
    signal Divisor_cs   : std_logic;
    signal Quotient_cs  : std_logic;
    signal Residue_cs   : std_logic;
    signal IE_cs        : std_logic;
    signal IFG_cs       : std_logic;
    signal Type_cs      : std_logic;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: addr_decoder
        Port map (
            address          => address,
            data_memory_cs   => data_memory_cs,
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

    -- Test process
    stimulus: process
    begin
        -- Test case 1: Address in data memory range (x"000" to x"7FC")
        address <= x"000";
        wait for 10 ns;
        assert (data_memory_cs = '1') report "Test case 1 failed" severity error;
        
        address <= x"7FC";
        wait for 10 ns;
        assert (data_memory_cs = '1') report "Test case 1 failed" severity error;

        -- Test case 2: Address in LED range
        address <= x"800";
        wait for 10 ns;
        assert (LEDS_cs = '1') report "Test case 2 failed" severity error;

        -- Test case 3: Address in Hex0 range
        address <= x"804";
        wait for 10 ns;
        assert (Hex0_cs = '1') report "Test case 3 failed" severity error;

        -- Test case 4: Address in Hex1 range
        address <= x"805";
        wait for 10 ns;
        assert (Hex1_cs = '1') report "Test case 4 failed" severity error;

        -- Test case 5: Address in switches range
        address <= x"810";
        wait for 10 ns;
        assert (switches_cs = '1') report "Test case 5 failed" severity error;

        -- Test case 6: Address in button range
        address <= x"814";
        wait for 10 ns;
        assert (button_cs = '1') report "Test case 6 failed" severity error;

        -- Test case 7: Address in UCTL range
        address <= x"818";
        wait for 10 ns;
        assert (UCTL_cs = '1') report "Test case 7 failed" severity error;

        -- Test case 8: Address out of all defined ranges
        address <= x"FFF";
        wait for 10 ns;
        assert (data_memory_cs = '0' and LEDS_cs = '0' and Hex0_cs = '0' and 
                Hex1_cs = '0' and switches_cs = '0' and button_cs = '0' and
                UCTL_cs = '0') report "Test case 8 failed" severity error;

        wait;
    end process;

end Behavioral;
