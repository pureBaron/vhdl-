

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seven_segment is
    port(ABC     : in std_logic_vector(2 downto 0);
         state   : in std_logic;
         F       : out std_logic_vector(6 downto 0));
end seven_segment;

architecture Behavioral of seven_segment is

begin
    MAIN_PROCESS : process(ABC)
    begin
        case(state) is
             when '1' => F<="-------";
             when '0' =>
                case(ABC) is
                 when "000" => F<="1111110";
                 when "001" => F<="0110000";
                 when "010" => F<="1101101";
                 when "011" => F<="1111001";
                 when "100" => F<="0110011";
                 when "101" => F<="1011011";
                 when "110" => F<="1011111";
                 when "111" => F<="1110000";
                end case;
        end case;
    end process;
    

                            
end Behavioral;
