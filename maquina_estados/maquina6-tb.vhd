library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controle_nivel_agua_tb is
end controle_nivel_agua_tb;

architecture Behavioral of controle_nivel_agua_tb is

    -- Componente a ser testado
    component controle_nivel_agua
        Port (
            START : in  STD_LOGIC;
            STOP  : in  STD_LOGIC;
            NMAX  : in  STD_LOGIC;
            NMIN  : in  STD_LOGIC;
            AGUA  : out STD_LOGIC
        );
    end component;

    -- Sinais de estímulo
    signal START : STD_LOGIC := '0';
    signal STOP  : STD_LOGIC := '0';
    signal NMAX  : STD_LOGIC := '0';
    signal NMIN  : STD_LOGIC := '0';
    
    -- Sinal de saída
    signal AGUA : STD_LOGIC;

begin

    -- Instanciação do dispositivo sob teste
    DUT: controle_nivel_agua port map (
        START => START,
        STOP  => STOP,
        NMAX  => NMAX,
        NMIN  => NMIN,
        AGUA  => AGUA
    );

    -- Processo de teste
    test_process: process
    begin
        -- Inicialmente tudo desligado
        wait for 100 ns;
        
        -- Teste 1: Ligar o sistema
        START <= '1';
        wait for 100 ns;
        START <= '0';
        
        -- Teste 2: Nível abaixo do mínimo (deve ligar ÁGUA)
        NMIN <= '0';
        NMAX <= '0';
        wait for 200 ns;
        
        -- Teste 3: Nível atinge o mínimo (mas ainda abaixo do máximo)
        NMIN <= '1';
        wait for 200 ns;
        
        -- Teste 4: Nível atinge o máximo (deve desligar ÁGUA)
        NMAX <= '1';
        wait for 200 ns;
        
        -- Teste 5: Nível cai abaixo do máximo (mas ainda acima do mínimo)
        NMAX <= '0';
        wait for 200 ns;
        
        -- Teste 6: Nível cai abaixo do mínimo (deve ligar ÁGUA novamente)
        NMIN <= '0';
        wait for 200 ns;
        
        -- Teste 7: Desligar o sistema
        STOP <= '1';
        wait for 100 ns;
        STOP <= '0';
        wait for 200 ns;
        
        wait;
    end process;

end Behavioral;