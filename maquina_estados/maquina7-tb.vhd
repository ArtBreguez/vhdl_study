library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_contador_modo is
end tb_contador_modo;

architecture Behavioral of tb_contador_modo is
    component contador_modo
        Port (
            clk   : in  STD_LOGIC;
            reset : in  STD_LOGIC;
            x     : in  STD_LOGIC;
            count : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;

    signal clk   : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '1';
    signal x     : STD_LOGIC := '0';
    signal count : STD_LOGIC_VECTOR(2 downto 0);

    constant CLK_PERIOD : time := 10 ns;
begin
    uut: contador_modo port map (
        clk => clk,
        reset => reset,
        x => x,
        count => count
    );

    -- Geração do clock
    clk_process: process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Processo de teste
    stim_proc: process
    begin
        -- Reset inicial
        wait for 20 ns;
        reset <= '0';
        
        -- Teste modo Gray (x=0)
        x <= '0';
        wait for 80 ns;
        
        -- Teste modo Binário (x=1)
        x <= '1';
        wait for 80 ns;
        
        -- Alternar entre modos
        x <= '0'; wait for 40 ns;
        x <= '1'; wait for 40 ns;
        x <= '0'; wait for 40 ns;
        
        wait;
    end process;
end Behavioral;