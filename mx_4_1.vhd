----------------------------------------------------------------------------------
-- Company:  
-- Engineer:
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: mx4_1_with_select - Behavioral
-- Project Name: vhdl_02
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

entity mx4_1_with_select is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC);
end mx4_1_with_select;

architecture Behavioral of mx4_1_with_select is

begin

	with S select
        y <= D(0) when "00",
             D(1) when "01",
             D(2) when "10",
             D(3) when others;

end Behavioral;
