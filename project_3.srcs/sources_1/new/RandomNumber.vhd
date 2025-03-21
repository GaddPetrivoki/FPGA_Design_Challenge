library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RandomNumber is
  Port (
    clock           : IN STD_LOGIC;
    read            : IN STD_LOGIC;
    random_number   : OUT STD_LOGIC_VECTOR(3 downto 0)
  );
end RandomNumber;

architecture Behavioral of RandomNumber is
  signal counter        : UNSIGNED(23 downto 0) := (others => '0');
  signal random_reg     : UNSIGNED(3 downto 0) := "0001";
  signal read_captured  : STD_LOGIC := '0';
  signal mixed_bits     : UNSIGNED(3 downto 0);
begin

    process(clock)
    begin
        if rising_edge(clock) then
            counter <= counter + 1;
            if read = '0' then
                read_captured <= '0';
            elsif read = '1' and read_captured = '0' then
                read_captured <= '1';
                mixed_bits <= counter(3 downto 0) xor counter(7 downto 4);
                if mixed_bits = 0 then
                    random_reg <= "0011"; -- Si es 0, forzar a 1
                else
                    random_reg <= mixed_bits;
                end if;
            end if;
        end if;
    end process;

    random_number <= STD_LOGIC_VECTOR(random_reg);

end Behavioral;