----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 03:06:15 PM
-- Design Name: 
-- Module Name: gray2bcd_tb - Behavioral
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

entity gray2bcd_tb is
--  Port ( );
end gray2bcd_tb;

architecture Behavioral of gray2bcd_tb is

component gray2bcd
Port ( gray: in STD_LOGIC_VECTOR(3 downto 0); bcd : out STD_LOGIC_VECTOR(3 downto 0) );
end component;

signal gray : std_logic_vector(3 downto 0);
signal bcd : std_logic_vector(3 downto 0);

begin

uut: gray2bcd port map (gray => gray, bcd => bcd);

tst: process
begin

for i in 0 to 1 loop
    for j in 0 to 1 loop
        for k in 0 to 1 loop
            for l in 0 to 1 loop
            
                if (i = 0) then gray(3) <= '0'; else gray(3) <= '1'; end if;
                if (j = 0) then gray(2) <= '0'; else gray(2) <= '1'; end if;
                if (k = 0) then gray(1) <= '0'; else gray(1) <= '1'; end if;
                if (l = 0) then gray(0) <= '0'; else gray(0) <= '1'; end if;
                
                wait for 10 ns;
            
            end loop;
        end loop;
    end loop;
end loop;

end process;


end Behavioral;
