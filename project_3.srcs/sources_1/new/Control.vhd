library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.fsm_types.all;

entity Control is
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
end Control;



architecture Behavioral of Control is


--type state_type is (INIT, IDLE, PLAY, HS, CURRENT_SCORE, PAUSE);  
  
    component fsm is
    Port ( 
           Clock : in STD_LOGIC;
          
           Enter_Btn : in STD_LOGIC;
           High_Score_Btn : in STD_LOGIC;
           Pause_Cancel_Btn : in STD_LOGIC;
           error : in STD_LOGIC;
           current_state_out : out state_type
           );
end component;


    component HexTo7Seg
      Port (  
                value : in  STD_LOGIC_VECTOR(3 downto 0);
                seg   : out STD_LOGIC_VECTOR(6 downto 0)   
            );
    end component;
    
    component RandomNumber
      Port (  
                clock          : IN STD_LOGIC;
                read           : IN STD_LOGIC;
                random_number  : OUT STD_LOGIC_VECTOR(3 downto 0)
            );
    end component;
  
  -- State management 
  --type state_type is (INIT, IDLE, PLAY, HS, CURRENT_SCORE, PAUSE);  
    signal game_state : state_type;
    
    signal error : STD_LOGIC;
    
    signal submit, read_submit, start_control, read_number : STD_LOGIC := '0';
    signal count : UNSIGNED(3 downto 0) := "1111";
    signal lifes : INTEGER :=3;
    signal tens_digit, ones_digit : UNSIGNED(3 downto 0);
    signal random_number : STD_LOGIC_VECTOR(3 downto 0);
    signal seg_tens, seg_ones, seg_lifes, seg_number : STD_LOGIC_VECTOR(6 downto 0);
    
begin

    game_fsm: fsm port map(Clock=>clock,  Enter_Btn => button_center, High_Score_Btn => button_bottom , Pause_Cancel_Btn => button_top, error => error, current_state_out => game_state);
    
    seg0_translate: HexTo7Seg port map (value => STD_LOGIC_VECTOR(tens_digit), seg => seg_tens);
    seg1_translate: HexTo7Seg port map (value => STD_LOGIC_VECTOR(ones_digit), seg => seg_ones);
    seg3_number:    HexTo7Seg port map (value => random_number, seg => seg_number);
    randon_number:  RandomNumber port map (clock => clock, read=> read_number, random_number=> random_number);
    
    process(lifes)
    begin
        case lifes is
            when 1 => seg_lifes      <= "1110111";
            when 2 => seg_lifes      <= "1110110";
            when 3 => seg_lifes      <= "0110110";
            when others => seg_lifes <= "1111111";
        end case;
    end process;
    
    process (game_state, seg_tens, seg_ones, seg_lifes, seg_number)
    begin
   
        if  game_state = INIT then
            seg_0 <=  "1111001"; -- I
            seg_1 <=  "1001000"; -- H
            seg_2 <= "1111001"; -- I
            seg_3 <= "1100000"; -- t

            
        elsif game_state = IDLE then
            seg_0 <= "1001000"; -- H
            seg_1 <= "0000001"; -- O
            seg_2 <= "1110001"; -- L
            seg_3 <= "0001000"; -- A
            
       elsif game_state = PAUSE then
            seg_0 <= "0001001"; -- P
            seg_1 <= "0001000"; -- A
            seg_2 <= "1000001"; -- U
            seg_3 <= "0100100"; -- S
       elsif game_state = HS then
            seg_0 <= "1001000"; -- H
            seg_1 <= "1111001"; -- I
            seg_2 <= "0100000"; -- G
            seg_3 <= "1001000"; -- H
            
      elsif game_state = ERROR_STATE then
            seg_0 <= "0000000"; 
            seg_1 <= "1111111"; 
            seg_2 <= "0000000"; 
            seg_3 <= "1111111"; 
      
            
        elsif game_state = PLAY then
            seg_0 <= seg_tens;  
            seg_1 <= seg_ones;  
            seg_2 <= seg_lifes; 
            seg_3 <= seg_number;
        
        else
            seg_0 <= seg_tens;
            seg_1 <= seg_ones;
            seg_2 <= seg_lifes;
            seg_3 <= seg_number;
        end if;
    end process;
    
    process(count)
    begin
        if count >= "1010" then -- 10
            tens_digit <= "0001";
            ones_digit <= count - "1010"; -- count - 10
        else
            tens_digit <= "0000";
            ones_digit <= count;
        end if;
    end process;


    
    process(clock_1s)
    begin
    if rising_edge(clock_1s) then
    
        if game_state = INIT then
                count <= "1111";
                lifes <= 3;
        end if;
        
        if game_state = PLAY then
            -- Reset read signals at start of each cycle
            read_number <= '0';  
            
            -- Score the value when submit
            if submit = '1' then
                if game_value = random_number then
                    reset_leds <= '1';
                    read_number <= '1';
                    count <= "1111"; -- Reset counter
                    read_submit <= '1';
                    
                elsif game_value /= random_number then
                    count <= "0001";
                    read_submit <= '1';
                    
                else 
                    error <= '1';
                
                end if;   
            elsif read_submit = '1' then
                -- Keep read_submit active until next clock cycle after submit is cleared
                read_submit <= '0';
            end if;     
                
            -- Clock checker
            if count = "0000" then
                reset_leds <= '1';
                read_number <= '1';
                lifes <= lifes - 1;
                count <= "1111"; -- Reset counter
            else
                reset_leds <= '0';
                count <= count - 1;
            end if;
        end if;                    
    end if;         
end process;

-- Button handling process
    process(clock_1ms)
    begin
    
        if rising_edge(clock_1ms) then
           
            if game_state = PLAY and count = "1111" and start_control <= '0' then
                error <= '0';
                start_control <= '1';
               
            elsif game_state = INIT then
                start_control <= '0';
                
            end if;
            
            
            
            if button_center = '1' then 
                submit <= '1';
            end if;
            if read_submit = '1' then
                submit <= '0';
            end if;
        end if;
        
end process;
    
    start <= start_control;
  
    
end Behavioral;
