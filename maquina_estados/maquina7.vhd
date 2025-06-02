library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador_modo is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        x     : in  STD_LOGIC;  -- Controle do modo (0=Gray, 1=Binário)
        count : out STD_LOGIC_VECTOR(2 downto 0)
    );
end contador_modo;

architecture Behavioral of contador_modo is
    signal current_state : unsigned(2 downto 0) := "000";
    signal next_state    : unsigned(2 downto 0);
begin
    -- Processo síncrono para atualização do estado
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= "000";
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    -- Lógica combinacional para próximo estado
    process(current_state, x)
    begin
        if x = '1' then  -- Modo binário
            next_state <= current_state + 1;
        else             -- Modo Gray
            case current_state is
                when "000" => next_state <= "001";
                when "001" => next_state <= "011";
                when "011" => next_state <= "010";
                when "010" => next_state <= "110";
                when "110" => next_state <= "111";
                when "111" => next_state <= "101";
                when "101" => next_state <= "100";
                when "100" => next_state <= "000";
                when others => next_state <= "000";
            end case;
        end if;
    end process;

    -- Saída
    count <= std_logic_vector(current_state);
end Behavioral;