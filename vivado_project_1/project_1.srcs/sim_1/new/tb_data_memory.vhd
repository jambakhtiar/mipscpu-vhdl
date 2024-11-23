LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_data_memory IS
END tb_data_memory;

ARCHITECTURE behavior OF tb_data_memory IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT data_memory
    PORT(
         clk   : IN  std_logic;
         CS    : IN  std_logic;
         we    : IN  std_logic;
         addr  : IN  std_logic_vector(11 downto 0);
         din   : IN  std_logic_vector(31 downto 0);
         dout  : OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
    -- Inputs
    signal clk   : std_logic := '0';
    signal CS    : std_logic := '0';
    signal we    : std_logic := '0';
    signal addr  : std_logic_vector(11 downto 0) := (others => '0');
    signal din   : std_logic_vector(31 downto 0) := (others => '0');
    
    -- Outputs
    signal dout  : std_logic_vector(31 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: data_memory PORT MAP (
          clk => clk,
          CS => CS,
          we => we,
          addr => addr,
          din => din,
          dout => dout
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin        
        -- Initialize inputs
        wait for 20 ns;
        
        -- Test case 1: Write to address 0x001 and read back
        CS <= '1';
        we <= '1';
        addr <= "000000000001";  -- Address 0x001
        din <= x"DEADBEEF";       -- Data to write
        wait for clk_period;
        
        we <= '0';  -- Disable write, perform read
        wait for clk_period;
        
        -- Test case 2: Write to address 0x002 and read back
        addr <= "000000000010";  -- Address 0x002
        din <= x"C0FFEE00";      -- Data to write
        we <= '1';               -- Enable write
        wait for clk_period;
        
        we <= '0';  -- Disable write, perform read
        wait for clk_period;
        
        -- Test case 3: Read from address 0x001 again
        addr <= "000000000001";  -- Address 0x001
        wait for clk_period;
        
        -- Test case 4: Read from an uninitialized address (expect 0)
        addr <= "000000000011";  -- Address 0x003
        wait for clk_period;

        -- Finish the simulation
        wait;
    end process;

END;
