
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity addr_decoder is
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
end addr_decoder;

architecture Behavioral of addr_decoder is
begin
    process(address)
    begin
        -- Default all control signals to '0'
        data_memory_cs   <= '0';
        LEDS_cs      <= '0';
        Hex0_cs      <= '0';
        Hex1_cs      <= '0';
        Hex2_cs      <= '0';
        Hex3_cs      <= '0';
        Hex4_cs      <= '0';
        Hex5_cs      <= '0';
        switches_cs  <= '0';
        button_cs    <= '0';
        UCTL_cs      <= '0';
        RXBF_cs      <= '0';
        TXBF_cs      <= '0';
        BTCTL_cs     <= '0';
        BTCNT_cs     <= '0';
        BTCCR0_cs    <= '0';
        BTCCR1_cs    <= '0';
        Dividend_cs  <= '0';
        Divisor_cs   <= '0';
        Quotient_cs  <= '0';
        Residue_cs   <= '0';
        IE_cs        <= '0';
        IFG_cs       <= '0';
        Type_cs      <= '0';

        if unsigned(address) >= x"000" and unsigned(address) <= x"7FC" then
            data_memory_cs <= '1';
        elsif unsigned(address) = x"800" then
            LEDS_cs <= '1';
        elsif unsigned(address) = x"804" then
            Hex0_cs <= '1';
        elsif unsigned(address) = x"805" then
            Hex1_cs <= '1';
        elsif unsigned(address) = x"808" then
            Hex2_cs <= '1';
        elsif unsigned(address) = x"809" then
            Hex3_cs <= '1';
        elsif unsigned(address) = x"80C" then
            Hex4_cs <= '1';
        elsif unsigned(address) = x"80D" then
            Hex5_cs <= '1';
        elsif unsigned(address) = x"810" then
            switches_cs <= '1';
        elsif unsigned(address) = x"814" then
            button_cs <= '1';
        elsif unsigned(address) = x"818" then
            UCTL_cs <= '1';
        elsif unsigned(address) = x"819" then
            RXBF_cs <= '1';
        elsif unsigned(address) = x"81A" then
            TXBF_cs <= '1';
        elsif unsigned(address) = x"81C" then
            BTCTL_cs <= '1';
        elsif unsigned(address) = x"820" then
            BTCNT_cs <= '1';
        elsif unsigned(address) = x"824" then
            BTCCR0_cs <= '1';
        elsif unsigned(address) = x"825" then
            BTCCR1_cs <= '1';
        elsif unsigned(address) = x"828" then
            Dividend_cs <= '1';
        elsif unsigned(address) = x"82C" then
            Divisor_cs <= '1';
        elsif unsigned(address) = x"830" then
            Quotient_cs <= '1';
        elsif unsigned(address) = x"834" then
            Residue_cs <= '1';
        elsif unsigned(address) = x"838" then
            IE_cs <= '1';
        elsif unsigned(address) = x"83C" then
            IFG_cs <= '1';
        elsif unsigned(address) = x"840" then
            Type_cs <= '1';
        end if;
    end process;
    
end Behavioral;


