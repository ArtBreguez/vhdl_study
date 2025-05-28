library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity eliminador_vibracao_tb is
end eliminador_vibracao_tb;

architecture Behavioral of eliminador_vibracao_tb is

    type state_type is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : state_type;
    signal clk : STD_LOGIC := '0';
    signal X   : STD_LOGIC := '0';
    signal S   : STD_LOGIC;
    
begin
    DUT: entity work.eliminador_vibracao
        port map (
            clk => clk,
            X   => X,
            S   => S
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

        X <= '1';
        wait for 100 ns;
        X <= '1';
        wait for 100 ns;

        X <= '1';
        wait for 100 ns;
        X <= '0'; 
        wait for 100 ns;

        X <= '0';
        wait for 100 ns;
        X <= '0';
        wait for 100 ns;

        wait;
    end process;
end Behavioral;