library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_jk is
    Port (
        clk : in STD_LOGIC;
        X   : in STD_LOGIC;
        S   : out STD_LOGIC 
    );
end detector_jk;

architecture Behavioral of detector_jk is
    signal state     : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal next_state: STD_LOGIC_VECTOR(2 downto 0);
begin

    process(clk)
    begin
        if rising_edge(clk) then
            state <= next_state;
        end if;
    end process;
    
    process(state, X)
    begin
        case state is
            when "000" =>
                if X = '0' then
                    next_state <= "001";
                else
                    next_state <= "011";
                end if;
            when "001" =>
                if X = '0' then
                    next_state <= "010";
                else
                    next_state <= "011";
                end if;
            when "010" =>
                if X = '0' then
                    next_state <= "010";
                else
                    next_state <= "011";
                end if;
            when "011" =>
                if X = '1' then
                    next_state <= "100";
                else
                    next_state <= "001";
                end if;
            when others =>
                next_state <= "000";  -- Reset to initial state
            end case;
        end process;

    process(state)
    begin
        case state is
            when "000" =>
                S <= '0';
            when "001" =>
                S <= '0';
            when "010" =>
                S <= '1';
            when "011" =>
                S <= '0';  -- Estado S4
            when "100" =>
                S <= '1';
            when others =>
                S <= '0';  -- Default case
        end case;
    end process;
end Behavioral;