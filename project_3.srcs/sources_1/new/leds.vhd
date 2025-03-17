library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity leds is
  Port (
    clock_1ms    : IN STD_LOGIC;
    button_left  : IN STD_LOGIC;
    button_right : IN STD_LOGIC;
    start        : IN STD_LOGIC; -- Start leds
    reset        : IN STD_LOGIC; -- Restart leds
    game_value   : OUT STD_LOGIC_VECTOR(3 downto 0);
    led          : OUT STD_LOGIC_VECTOR(15 downto 0) --- Control for leds
  ); 
end leds;

architecture Behavioral of leds is
    signal state : INTEGER range 0 to 16 := 0; -- For control the how leds turn on;
    signal press_button  : STD_LOGIC := '0';
    signal led_reg : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
begin

    process(state)
    begin
        case state is
            when 1 => led_reg  <= "1000000000000000"; -- 1
            when 2 => led_reg  <= "1100000000000000"; -- 2
            when 3 => led_reg  <= "1110000000000000"; -- 3
            when 4 => led_reg  <= "1111000000000000"; -- 4
            when 5 => led_reg  <= "1111100000000000"; -- 5
            when 6 => led_reg  <= "1111110000000000"; -- 6
            when 7 => led_reg  <= "1111111000000000"; -- 7
            when 8 => led_reg  <= "1111111100000000"; -- 8
            when 9 => led_reg  <= "1111111110000000"; -- 9
            when 10 => led_reg <= "1111111111000000"; -- 10
            when 11 => led_reg <= "1111111111100000"; -- 11
            when 12 => led_reg <= "1111111111110000"; -- 12
            when 13 => led_reg <= "1111111111111000"; -- 13
            when 14 => led_reg <= "1111111111111100"; -- 14
            when 15 => led_reg <= "1111111111111110"; -- 15
            when 16 => led_reg <= "1111111111111111"; -- 16
            when others => led_reg <= "0000000000000000"; -- Default (0)
        end case;
    end process;
    
    
    process(clock_1ms)
    begin
        if rising_edge(clock_1ms) then
            if (start = '0' or reset = '1') then
                state <= 0;
                press_button <= '0';
            elsif (button_right = '1' and state < 16) then
                if press_button = '0' then
                    press_button <= '1';
                    state <= state + 1;
                 end if;
            elsif (button_left = '1' and state > 0) then
                if press_button = '0' then
                    press_button <= '1';
                    state <= state - 1;
                 end if;
            else
                state <= state;
                press_button <= '0';
            end if;
        end if;     
    end process;
    
    led <= led_reg;
    game_value <= STD_LOGIC_VECTOR(TO_UNSIGNED(state, 4));
end Behavioral;
