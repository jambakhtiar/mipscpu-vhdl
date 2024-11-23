library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity displacement is
    Port ( din : in  STD_LOGIC_VECTOR (31 downto 0);
           dout : out  STD_LOGIC_VECTOR (31 downto 0));
end displacement;

architecture Behavioral of displacement is

begin
	dout<=din(29 downto 0)&"00"; --is a multiplication by 4
end Behavioral;

