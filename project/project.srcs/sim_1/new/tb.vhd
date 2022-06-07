library IEEE;
use IEEE.std_logic_1164.all;

entity tb is
end tb;

architecture testbench of tb is
    component project
        port(Clock, Reset : in std_logic;
         M            : in std_logic_vector(2 downto 0);
         L            : in std_logic;
         T            : in std_logic;
         detector_out : out std_logic;
         seg          : out std_logic_vector(6 downto 0));
    end component;
    signal Clock_TB, Reset_TB : std_logic;
    signal M_TB : std_logic_vector(2 downto 0);
    signal L_TB, T_TB, detector_TB : std_logic;
    signal seg_TB : std_logic_vector(6 downto 0);
begin
    DUT : project port map(Clock_TB, Reset_TB, M_TB, L_TB, T_TB, detector_TB, seg_TB);
    
    STIM : process
    begin
        for i_clock in 0 to 1 loop
            for i_reset in 0 to 1 loop
                for i_m in 0 to 7 loop
                    for i_l in 0 to 1 loop
                        for i_t in 0 to 1 loop
                            Clock_Tb <= std_logic_vector(to_unsigned(i,1))(0);
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
    end process;
end testbench;
