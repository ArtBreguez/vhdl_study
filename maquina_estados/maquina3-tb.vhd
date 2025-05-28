library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity maquina3_tb is
end maquina3_tb;

architecture Behavioral of maquina3_tb is

    signal clk : STD_LOGIC := '0';
    signal x : STD_LOGIC := '0';
    signal z : STD_LOGIC;
begin
    DUT: entity work.maquina3
        port map (
            clk => clk,
            x => x,
            z => z
        );

    clk_process: process
    begin
        clk <= '0';
        wait for 50 ns;  -- Clock period of 50 ns
        clk <= '1';
        wait for 50 ns;
    end process;
    
    test_process: process
    begin
        wait for 100 ns;  
        x <= '1';  -- Set input x to '1'
        wait for 100 ns; 
        x <= '1';  -- Set input x to '0'
        wait;
    end process;
end Behavioral;
