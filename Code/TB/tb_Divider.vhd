library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Divider is
end entity tb_Divider;

architecture Behavioral of tb_Divider is
    -- Component declaration
    component Divider
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
    end component;

    -- Signals to connect to the Divider
    signal clk        : std_logic := '0';
    signal reset      : std_logic := '0';
    signal start      : std_logic := '0';
    signal dividend   : std_logic_vector(31 downto 0);
    signal divisor    : std_logic_vector(31 downto 0);
    signal quotient   : std_logic_vector(31 downto 0);
    signal remainder  : std_logic_vector(31 downto 0);
    signal done       : std_logic;

    -- Clock period definition
    constant clk_period : time := 2 ns;

begin
    -- Instantiate the Divider component
    uut: Divider
        port map (
            clk => clk,
            reset => reset,
            start => start,
            dividend => dividend,
            divisor => divisor,
            quotient => quotient,
            remainder => remainder,
            done => done
        );

    -- Clock generation process
    clk_process: process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process clk_process;

    -- Test process
    test_process: process
    begin
        -- Test 1: Reset the system
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Test 2: Divide 100 by 9
        dividend <= x"00000064"; -- 100 in hexadecimal
        divisor <= x"00000009";  -- 9 in hexadecimal
        wait for clk_period;
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until done = '1'; -- Wait until done signal is asserted
        assert quotient = x"0000000b" report "Test 2 Failed: Quotient is incorrect" severity failure;
        assert remainder = x"00000001" report "Test 2 Failed: Remainder is incorrect" severity failure;

        -- Test 3: Divide 100 by 3
        dividend <= x"00000064"; -- 100 in hexadecimal
        divisor <= x"00000003";  -- 3 in hexadecimal
        wait for clk_period;
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until done = '1'; -- Wait until done signal is asserted
        assert quotient = x"00000021" report "Test 3 Failed: Quotient is incorrect" severity failure;
        assert remainder = x"00000001" report "Test 3 Failed: Remainder is incorrect" severity failure;

        -- Test 4: Divide 1234 by 5
        dividend <= x"000004D2"; -- 1234 in hexadecimal
        divisor <= x"00000005";  -- 5 in hexadecimal
        wait for clk_period;
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until done = '1'; -- Wait until done signal is asserted
        assert quotient = x"000000f6" report "Test 4 Failed: Quotient is incorrect" severity failure;
        assert remainder = x"00000004" report "Test 4 Failed: Remainder is incorrect" severity failure;



        -- Test 5: Divide 100 by 5
        dividend <= x"00000064"; -- 100 in hexadecimal
        divisor <= x"00000005";  -- 5 in hexadecimal
        wait for clk_period;
        start <= '1';
        wait for clk_period;
        start <= '0';
        wait until done = '1'; -- Wait until done signal is asserted
        assert quotient = x"00000014" report "Test 2 Failed: Quotient is incorrect" severity failure;
        assert remainder = x"00000000" report "Test 2 Failed: Remainder is incorrect" severity failure;


        -- Stop the simulation
        wait;
    end process test_process;

end architecture Behavioral;
