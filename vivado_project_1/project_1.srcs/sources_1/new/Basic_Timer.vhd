library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Basic_Timer is
    Port (
        clk              : in  std_logic;                     -- Clock input
        reset            : in  std_logic;                     -- Synchronous reset
        BTCTL_cs     : in std_logic;
        BTCNT_cs     : in std_logic;
        BTCCR0_cs    : in std_logic;
        BTCCR1_cs    : in std_logic;
        DataWrite   : in  std_logic_vector(31 downto 0); -- mips to basic timer
        Set_BTIFG : out std_logic;
        PWMout   : out std_logic
    );
end Basic_Timer;

architecture Behavioral of Basic_Timer is

-- Freq PreSet 
component Frequency_Divider
    Port (
        clk_in    : in  std_logic;                      -- Input clock signal (50 MHz)
        reset     : in  std_logic;                      -- Synchronous reset
        N         : in  std_logic_vector(1 downto 0);   -- Divider control (00 = 0, 01 = 2, 10 = 4, 11 = 8)
        clk_out   : out std_logic                       -- Output divided clock signal
    );
end component;



    signal timer_cnt : unsigned(31 downto 0) := (others => '0');
   -- signal counter   : unsigned(3 downto 0) := (others => '0');
    
    signal BTCTL_reg : std_logic_vector(7 downto 0);
    signal BTCNT_reg : std_logic_vector(31 downto 0);
    signal BTCCR0_reg: std_logic_vector(31 downto 0);
    signal BTCCR1_reg: std_logic_vector(31 downto 0);
    
    signal BTOUTMD, BTOUTEN, BTHOLD: std_logic;
    signal BTSSEL : std_logic_vector(1 downto 0);
    signal BTIPx  : std_logic_vector(2 downto 0);
    
    --signal counter: std_logic_vector(3 downto 0);
    signal preset_clk: std_logic;
    --signal N : std_logic_vector(3 downto 0);
    
begin

-- assigning values to BTCTL, BTCNT, BTCCR0, BTCCR1 registers
process(clk, reset, DataWrite, BTCTL_cs, BTCNT_cs, BTCCR0_cs, BTCCR1_cs) begin
            --BTCTL_reg  <= (others => '0');
            --BTCCR0_reg <= (others => '0');
            --BTCCR1_reg <= (others => '0');
        if reset = '1' then
            BTCTL_reg  <= (others => '0');
            BTCNT_reg  <= (others => '0');
            BTCCR0_reg <= (others => '0');
            BTCCR1_reg <= (others => '0');
        elsif rising_edge(clk) then
            if BTCTL_cs='1' then
                BTCTL_reg <= DataWrite(7 downto 0);
            elsif BTCNT_cs='1' then
                BTCNT_reg <= DataWrite;    
            elsif BTCCR0_cs='1' then
                BTCCR0_reg <= DataWrite;
            elsif BTCCR1_cs='1' then
                BTCCR1_reg <= DataWrite;
            end if;
       end if;
end process; 

-- COntrol Register variables assignments
BTOUTMD <= BTCTL_reg(7);
BTOUTEN <= BTCTL_reg(6);
BTHOLD  <= BTCTL_reg(5);
BTSSEL  <= BTCTL_reg(4 downto 3);
BTIPx   <= BTCTL_reg(2 downto 0);
---------------------------------------------------------------------------------

 FrqPreset_ins: Frequency_Divider
    Port map(
        clk_in  => clk,                      -- Input clock signal (50 MHz)
        reset   => reset,                      -- Synchronous reset
        N       => BTSSEL,    -- Divider control (00 = 0, 01 = 2, 10 = 4, 11 = 8)
        clk_out => preset_clk                       -- Output divided clock signal
    );    
      





process(preset_clk, BTHOLD, reset)
    begin
        if reset = '1' then
            timer_cnt <= (others => '0');
        elsif rising_edge(preset_clk) then
                if timer_cnt = unsigned(BTCNT_reg) then
                    timer_cnt <= (others => '0');
                elsif BTHOLD = '0' then
                    timer_cnt <= timer_cnt + 1;
                end if;
        end if;
    end process;


--Set BTIFG 8x1 Mux
Set_BTIFG <= timer_cnt(0) when (BTIPx = "000") else
             timer_cnt(3) when (BTIPx = "001") else
             timer_cnt(7) when (BTIPx = "010") else
             timer_cnt(11) when (BTIPx = "011") else
             timer_cnt(15) when (BTIPx = "100") else
             timer_cnt(19) when (BTIPx = "101") else
             timer_cnt(23) when (BTIPx = "110") else
             timer_cnt(25) when (BTIPx = "111") else
             'Z';

    -- Compare match logic    
    process(BTCCR0_reg, BTCCR0_reg, timer_cnt ,BTOUTEN, BTOUTMD) begin
        if (BTOUTEN='1' and BTOUTMD='0') then
            if timer_cnt = unsigned(BTCCR0_reg) then 
                PWMout <= '1';
            else 
                PWMout <= '0';
            end if;
        elsif (BTOUTEN='1' and BTOUTMD='1') then
            if timer_cnt = unsigned(BTCCR1_reg) then PWMout <= '0';
            else PWMout <= '1';
            end if;
        end if;
    end process;
    
end Behavioral;
