library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_debouncer is
end entity tb_debouncer;

architecture testbench of tb_debouncer is
    -- Component declaration for the debouncer
    component debouncer is
        port (
            clk         : in  std_logic;
            reset_n     : in  std_logic;
            button_in   : in  std_logic;
            button_out  : out std_logic
        );
    end component;

    -- Signals for the testbench
    signal clk         : std_logic := '0';
    signal reset_n     : std_logic := '0';
    signal button_in   : std_logic := '0';
    signal button_out  : std_logic;

    -- Clock period definition
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz clock

begin
    -- Instantiate the debouncer component
    uut: debouncer
        port map (
            clk         => clk,
            reset_n     => reset_n,
            button_in   => button_in,
            button_out  => button_out
        );

    -- Clock generation process
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stimulus : process
    begin
        -- Apply reset
        reset_n <= '1';
        wait for 100 ns;
        reset_n <= '0';
        wait for 100 ns;

        -- Test Case 1: No button press
        wait for 500 us;

        -- Test Case 2: Button press with bouncing
        button_in <= '1';
        wait for 5 us;
        button_in <= '0';
        wait for 5 us;
        button_in <= '1';
        wait for 10 us;
        button_in <= '0';
        wait for 10 us;
        button_in <= '1';  -- Finally press the button

        -- Wait for debouncing period
        wait for 1 ms;

        -- Test Case 3: Button release with bouncing
        button_in <= '0';
        wait for 5 us;
        button_in <= '1';
        wait for 5 us;
        button_in <= '0';
        wait for 10 us;
        button_in <= '1';
        wait for 10 us;
        button_in <= '0';  -- Finally release the button

        -- Wait for debouncing period
        wait for 1 ms;

        -- Test Case 4: Button pressed for an extended period
        button_in <= '1';
        wait for 2 ms;

        -- Test Case 5: Rapid button presses (no debouncing)
        button_in <= '0';
        wait for 10 us;
        button_in <= '1';
        wait for 10 us;
        button_in <= '0';
        wait for 10 us;
        button_in <= '1';
        wait for 10 us;
        button_in <= '0';

        -- Wait to observe final output
        wait for 2 ms;

        -- End simulation
        wait;
    end process;

end architecture testbench;
