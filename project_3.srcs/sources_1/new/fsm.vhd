
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
           lifes: in integer;
          -- Leds : out STD_LOGIC
          current_state_out : out state_type;
          CS_timer_done : in STD_LOGIC;
          HS_timer_done : in STD_LOGIC
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

process(Clock, next_state)
begin
    if rising_edge(Clock) then
 
    case current_state is
        when INIT =>
            if current_state = INIT  then
                next_state <= IDLE;
            else
                next_state <= current_state;
            end if;
        when IDLE =>
            if Enter_Btn = '1' then
                next_state <= PLAY;
            elsif High_Score_Btn = '1' then
                next_state <= HS;
            else
                next_state <= current_state;
            end if;
        when PLAY =>
            if lifes = 0 then
                next_state <= CURRENT_SCORE;
            elsif Pause_Cancel_Btn = '1' then
                button_released <= '1';
                next_state <= PAUSE;
            else
                next_state <= current_state;
            end if;
        when PAUSE =>
            if Enter_Btn = '1' then
                next_state <= PLAY;
            elsif Pause_Cancel_Btn = '1' and button_released = '0' then
               next_state <= IDLE; -- Init or Idle? Init in theory should initialize stuff so might be safer to go with that
            else
                if Pause_Cancel_Btn = '0' then 
                    button_released <= '0';
                end if;
                next_state <= current_state;
            end if;
            
        when HS =>            
            if HS_timer_done = '1' then 
                next_state <= IDLE;
            else
                next_state <= current_state;
            end if;
            
        when CURRENT_SCORE =>
           if CS_timer_done = '1' then 
                next_state <= IDLE;
            else
                next_state <= current_state;
            end if;
        when others =>
            -- Wtf?
            next_state <= INIT;
    end case;
    end if;
    current_state <= next_state;

end process;

current_state_out <= current_state;
end Behavioral;
