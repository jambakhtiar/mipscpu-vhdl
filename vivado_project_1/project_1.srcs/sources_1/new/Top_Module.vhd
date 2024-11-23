----------------------------------------------------------------------------------

-- Module Name:    TOP - Behavioral 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top_Module is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rx : in  STD_LOGIC;
           tx : out  STD_LOGIC);
end Top_Module;

architecture Behavioral of Top_Module is

---- mips
COMPONENT MIPS
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		readdata : IN std_logic_vector(31 downto 0);          
		MemWrite : OUT std_logic;
		WriteData : OUT std_logic_vector(31 downto 0);
		address : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
--- the address decoder
COMPONENT AddressDecoder
	PORT(
		we : IN std_logic;
		a : IN std_logic_vector(31 downto 0);          
		wuart : OUT std_logic;
		ruart : OUT std_logic;
		selectIn : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
----- uart
COMPONENT uart
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		rd_uart : IN std_logic;
		wr_uart : IN std_logic;
		rx : IN std_logic;
		w_data : IN std_logic_vector(7 downto 0);          
		tx_full : OUT std_logic;
		rx_empty : OUT std_logic;
		r_data : OUT std_logic_vector(7 downto 0);
		tx : OUT std_logic
		);
	END COMPONENT;
	
--- the input data mux
COMPONENT Mux3a1
	PORT(
		selectIn : IN std_logic_vector(1 downto 0);
		fullUart : IN std_logic;
		emptyUart : IN std_logic;
		datoUart : IN std_logic_vector(7 downto 0);          
		datoOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
-- internal signals
-- of 32
signal SenalDataToMem,SenalWriteData,SenalAddressMem  : std_logic_vector(31 downto 0);
-- de 1
signal SenalMemWrite,Senalwuart,Senalruart,SenalEmpty,SenalFull: std_logic;
signal SenalselectIn: std_logic_vector(1 downto 0);
signal SenalDatoUart: std_logic_vector(7 downto 0);

begin
--- mips
Inst_MIPS: MIPS PORT MAP(
		clk =>clk ,
		reset => reset,
		readdata =>SenalDataToMem ,
		MemWrite => SenalMemWrite,
		WriteData =>SenalWriteData  ,
		address =>SenalAddressMem 
	);
	
--- the address decoder
Inst_AddressDecoder: AddressDecoder PORT MAP(
		we =>SenalMemWrite ,
		a => SenalAddressMem,
		wuart =>Senalwuart ,
		ruart =>Senalruart ,
		selectIn => SenalselectIn
	);
----- uart
Inst_uart: uart PORT MAP(
		clk =>clk ,
		reset => reset,
		rd_uart => Senalruart,
		wr_uart =>Senalwuart ,
		rx =>rx ,
		w_data =>SenalWriteData(7 downto 0) ,
		tx_full =>SenalFull ,
		rx_empty =>SenalEmpty ,
		r_data =>SenalDatoUart ,
		tx => tx
	);
--- the input data mux
Inst_Mux3a1: Mux3a1 PORT MAP(
		selectIn => SenalselectIn,
		fullUart =>SenalFull ,
		emptyUart => SenalEmpty,
		datoUart => SenalDatoUart,
		datoOut => SenalDataToMem
	);

end Behavioral;

