
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddressDecoder is
    Port ( we : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (31 downto 0);
           wuart : out  STD_LOGIC;
           ruart : out  STD_LOGIC;
           selectIn : out  STD_LOGIC_VECTOR (1 downto 0));
end AddressDecoder;

architecture Behavioral of AddressDecoder is

begin
	process(a,we)
		begin
			if(we='1') then
				selectIn<="00";
				wuart<='0';
				ruart<='0';
				if(a=x"ffffff15") then --Write to Uart
					wuart<='1';
				end if;
			else 
				wuart<='0';
				ruart<='0';
				selectIn<="00";
				if(a=x"ffffff15") then --Read what is in the uart
					ruart<='1';
					selectIn<="01";
				elsif (a=x"ffffff16") then
						selectIn<="10";-- empty
						ruart<='0';
				elsif (a=x"ffffff17") then
						selectIn<="11";
						ruart<='0';
				end if;
			end if;
		end process;
end Behavioral;

