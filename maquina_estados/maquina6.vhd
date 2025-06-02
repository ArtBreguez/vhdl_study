library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controle_nivel_agua is
    Port (
        START : in  STD_LOGIC;
        STOP  : in  STD_LOGIC;
        NMAX  : in  STD_LOGIC;
        NMIN  : in  STD_LOGIC;
        AGUA  : out STD_LOGIC
    );
end controle_nivel_agua;

architecture Behavioral of controle_nivel_agua is
    signal sistema_ligado : STD_LOGIC := '0';
begin
    process(START, STOP, NMAX, NMIN)
    begin
        -- Controle de liga/desliga do sistema
        if START = '1' then
            sistema_ligado <= '1';
        elsif STOP = '1' then
            sistema_ligado <= '0';
        end if;
        
        -- Controle da válvula de água
        if sistema_ligado = '1' then
            if NMIN = '0' then  -- Nível abaixo do mínimo
                AGUA <= '1';     -- Abre válvula
            elsif NMAX = '1' then -- Nível acima do máximo
                AGUA <= '0';      -- Fecha válvula
            end if;
        else
            AGUA <= '0';  -- Sistema desligado, válvula fechada
        end if;
    end process;
end Behavioral;