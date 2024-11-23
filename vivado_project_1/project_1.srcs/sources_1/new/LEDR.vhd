
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LEDR is
      Port ( 
        CS : in std_logic;
        MemRead: in std_logic;
        MemWrite : in std_logic; --MemWrite
        din : in std_logic_vector(7 downto 0); --from mips
        LEDs: out std_logic_vector(7 downto 0)
      );
end LEDR;

architecture Behavioral of LEDR is

signal ledr_reg: std_logic_vector(7 downto 0);
signal w1 : std_logic;

begin
 
 w1 <= CS and MemRead;
 
ledr_reg <= din when w1 = '1' else (others => 'Z');

    process(ledr_reg, MemWrite) begin
        if (MemWrite = '1' and CS = '1') then
            LEDs <= ledr_reg;
        else
            LEDs <= (others => 'Z');
        end if;

    end process;
    
end Behavioral;
