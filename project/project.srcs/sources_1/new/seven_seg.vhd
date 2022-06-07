----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2022 11:56:47 AM
-- Design Name: 
-- Module Name: seven_seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg is
         port(ABC : in std_logic_vector(2 downto 0);
         F       : out std_logic_vector(6 downto 0)
         );
end seven_seg;

architecture Behavioral of seven_seg is

begin
    with (ABC) select
            F <= "1111110" when "000",
                 "0110000" when "001",
                 "1101101" when "010",
                 "1111001" when "011",
                 "0110011" when "100",
                 "1011011" when "101",
                 "1011111" when "110",
                 "1110000" when "111",
                 "-------" when others;

end Behavioral;
