LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_LEDR IS
END tb_LEDR;

ARCHITECTURE behavior OF tb_LEDR IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT LEDR
    PORT(
         CS       : IN  std_logic;
         MemRead  : IN  std_logic;
         MemWrite : IN  std_logic;
         din      : IN  std_logic_vector(7 downto 0);
         LEDs     : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
    -- Inputs
    signal CS       : std_logic := '0';
    signal MemRead  : std_logic := '0';
    signal MemWrite : std_logic := '0';
    signal din      : std_logic_vector(7 downto 0) := (others => '0');
    
    -- Outputs
    signal LEDs     : std_logic_vector(7 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: LEDR PORT MAP (
          CS => CS,
          MemRead => MemRead,
          MemWrite => MemWrite,
          din => din,
          LEDs => LEDs
        );

    -- Stimulus process
    stim_proc: process
    begin        
        -- Initialize inputs
        wait for 10 ns;
        
        -- Test Case 1: Write to LEDs
        CS <= '1';
        MemWrite <= '1';
        din <= "10101010";  -- Data to write to LEDs
        wait for 10 ns;
        
        -- Test Case 2: Disable MemWrite, check that LEDs hold the previous value
        MemWrite <= '0';
        wait for 10 ns;

        -- Test Case 3: Change data input and re-enable MemWrite
        din <= "01010101";
        MemWrite <= '1';
        wait for 10 ns;

        -- Test Case 4: Test MemRead functionality (not typically affecting output in this architecture)
        MemRead <= '1';
        wait for 10 ns;

        -- Test Case 5: Disable chip select (CS), expect high impedance (Z) on LEDs
        CS <= '0';
        MemWrite <= '1';
        wait for 10 ns;

        -- Test Case 6: Re-enable CS, MemWrite should set LEDs again
        CS <= '1';
        din <= "11110000";
        wait for 10 ns;

        -- Finish the simulation
        wait;
    end process;

END;
