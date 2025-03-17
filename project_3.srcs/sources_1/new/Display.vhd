library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Display is
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
end Display;

architecture Behavioral of Display is
  signal anode_control : INTEGER range 0 to 3 := 0; -- Controls active display
  signal seg_output : STD_LOGIC_VECTOR(6 downto 0); -- Holds 7-segment pattern
  signal seg_reg : STD_LOGIC_VECTOR(6 downto 0); -- Registered output
  signal an_reg  : STD_LOGIC_VECTOR(3 downto 0); -- Registered output
begin
    
    process(anode_control, seg_0, seg_1, seg_2, seg_3)
    begin
       case anode_control is
            when 0 => seg_output <= seg_0;
            when 1 => seg_output <= seg_1;
            when 2 => seg_output <= seg_2;
            when 3 => seg_output <= seg_3;
            when others => seg_output <= "0000000"; -- Default (Blank)
       end case;
    end process;

    
    process(clock_1ms)
    begin
        if rising_edge(clock_1ms) then
            anode_control <= (anode_control + 1) mod 4;
        end if;
    end process;
    

    process(clock)
    begin
        if rising_edge(clock) then
            seg_reg <= seg_output;
            case anode_control is
                when 0 => an_reg <= "0111"; -- Enable leftmost display
                when 1 => an_reg <= "1011"; -- Enable second display
                when 2 => an_reg <= "1101"; -- Enable third display
                when 3 => an_reg <= "1110"; -- Enable rightmost display
                when others => an_reg <= "1111"; -- Default (all off)
            end case;
        else
            seg_reg <= seg_reg;
            an_reg <= an_reg;
        end if;
    end process;
    
    seg <= seg_reg;
    an  <= an_reg;
end Behavioral;
