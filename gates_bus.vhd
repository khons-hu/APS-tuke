----------------------------------------------------------------------------------
-- Company:  incelSoft
-- Engineer: macka
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: gates_bus - Behavioral
-- Project Name: vhdl_01
-- Target Devices: xc7a35tcpg236-1
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

entity gates_bus is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (6 downto 0)); --tu nepouzijem 1 samostatny byte, ale 7 digit bit vector
                                      -- 0 to 6
                                     
end gates_bus;

architecture Behavioral of gates_bus is

begin

    --zapiseme ich do jednotlyvich indexov vektoru
    Y(6) <= not a;
    Y(5) <= a and b;
    Y(4) <= a or b;
    Y(3) <= a nand b;
    Y(2) <= a nor b;
    Y(1) <= a xor b;
    Y(0) <= a xnor b;
        
--    Y(6 downto 0) <= (not a, a and b, a or b, a nand b, a nor b, a xor b, a xnor b); -- ten isty vysledok, len oneliner
--    Y <= (not a, a and b, a or b, a nand b, a nor b, a xor b, a xnor b);
    
end Behavioral;
