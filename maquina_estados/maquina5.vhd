library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eliminador_vibracao is
    Port (
        clk : in STD_LOGIC;
        X   : in STD_LOGIC;
        S   : out STD_LOGIC
    );
end eliminador_vibracao;

architecture Behavioral of eliminador_vibracao is
    type state_type is (S0, S1, S2, S3, S4, S5);
    signal current_state, next_state : state_type;
begin

    -- Flip-flops tipo D
    process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, X)
    begin
        case current_state is
            when S0 =>
                if X = '1' then
                    next_state <= S1;
                else
                    next_state <= S0;
                end if;
            when S1 =>
                if X = '1' then
                    next_state <= S2;
                else
                    next_state <= S0;
                end if;
            when S2 =>
                if X = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
            when S3 =>
                if X = '1' then
                    next_state <= S3;
                else
                    next_state <= S4;
                end if;
            when S4 =>
                if X = '1' then
                    next_state <= S3;
                else
                    next_state <= S5;
                end if;
            when S5 =>
                if X = '1' then
                    next_state <= S3;
                else
                    next_state <= S0;
                end if;
            when others =>
                next_state <= S0;  
        end case;
        -- Output logic
        case current_state is
            when S0 =>
                S <= '0';
            when S1 =>
                S <= '0';
            when S2 =>
                S <= '0';
            when S3 =>
                S <= '1';
            when S4 =>
                S <= '1';  
            when S5 =>
                S <= '1';
            when others =>
                S <= '0';
        end case;
    end process;
end Behavioral;