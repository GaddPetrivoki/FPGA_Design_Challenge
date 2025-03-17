----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2025 12:12:54 PM
-- Design Name: 
-- Module Name: led_test_tb - Behavioral
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
use std.textio.all;
use ieee.std_logic_textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_test_tb is
--  Port ( );
end led_test_tb;

architecture Behavioral of led_test_tb is

 component led_test
      Port ( clk : in STD_LOGIC;
              an : out STD_LOGIC_VECTOR(3 downto 0);
              seg : out STD_LOGIC_VECTOR(6 downto 0));
  end component;
  
   signal clk: STD_LOGIC;
   signal an: STD_LOGIC_VECTOR(3 downto 0);
   signal seg: STD_LOGIC_VECTOR(6 downto 0);
   constant clock_period: time := 10 ns;
   signal stop_the_clock: boolean;
  
begin
    
    uut: led_test port map ( clk => clk,
                             an => an,
                             seg => seg);
                             
   stimulus: process
   begin
       wait for 5 ms;
       stop_the_clock <= true;
       wait;
   end process;  
                              
  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end Behavioral;
