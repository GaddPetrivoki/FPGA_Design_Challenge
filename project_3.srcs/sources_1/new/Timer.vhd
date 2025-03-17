library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Timer is
  Port (
    clock        : IN STD_LOGIC;
    clock_1ms    : OUT STD_LOGIC;
    clock_1s     : OUT STD_LOGIC
  );
end Timer;

architecture Behavioral of Timer is
  signal count_1ms_control : INTEGER := 0;
  signal clock_1ms_control: STD_LOGIC;
  signal count_1s_control : INTEGER := 0;
  signal clock_1s_control: STD_LOGIC;
begin

    process(clock)
    begin
        if rising_edge(clock) then
            if count_1ms_control = 100000 then  -- ~1ms refresh rate
                clock_1ms_control <= NOT clock_1ms_control;
                count_1ms_control <= 0;
                count_1s_control <= count_1s_control + 1;
            else
                count_1ms_control <= count_1ms_control + 1;
            end if;
            if count_1s_control = 500 then -- 500 ms, 1 cycle 1 second
                clock_1s_control <= NOT clock_1s_control;
                count_1s_control <= 0;
            end if;
        end if;
    end process;
    
    clock_1ms <= clock_1ms_control;
    clock_1s  <= clock_1s_control;
end Behavioral;
