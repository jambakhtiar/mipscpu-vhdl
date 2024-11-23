library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Basic_Timer is
end tb_Basic_Timer;

architecture Behavioral of tb_Basic_Timer is

    -- Signals for Basic_Timer instance
    signal clk         : std_logic := '0';
    signal reset       : std_logic := '0';
    signal BTCTL_cs    : std_logic := '0';
    signal BTCNT_cs    : std_logic := '0';
    signal BTCCR0_cs   : std_logic := '0';
    signal BTCCR1_cs   : std_logic := '0';
    signal DataWrite   : std_logic_vector(31 downto 0) := (others => '0');
    signal Set_BTIFG   : std_logic;
    signal PWMout      : std_logic;

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process clk_process;



    -- Instantiate the Basic_Timer module
    uut: entity work.Basic_Timer
    port map (
        clk        => clk,
        reset      => reset,
        BTCTL_cs   => BTCTL_cs,
        BTCNT_cs   => BTCNT_cs,
        BTCCR0_cs  => BTCCR0_cs,
        BTCCR1_cs  => BTCCR1_cs,
        DataWrite  => DataWrite,
        Set_BTIFG  => Set_BTIFG,
        PWMout     => PWMout
    );

    -- Test stimulus
    stimulus_process : process
    begin
         reset <= '1';
            wait for 20 ns;
        reset <= '0';
        -- Wait for reset deassertion
        wait for 40 ns;

        -- Set control register (BTCTL)
        BTCTL_cs <= '1';
        DataWrite <= x"00000087";  -- Example data to set control register
        wait for clk_period;
        BTCTL_cs <= '0';

        -- Set compare register 0 (BTCCR0)
        BTCCR0_cs <= '1';
        DataWrite <= x"0000000A";  -- Example data to set compare register 0
        wait for clk_period;
        BTCCR0_cs <= '0';

        -- Set compare register 1 (BTCCR1)
        BTCCR1_cs <= '1';
        DataWrite <= x"00000005";  -- Example data to set compare register 1
        wait for clk_period;
        BTCCR1_cs <= '0';

        -- Write to the counter register (BTCNT)
        BTCNT_cs <= '1';
        DataWrite <= x"00000000";  -- Reset counter value
        wait for clk_period;
        BTCNT_cs <= '0';

        -- Observe the PWM output and interrupt flag
        wait for 500 ns;

        -- End simulation
        wait;
    end process stimulus_process;

end Behavioral;
