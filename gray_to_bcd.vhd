----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 06:11:07 PM
-- Design Name: 
-- Module Name: gray_to_bcd - Behavioral
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

entity gray_to_bcd is
  Port ( gray : in std_logic_vector(3 downto 0);
         bcd : out std_logic_vector(3 downto 0) );
end gray_to_bcd;

architecture Behavioral of gray_to_bcd is

begin

bcd(3 downto 0) <= (gray(3), gray(3) xor gray(2), gray(3) xor gray(2) xor gray(1), gray(3) xor gray(2) xor gray(1) xor gray(0));


end Behavioral;
