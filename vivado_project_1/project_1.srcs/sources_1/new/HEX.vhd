
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HEX is
      Port ( 
        CS : in std_logic;
        MemRead: in std_logic;
        MemWrite : in std_logic; --MemWrite
        din : in std_logic_vector(7 downto 0); --from mips
        HEXout: out std_logic_vector(7 downto 0)
      );
end HEX;

architecture Behavioral of HEX is

signal HEX_reg: std_logic_vector(7 downto 0);
signal w1 : std_logic;

begin
 
 w1 <= CS and MemRead;
 
HEX_reg <= din when w1 = '1' else (others => 'Z');

    process(HEX_reg, MemWrite) begin
        if (MemWrite = '1' and CS = '1') then
            HEXout <= HEX_reg;
        else
            HEXout <= (others => 'Z');
        end if;

    end process;
    
end Behavioral;
