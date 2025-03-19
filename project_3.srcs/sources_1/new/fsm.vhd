
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.fsm_types.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;





entity fsm is
    Port ( 
           Clock : in STD_LOGIC;
          -- Left_Btn : in STD_LOGIC;
           Enter_Btn : in STD_LOGIC;
           --Right_Btn : in STD_LOGIC;
           High_Score_Btn : in STD_LOGIC;
           Pause_Cancel_Btn : in STD_LOGIC;
           error: in STD_LOGIC;
          -- Leds : out STD_LOGIC
          current_state_out : out state_type
          
          );
end fsm;

architecture Behavioral of fsm is

-- type state_type is (INIT, IDLE, PLAY, HS, CURRENT_SCORE, PAUSE);
signal current_state, next_state: state_type := INIT;
signal button_released : STD_LOGIC := '0';

--signal error: STDL_LOGIC := '0';
begin


-- TImer

--process(Clock)
--begin
--    if rising_edge(Clock) then
--        if counter =  20000000 then 
--            counter <= 1;
--            new_clk <= not new_clk ;
--        else
--            counter <= counter + 1;
--        end if;
--    end if;
--end process;

-- State Management

process(current_state,Enter_Btn,High_Score_Btn, Pause_Cancel_Btn)
begin
    if error = '1' then
        next_state <= ERROR_STATE; 
        
    else 
    case current_state is
        when INIT =>
            if current_state = INIT  then
                next_state <= IDLE;
            else
                next_state <= current_state;
            end if;
        when IDLE =>
            if Enter_Btn = '1' and button_released = '1' then

                
                next_state <= PLAY;
            elsif High_Score_Btn = '1' and button_released = '1' then
            
                next_state <= HS;
               
            else
                next_state <= current_state;
            end if;
        when PLAY =>
            -- Todo missing transition to current score
            if Pause_Cancel_Btn = '1' and button_released = '1' then
                next_state <= PAUSE;
               
            else
                next_state <= current_state;
            end if;
        when PAUSE =>
            if Enter_Btn = '1' and button_released = '1' then

                next_state <= PLAY;
            elsif Pause_Cancel_Btn = '1' and button_released = '1' then
               next_state <= INIT; -- Init or Idle? Init in theory should initialize stuff so might be safer to go with that
            else
                next_state <= current_state;
            end if;
            
        when HS =>
            -- Need a timer here
            if High_Score_Btn = '1' and button_released = '1' then
                next_state <= IDLE;

            else
                next_state <= current_state;
            end if;
            
        when CURRENT_SCORE =>
            if Enter_Btn = '1' and button_released = '1' then
                next_state <= IDLE;

                
                
            else
                next_state <= current_state;
            end if;
        when ERROR_STATE =>
            if Enter_Btn = '1' and button_released = '1' then

                next_state <= PLAY;
            else
                next_state <= current_state;
            end if;
        when others =>
            -- Wtf?
            next_state <= INIT;
    end case;
    end if;


end process;

-- Update state
process(Clock)
begin
    if rising_edge(Clock) then
        current_state <= next_state;

    if (Enter_Btn = '1' or High_Score_Btn = '1' or Pause_Cancel_Btn = '1') then
                button_released <= '1'; -- Button is debounced
      else
            button_released <= '0'; -- Reset flag when button is released
        end if;
    
    end if;
    

end process;


 
current_state_out <= current_state;
end Behavioral;
