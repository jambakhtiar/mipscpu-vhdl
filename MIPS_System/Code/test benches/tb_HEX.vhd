LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_HEX IS
END tb_HEX;

ARCHITECTURE behavior OF tb_HEX IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT HEX
    PORT(
         CS       : IN  std_logic;
         MemRead  : IN  std_logic;
         MemWrite : IN  std_logic;
         din      : IN  std_logic_vector(7 downto 0);
         HEXout   : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
    -- Inputs
    signal CS       : std_logic := '0';
    signal MemRead  : std_logic := '0';
    signal MemWrite : std_logic := '0';
    signal din      : std_logic_vector(7 downto 0) := (others => '0');
    
    -- Outputs
    signal HEXout   : std_logic_vector(7 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: HEX PORT MAP (
          CS => CS,
          MemRead => MemRead,
          MemWrite => MemWrite,
          din => din,
          HEXout => HEXout
        );

    -- Stimulus process
    stim_proc: process
    begin        
        -- Initialize inputs
        wait for 10 ns;
        
        -- Test Case 1: Write to HEX display
        CS <= '1';
        MemWrite <= '1';
        din <= "10101010";  -- Data to write to HEX display
        wait for 10 ns;
        
        -- Test Case 2: Disable MemWrite, check that HEX display holds the previous value
        MemWrite <= '0';
        wait for 10 ns;

        -- Test Case 3: Change data input and re-enable MemWrite
        din <= "01010101";
        MemWrite <= '1';
        wait for 10 ns;

        -- Test Case 4: Test MemRead functionality (w1 signal)
        MemRead <= '1';
        wait for 10 ns;

        -- Test Case 5: Disable chip select (CS), expect high impedance (Z) on HEX display
        CS <= '0';
        MemWrite <= '1';
        wait for 10 ns;

        -- Test Case 6: Re-enable CS, MemWrite should set HEX display again
        CS <= '1';
        din <= "11110000";
        wait for 10 ns;

        -- Finish the simulation
        wait;
    end process;

END;
