library IEEE;
use IEEE.std_logic_1164.all;

entity project is
    port(Clock, Reset : in std_logic;
         M            : in std_logic_vector(2 downto 0);
         L            : in std_logic;
         T            : in std_logic;
         detector_out : out std_logic;
         seg          : out std_logic_vector(6 downto 0));
end project;



architecture Bihavioral of project is
    type State_Type is(One, Zero);
    signal current_state, next_state : State_Type;
    signal current_state_bit : std_logic;
    
    component seven_segment
        port(ABC : in std_logic_vector(2 downto 0);
             state : in std_logic;
             F      : out std_logic_vector(6 downto 0));
    end component;
    
---------------------------------------------------
begin
    with(current_state) select
        current_state_bit <= '1' when One,
                             '0' when Zero;
        
    u1 : seven_segment port map(ABC => M, state=>current_state_bit, F=>seg);


    STATE_MEMORY : process(Clock, Reset)
    begin
        if(Reset = '0') then
            current_state <= Zero;
        elsif(Clock'event and Clock='1') then
            current_state <= next_state;
        end if;
    end process;
---------------------------------------------------
    NEXT_STATE_LOGIC : process(current_state, M, L, T)
    begin
        case(current_state) is
            when Zero => if((T='0' and L='0') and M>"011") then
                            current_state <= Zero;
                        elsif((T='0' and L='0') and M<="011") then
                            current_state <= One;
                        elsif((T='1' or L='1') and M<="001") then
                            current_state <= One;
                        elsif((T='1' or L='1') and M>"001") then
                            current_state <= Zero;
                        end if;
            when One => if((T='0' and L='0') and M<"111") then
                            current_state <= One;
                        elsif(M >="111") then
                            current_state <= Zero;
                        elsif((T='1' or L='1') and M<"011") then
                            current_state <= One;
                        elsif((T='1' or L='1') and M>="011") then
                            current_state <= Zero;
                        end if;      
        end case;
    end process;
-------------------------------------------------------

    OUTPUT_LOGIC : process(current_state, M, L, T)
    begin
        if(T='0' and L='0') then
            detector_out <= '1';
        else
            detector_out <= '0';
        end if;
        if(current_state = Zero) then
            seg <= "-------";
        end if;
        
        
    end process;
end architecture;