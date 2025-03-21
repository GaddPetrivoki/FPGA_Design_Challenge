library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer is
  Port (
    clock        : IN STD_LOGIC;
    update_game_clock: IN STD_LOGIC;
    reset_clock: IN STD_LOGIC;
    clock_1ms    : OUT STD_LOGIC;
    clock_1s     : OUT STD_LOGIC;
    clock_game   : OUT std_logic
  );
end Timer;

architecture Behavioral of Timer is
  signal count_1ms_control : INTEGER := 0;
  signal clock_1ms_control: STD_LOGIC;
  signal count_1s_control : INTEGER := 0;
  signal clock_1s_control: STD_LOGIC;
  signal count_game_control : INTEGER := 0;
  signal clock_game_control: STD_LOGIC;
  signal clock_game_control_count: STD_LOGIC := '0';
  signal initial_count: Integer := 500;
begin

    process(clock, initial_count)
    begin
        if rising_edge(clock) then
            if count_1ms_control = 100000 then  -- ~1ms refresh rate
                clock_1ms_control <= NOT clock_1ms_control;
                count_1ms_control <= 0;
                count_1s_control <= count_1s_control + 1;
                count_game_control <= count_game_control + 1;
            else
                count_1ms_control <= count_1ms_control + 1;
            end if;
            if count_1s_control = 500 then -- 500 ms, 1 cycle 1 second
                clock_1s_control <= NOT clock_1s_control;
                count_1s_control <= 0;
            end if;
            if count_game_control > initial_count then -- 500 ms, 1 cycle 1 second
                clock_game_control <= NOT clock_game_control;
                count_game_control <= 0;
            else
                initial_count <= initial_count;
            end if;
        end if;
    end process;
    
    process(update_game_clock, reset_clock, clock_game_control_count, clock_game_control, initial_count)
    begin
        if (reset_clock = '1') then
          initial_count <= 500;
        elsif (update_game_clock ='1' and clock_game_control_count = '1') then
            clock_game_control_count <= '0';
            if(initial_count - 40 > 0) then
                initial_count <= initial_count - 40;
            else 
                initial_count <= 40;
            end if;
         elsif (update_game_clock ='0' and clock_game_control_count = '0') then
            clock_game_control_count <= '1'; 
            initial_count <= initial_count;
         else
            clock_game_control_count <=clock_game_control_count;
            initial_count <= initial_count;
        end if;
    end process;
    
    clock_1ms <= clock_1ms_control;
    clock_1s  <= clock_1s_control;
    clock_game <= clock_game_control;
end Behavioral;
