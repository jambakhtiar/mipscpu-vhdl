library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Frequency_Divider is
end tb_Frequency_Divider;

architecture Behavioral of tb_Frequency_Divider is

    -- Signals for the Frequency_Divider instance
    signal clk_in    : std_logic := '0';
    signal reset     : std_logic := '0';
    signal N         : std_logic_vector(1 downto 0) := "00";
    signal clk_out   : std_logic;

    -- Clock period definition for 50 MHz
    constant clk_period : time := 20 ns; -- 50 MHz clock (1/50 MHz = 20 ns)

begin

    -- Clock generation process
    clk_process : process
    begin
        clk_in <= '0';
        wait for clk_period / 2;
        clk_in <= '1';
        wait for clk_period / 2;
    end process clk_process;

    

    -- Instantiate the Frequency_Divider module
    uut: entity work.Frequency_Divider
    port map (
        clk_in  => clk_in,
        reset   => reset,
        N       => N,
        clk_out => clk_out
    );

    -- Test stimulus process
    stimulus_process : process
    begin
        reset <= '1';
        wait for 40 ns;
        reset <= '0';
        -- Wait for reset to deassert
        wait for 60 ns;

        -- Test division by 2 (N = "01")
        N <= "01";
        wait for 500 ns;

        -- Test division by 4 (N = "10")
        N <= "10";
        wait for 500 ns;

        -- Test division by 8 (N = "11")
        N <= "11";
        wait for 500 ns;

        -- Test division by 0 (N = "00")
        N <= "00";
        wait for 500 ns;

        -- End simulation
        wait;
    end process stimulus_process;

end Behavioral;
