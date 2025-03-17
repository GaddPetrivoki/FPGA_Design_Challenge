----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Gabriel Luque Martínez
-- 
-- Create Date: 03/14/2025 01:02:17 PM
-- Design Name: 
-- Module Name: main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( 
           Clock : in STD_LOGIC;
           Left_Btn : in STD_LOGIC;
           Enter_Btn : in STD_LOGIC;
           Right_Btn : in STD_LOGIC;
           High_Score_Btn : in STD_LOGIC;
           Pause_Cancel_Btn : in STD_LOGIC;
           Leds : out STD_LOGIC);
end main;

architecture Behavioral of main is

signal counter: integer;
type state_type is (INIT, IDLE, PLAY, HS, CURRENT_SCORE, PAUSE);
signal current_state, next_state: state_type;

begin

-- TImer

process(Clock)
begin
    if rising_edge(Clock) then
        if counter =  20000000 then 
            counter <= 1;
            new_clk <= not new_clk ;
        else
            counter <= counter + 1;
        end if;
    end if;
end process;

-- State Management

process(current_state,Enter_Btn,High_Score_Btn, Pause_Cancel_Btn)
begin
    case current_state is
        when INIT =>
            if current_state = INIT then
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
            if Pause_Cancel_Btn = '1' then
            next_state <= PAUSE;
            else
                next_state <= current_state;
            end if;
        when PAUSE =>
            if Enter_Btn = '1' then
            next_state <= PLAY;
            else
                next_state <= current_state;
            end if;
            
    end case;
end process;


end Behavioral;
