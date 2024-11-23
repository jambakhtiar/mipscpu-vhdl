library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALUdecoder is
    Port ( ALUop : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUctrl : out  STD_LOGIC_VECTOR (2 downto 0));
end ALUdecoder;

architecture Behavioral of ALUdecoder is

begin

	process(aluop,funct)
	begin
		case aluop is
				when "00" => aluctrl <="010";
				when "01" => aluctrl	<="110";
				when others => case funct is 
											when "100000" => aluctrl <=
												"010";
											when "100010" => aluctrl<= 
												"110";
											when "100100" => aluctrl <=
												"000";
											when "100101" => aluctrl <=
												"001";
											when "101010" => aluctrl<=
												"111";
											when others => aluctrl <=
												"---";
										end case;
		end case;
	end process;
				
end Behavioral;
