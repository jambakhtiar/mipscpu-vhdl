LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_ALU IS
END tb_ALU;

ARCHITECTURE behavior OF tb_ALU IS 

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         func : IN  std_logic_vector(2 downto 0);
         zero : OUT std_logic;
         rslt : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
    -- Inputs
    signal a : std_logic_vector(31 downto 0) := (others => '0');
    signal b : std_logic_vector(31 downto 0) := (others => '0');
    signal func : std_logic_vector(2 downto 0) := (others => '0');

    -- Outputs
    signal zero : std_logic;
    signal rslt : std_logic_vector(31 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: ALU PORT MAP (
          a => a,
          b => b,
          func => func,
          zero => zero,
          rslt => rslt
        );

    -- Stimulus process
    stim_proc: process
    begin        
        -- Test case 1: AND operation
        a <= x"0000000F"; -- 00000000 00000000 00000000 00001111
        b <= x"000000F0"; -- 00000000 00000000 00000000 11110000
        func <= "000";    -- AND
        wait for 100 ns;

        -- Test case 2: OR operation
        a <= x"0000000F"; -- 00000000 00000000 00000000 00001111
        b <= x"000000F0"; -- 00000000 00000000 00000000 11110000
        func <= "001";    -- OR
        wait for 100 ns;
        
        -- Test case 3: ADD operation
        a <= x"0000000A"; -- 00000000 00000000 00000000 00001010
        b <= x"00000005"; -- 00000000 00000000 00000000 00000101
        func <= "010";    -- ADD
        wait for 100 ns;
        
        -- Test case 4: SUBTRACT operation
        a <= x"0000000A"; -- 00000000 00000000 00000000 00001010
        b <= x"00000005"; -- 00000000 00000000 00000000 00000101
        func <= "110";    -- SUB
        wait for 100 ns;
        
        -- Test case 5: SLT (Set Less Than)
        a <= x"00000003"; -- 00000000 00000000 00000000 00000011
        b <= x"00000007"; -- 00000000 00000000 00000000 00000111
        func <= "111";    -- SLT
        wait for 100 ns;

        -- Test case 6: Zero detection
        a <= x"0000000A"; -- 00000000 00000000 00000000 00001010
        b <= x"FFFFFFFF"; -- All 1s, complement of 0x00000000
        func <= "110";    -- SUB (result should be 0)
        wait for 100 ns;

        -- Finish the simulation
        wait;
    end process;

END;
