library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_test is
 Port ( clock   : IN STD_LOGIC;      -- 100 MHz Clock Input
        buttons : IN STD_LOGIC_VECTOR(4 downto 0); -- buttons    
        an      : OUT STD_LOGIC_VECTOR(3 downto 0); -- Active-low display enables
        seg     : OUT STD_LOGIC_VECTOR(6 downto 0);  -- 7-segment outputs
        led     : OUT STD_LOGIC_VECTOR(15 downto 0)  -- 16 leds display
      );
end led_test;

architecture Behavioral of led_test is

  component leds
      Port (  
                clock_1ms    : IN STD_LOGIC;
                start        : IN STD_LOGIC;
                button_left  : IN STD_LOGIC;
                button_right : IN STD_LOGIC;
                reset        : IN STD_LOGIC;
                game_value   : OUT STD_LOGIC_VECTOR(3 downto 0);
                led          : OUT STD_LOGIC_VECTOR(15 downto 0)
            );
  end component;
  
  component Button
      Port (  
                clock         : IN STD_LOGIC;
                button_input  : IN STD_LOGIC;
                button_output : OUT STD_LOGIC
            );
  end component;
  
  component Timer
      Port (  
                clock     : IN STD_LOGIC;
                clock_1ms : OUT STD_LOGIC;
                clock_1s  : OUT STD_LOGIC
            );
  end component;
  
  component Display
      Port (  
                clock     : IN STD_LOGIC;
                clock_1ms : IN STD_LOGIC;
                seg_0     : IN STD_LOGIC_VECTOR(6 downto 0);
                seg_1     : IN STD_LOGIC_VECTOR(6 downto 0);
                seg_2     : IN STD_LOGIC_VECTOR(6 downto 0);
                seg_3     : IN STD_LOGIC_VECTOR(6 downto 0);
                seg       : OUT STD_LOGIC_VECTOR(6 downto 0);
                an        : OUT STD_LOGIC_VECTOR(3 downto 0)
            );
  end component;
  
  component Control
      Port (  
                clock         : IN STD_LOGIC;
                clock_1ms     : IN STD_LOGIC;
                clock_1s      : IN STD_LOGIC;
                button_center : IN STD_LOGIC;
                button_top     : IN STD_LOGIC;
                button_bottom    : IN STD_LOGIC;
                game_value    : IN STD_LOGIC_VECTOR(3 downto 0);
                start         : OUT STD_LOGIC;
                reset_leds    : OUT STD_LOGIC;
                seg_0         : OUT STD_LOGIC_VECTOR(6 downto 0);
                seg_1         : OUT STD_LOGIC_VECTOR(6 downto 0);
                seg_2         : OUT STD_LOGIC_VECTOR(6 downto 0);
                seg_3         : OUT STD_LOGIC_VECTOR(6 downto 0)
            );
  end component;
  
  signal start, reset_leds, clock_1ms, clock_1s : STD_LOGIC; -- for reset system and initial state
  signal seg_0, seg_1, seg_2, seg_3 : STD_LOGIC_VECTOR(6 downto 0);
  signal game_value  : STD_LOGIC_VECTOR(3 downto 0); -- values
  signal buttons_clean              : STD_LOGIC_VECTOR(4 downto 0); -- buttons debounce
  
begin
    control_game  : Control port map (clock=> clock, clock_1ms=> clock_1ms, clock_1s=> clock_1s, button_center=> buttons_clean(4),  button_top=> buttons_clean(2), button_bottom=>buttons_clean(3), game_value=>game_value, start=>start, reset_leds=> reset_leds, seg_0=>seg_0, seg_1=>seg_1, seg_2=>seg_2, seg_3=>seg_3);
    timers        : Timer   port map (clock=> clock, clock_1ms=> clock_1ms, clock_1s=>clock_1s);
    button_left   : Button  port map (clock=> clock, button_input=> buttons(0), button_output=>buttons_clean(0));
    button_right  : Button  port map (clock=> clock, button_input=> buttons(1), button_output=>buttons_clean(1));
    button_up     : Button  port map (clock=> clock, button_input=> buttons(2), button_output=>buttons_clean(2));
    button_down   : Button  port map (clock=> clock, button_input=> buttons(3), button_output=>buttons_clean(3));
    button_center : Button  port map (clock=> clock, button_input=> buttons(4), button_output=>buttons_clean(4));
    control_leds  : leds    port map (clock_1ms=> clock_1ms, start=>start, button_left=> buttons_clean(0), button_right=> buttons_clean(1), reset => reset_leds, game_value=>game_value, led=> led);    
    display7seg   : Display port map (clock=> clock, clock_1ms=> clock_1ms, seg_0=>seg_0, seg_1=>seg_1, seg_2=>seg_2, seg_3=>seg_3, seg=>seg, an=>an);

end Behavioral;
