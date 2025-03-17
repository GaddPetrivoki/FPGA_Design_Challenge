library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Button is
  Port (
    clock         : IN STD_LOGIC;        -- 100 MHz Clock Input
    button_input  : IN STD_LOGIC;        -- Button input
    button_output : OUT STD_LOGIC        -- Button output clean
  );
end Button;

architecture Behavioral of Button is
  signal debounce_count : INTEGER := 0;  -- Contador para debounce
  signal button_reg     : STD_LOGIC := '0';  -- Registro para el valor limpio del botón
  signal button_ffs     : STD_LOGIC_VECTOR(1 downto 0) := "00";  -- Flip-flop
begin
   
    process(clock)
    begin
        if rising_edge(clock) then
            button_ffs <= button_ffs(0) & button_input;
            if button_ffs(1) /= button_reg then
                debounce_count <= debounce_count + 1;
                if (debounce_count = 2000000) then
                    button_reg <= button_ffs(1);
                    debounce_count <= 0;
                end if;
            else
                debounce_count <= 0;
            end if;
        end if; 
    end process;
    
    button_output <= button_reg;
end Behavioral;
