library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider is
    port (
        clk        : in std_logic;
        reset      : in std_logic;
        start      : in std_logic;
        dividend   : in std_logic_vector(31 downto 0);
        divisor    : in std_logic_vector(31 downto 0);
        quotient   : out std_logic_vector(31 downto 0);
        remainder  : out std_logic_vector(31 downto 0);
        done       : out std_logic
    );
end entity Divider;

architecture Behavioral of Divider is
    type state_type is (idle, processing, mid, complete);
    signal state          : state_type := idle;
    signal A   : std_logic_vector(31 downto 0) := (others => '0');
    signal M    : std_logic_vector(31 downto 0);-- := (others => '0');
    signal counter        : integer range 0 to 32 := 0;
    signal AQ    : std_logic_vector(63 downto 0);-- := (others => '0');
begin

M <= (not divisor(31 downto 1)) & (divisor(0));
A <= std_logic_vector(unsigned(AQ(63 downto 32)) + unsigned(M));

    process(clk, reset, A)
    begin
        if reset = '1' then
            state <= idle;                      
            counter <= 0;
            AQ <= (others => '0');
            done <= '0';
            quotient <= (others => '0');
            remainder <= (others => '0');
        elsif rising_edge(clk) then
            case state is
                when idle =>
                    if start = '1' then
                        state <= processing;                    
                        AQ<= x"00000000" & dividend;
                        counter <= 32;
                        done <= '0';
                    end if;
                when processing =>
                      if counter > 0 then                           
                        AQ <= AQ(62 downto 0) & '0';
                        counter <= counter - 1;
                        state <= mid;
                     else
                        state <= complete;        
                      end if;
                         
                 when mid =>
                         --A <= std_logic_vector(unsigned(AQ(63 downto 32)) + unsigned(M));
                            if A(31) ='1' then
                                AQ(0) <= '0';
                            elsif A(31) = '0' then
                                AQ <= A(31 downto 0) & AQ(31 downto 1) & '1';
                             end if;
                        state <= processing;             
                                     
                when complete =>
                    quotient <= std_logic_vector(AQ(31 downto 0));
                    remainder <= std_logic_vector(AQ(63 downto 32));
                    done <= '1';
                    state <= idle;
                   
            end case;
        end if;
    end process;
end architecture Behavioral;
