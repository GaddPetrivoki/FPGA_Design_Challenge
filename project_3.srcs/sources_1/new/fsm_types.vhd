library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package fsm_types is
    type state_type is (INIT, IDLE, PLAY, HS, CURRENT_SCORE, PAUSE, ERROR_STATE);
end package fsm_types;