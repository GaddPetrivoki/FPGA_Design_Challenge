library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity led_test_tb is
end led_test_tb;

architecture Behavioral of led_test_tb is
    -- Component declaration for the Unit Under Test (UUT)
    component led_test
        Port (
            clock   : IN STD_LOGIC;
            buttons : IN STD_LOGIC_VECTOR(4 downto 0);
            an      : OUT STD_LOGIC_VECTOR(3 downto 0);
            seg     : OUT STD_LOGIC_VECTOR(6 downto 0);
            led     : OUT STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Testbench signals
    signal clock   : STD_LOGIC := '0';
    signal buttons : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
    signal an      : STD_LOGIC_VECTOR(3 downto 0);
    signal seg     : STD_LOGIC_VECTOR(6 downto 0);
    signal led     : STD_LOGIC_VECTOR(15 downto 0);

    -- Clock period definition
    constant clock_period : time := 10 ns; -- 100 MHz clock

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: led_test
        Port Map (
            clock   => clock,
            buttons => buttons,
            an      => an,
            seg     => seg,
            led     => led
        );

    -- Clock generation process
    clock_process: process
    begin
        while now < 100 ms loop -- Run the simulation for 100 ms
            clock <= '0';
            wait for clock_period / 2;
            clock <= '1';
            wait for clock_period / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stimulus_process: process
    begin
        -- Initialize inputs
        buttons <= (others => '0');
        wait for 10 ns;

        -- Simulate button presses
        buttons(4) <= '1'; -- Press the center button
        wait for 10 ns;
        buttons(4) <= '0'; -- Release the center button
        wait for 10 ns;

        buttons(0) <= '1'; -- Press the left button
        wait for 10 ns;
        buttons(0) <= '0'; -- Release the left button
        wait for 10 ns;

        buttons(1) <= '1'; -- Press the right button
        wait for 10 ns;
        buttons(1) <= '0'; -- Release the right button
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

    -- Monitor process (optional)
    monitor_process: process
    begin
        wait for 1 ms; -- Wait for initial setup
        report "Simulation started.";

        -- Monitor LED outputs
        wait until led /= "0000000000000000";
        report "LEDs changed: " & integer'image(to_integer(unsigned(led)));

        -- Monitor 7-segment display outputs
        wait until an /= "1111";
        report "7-segment display enabled: " & integer'image(to_integer(unsigned(an)));
        report "7-segment display value: " & integer'image(to_integer(unsigned(seg)));

        -- End simulation
        wait;
    end process;
end Behavioral;