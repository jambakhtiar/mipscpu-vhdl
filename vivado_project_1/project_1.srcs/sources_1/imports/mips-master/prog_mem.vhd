library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  -- Include this for to_integer and unsigned type

entity prog_mem is
    port (
        clk   : in  std_logic;
        pc    : in  std_logic_vector(31 downto 0); -- 32-bit Program Counter input
        dout  : out std_logic_vector(31 downto 0)  -- 32-bit instruction output
    );
end entity prog_mem;

architecture Behavioral of prog_mem is
    type memory_array is array (0 to 2047) of std_logic_vector(31 downto 0);

signal mem : memory_array := (
    0  => x"8C6B0004", -- lw   $t3, N
    1  => x"00004020", -- move $t0, $zero
    2  => x"AC080800", -- sw   $t0, 0x800
    3  => x"AC080804", -- sw   $t0, 0x804
    4  => x"AC080805", -- sw   $t0, 0x805
    5  => x"AC080808", -- sw   $t0, 0x808
    6  => x"AC080809", -- sw   $t0, 0x809
    7  => x"AC08080C", -- sw   $t0, 0x80C
    8  => x"AC08080D", -- sw   $t0, 0x80D
    9  => x"21080001", -- addi $t0, $t0, 1
    10 => x"00004820", -- move $t1, $zero
    11 => x"21290001", -- addi $t1, $t1, 1
    12 => x"012B502A", -- slt  $t2, $t1, $t3
    13 => x"1140FFFA", -- beq  $t2, $zero, Loop
    14 => x"0800000A", -- j    delay
    
    -- Remaining memory is initialized to zero
    others => (others => '0')
);
    
    signal addr : std_logic_vector(11 downto 0);  -- 11-bit address derived from PC
begin
    -- Map PC[12:2] to the instruction memory address
    addr <= pc(11 downto 0);

    process(clk)
    begin
        if rising_edge(clk) then
            dout <= mem(to_integer(unsigned(pc)));  -- Read instruction
        end if;
    end process;
end architecture Behavioral;
