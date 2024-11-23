library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
    port (
        clk         : in  std_logic;  -- 50 MHz clock input
        reset     : in  std_logic;  -- Active-low reset
        button_in   : in  std_logic;  -- Raw button input
        button_out  : out std_logic   -- Debounced button output
    );
end entity debouncer;

architecture behavior of debouncer is
    -- Constants
    constant DEBOUNCE_TIME : integer := 50000;  -- 1 ms at 50 MHz clock
    constant COUNTER_WIDTH : integer := 16;     -- Counter width sufficient for 50k count

    -- Signals
    signal button_sync      : std_logic;
    signal counter          : integer range 0 to DEBOUNCE_TIME := 0;
    signal debounced_button : std_logic := '0';
    signal button_stable    : std_logic := '0';

begin
    -- Synchronize the button input to the clock domain
    process (clk, reset)
    begin
        if reset = '1' then
            button_sync <= '0';
        elsif rising_edge(clk) then
            button_sync <= button_in;
        end if;
    end process;

    -- Debouncing process
    process (clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            button_stable <= '0';
        elsif rising_edge(clk) then
            -- If the button state is stable for DEBOUNCE_TIME cycles, update the debounced output
            if button_sync = button_stable then
                counter <= 0;
            else
                counter <= counter + 1;
                if counter = DEBOUNCE_TIME then
                    button_stable <= button_sync;
                    counter <= 0;
                end if;
            end if;
        end if;
    end process;

    -- Assign the stable button signal to the output
    button_out <= button_stable;

end architecture behavior;
