library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
entity maquina3 is
    Port ( clk : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end maquina3;

architecture Behavioral of maquina3 is
    type state_type is (S0, S1);
    signal current_state : state_type := S0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            case current_state is
                when S0 =>
                    if x = '1' then
                        current_state <= S1;
                        z <= '0';
                    else
                        current_state <= S0;
                        z <= '0';
                    end if;
                when S1 =>
                    if x = '1' then
                        current_state <= S1;
                        z <= '1';
                    else
                        current_state <= S0;
                        z <= '0';
                    end if;
                end case;
        end if;
    end process;
end Behavioral;