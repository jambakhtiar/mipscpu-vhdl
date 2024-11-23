library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Frequency_Divider is
    Port (
        clk_in    : in  std_logic;                      -- Input clock signal (50 MHz)
        reset     : in  std_logic;                      -- Synchronous reset
        N         : in  std_logic_vector(1 downto 0);   -- Divider control (00 = 0, 01 = 2, 10 = 4, 11 = 8)
        clk_out   : out std_logic                       -- Output divided clock signal
    );
end Frequency_Divider;

architecture Behavioral of Frequency_Divider is

    signal counter   : unsigned(3 downto 0) := (others => '0');
    signal clk_reg   : std_logic := '0';
    signal div_value : unsigned(3 downto 0);

begin

    -- Determine the division factor based on N
    process(N)
    begin
        case N is
            when "00" => div_value <= "0001"; -- Division by 1 (no clock)
            when "01" => div_value <= "0010"; -- Division by 2
            when "10" => div_value <= "0100"; -- Division by 4
            when "11" => div_value <= "1000"; -- Division by 8
            when others => div_value <= "0000";
        end case;
    end process;

    -- Clock divider process
    process(clk_in, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');
            clk_reg <= '0';
        elsif rising_edge(clk_in) then
            if div_value = 0 then
                clk_reg <= '0'; -- No clock output when division is 0
            else
                if counter = div_value then
                    counter <= (others => '0');
                    clk_reg <= not clk_reg;
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;

    -- Output the divided clock signal
    clk_out <= clk_reg;

end Behavioral;
