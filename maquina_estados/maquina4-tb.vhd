library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity detector_jk_tb is
end detector_jk_tb;

architecture Behavioral of detector_jk_tb is

    signal clk : STD_LOGIC := '0';
    signal X   : STD_LOGIC := '0';
    signal S   : STD_LOGIC := '0';

begin
    DUT: entity work.detector_jk
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
        -- Primeiro ciclo: X = 0 (default)
        wait for 100 ns;

        -- Dois '1's consecutivos → Deve ativar S = '1' (estado S4)
        X <= '1';
        wait for 100 ns;
        X <= '1';
        wait for 100 ns;

        -- Alternância: volta para S3 e depois S1
        X <= '0';
        wait for 100 ns;
        X <= '0';  -- Dois '0's consecutivos → Deve ativar S = '1' (estado S2)
        wait for 100 ns;

        -- Outro caso para verificar
        X <= '1';
        wait for 100 ns;
        X <= '1';
        wait for 100 ns;

        -- Finalizar simulação
        wait;
    end process;


end Behavioral;