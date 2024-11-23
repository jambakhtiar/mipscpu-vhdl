

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity sw_module is
  Port (
        CS      : in std_logic;
        MemRead : in std_logic;
        SW      : in std_logic_vector(7 downto 0);
        sw_out  : out std_logic_vector(7 downto 0) --to processor
   );
end sw_module;

architecture Behavioral of sw_module is


begin

sw_out <= SW when (CS = '1' and MemRead = '1') else (others => 'Z');

end Behavioral;
