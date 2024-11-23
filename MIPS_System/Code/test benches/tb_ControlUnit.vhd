LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_ControlUnit IS
END tb_ControlUnit;

ARCHITECTURE behavior OF tb_ControlUnit IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ControlUnit
    PORT(
         OpCode : IN  std_logic_vector(5 downto 0);
         Funct : IN  std_logic_vector(5 downto 0);
         MemtoReg : OUT  std_logic;
         MemWrite : OUT  std_logic;
         Branch : OUT  std_logic;
         AluSrc : OUT  std_logic;
         RegDst : OUT  std_logic;
         RegWrite : OUT  std_logic;
         Jump : OUT std_logic;
         AluCtrl : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    
    -- Inputs
    signal OpCode : std_logic_vector(5 downto 0) := (others => '0');
    signal Funct : std_logic_vector(5 downto 0) := (others => '0');

    -- Outputs
    signal MemtoReg : std_logic;
    signal MemWrite : std_logic;
    signal Branch : std_logic;
    signal AluSrc : std_logic;
    signal RegDst : std_logic;
    signal RegWrite : std_logic;
    signal Jump : std_logic;
    signal AluCtrl : std_logic_vector(2 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: ControlUnit PORT MAP (
          OpCode => OpCode,
          Funct => Funct,
          MemtoReg => MemtoReg,
          MemWrite => MemWrite,
          Branch => Branch,
          AluSrc => AluSrc,
          RegDst => RegDst,
          RegWrite => RegWrite,
          Jump => Jump,
          AluCtrl => AluCtrl
        );

    -- Stimulus process
    stim_proc: process
    begin        
        -- Test case 1: R-type instruction (e.g., OpCode = "000000", Funct = "100000")
        OpCode <= "000000"; Funct <= "100000";
        wait for 100 ns;
        
        -- Test case 2: Load instruction (e.g., OpCode = "100011", Funct = don't care)
        OpCode <= "100011"; Funct <= "XXXXXX";
        wait for 100 ns;

        -- Test case 3: Store instruction (e.g., OpCode = "101011", Funct = don't care)
        OpCode <= "101011"; Funct <= "XXXXXX";
        wait for 100 ns;

        -- Test case 4: Branch instruction (e.g., OpCode = "000100", Funct = don't care)
        OpCode <= "000100"; Funct <= "XXXXXX";
        wait for 100 ns;

        -- Test case 5: Jump instruction (e.g., OpCode = "000010", Funct = don't care)
        OpCode <= "000010"; Funct <= "XXXXXX";
        wait for 100 ns;

        -- Add more test cases as needed
        
        -- Finish the simulation
        wait;
    end process;

END;
