
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux3a1 is
    Port ( selectIn : in  STD_LOGIC_VECTOR (1 downto 0);
           fullUart : in  STD_LOGIC;
           emptyUart : in  STD_LOGIC;
           datoUart : in  STD_LOGIC_VECTOR (7 downto 0);
           datoOut : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux3a1;

architecture Behavioral of Mux3a1 is

begin
			with selectIn select datoOut <=
				(x"000000" & datoUart) when "01",
				(x"0000000" & "000" & EmptyUart) when "10",
				(x"0000000" & "000" & fullUart) when "11",
				x"00000000" when others;

end Behavioral;

