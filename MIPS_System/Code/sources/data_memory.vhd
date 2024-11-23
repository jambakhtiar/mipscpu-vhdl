library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memory is
    port (
        clk   : in  std_logic;
        CS   : in  std_logic;  -- Memory select signal from address decoder
        we    : in  std_logic;  -- Write enable
        addr  : in  std_logic_vector(11 downto 0);  -- 11-bit address for 2KB memory
        din   : in  std_logic_vector(31 downto 0);  -- Data input (for write operations)
        dout  : out std_logic_vector(31 downto 0)  -- Data output (for read operations)
    );
end entity data_memory;

architecture Behavioral of data_memory is
    type memory_array is array (0 to 2047) of std_logic_vector(31 downto 0);
    signal mem : memory_array := (others => (others => '0'));  -- Initialize memory to zeros
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if CS = '1' then  -- Only access memory if selected
                if we = '1' then
                    mem(to_integer(unsigned(addr))) <= din;  -- Write data
                end if;
                dout <= mem(to_integer(unsigned(addr)));  -- Read data
            end if;
        end if;
    end process;
end architecture Behavioral;
