----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 06:36:08 PM
-- Design Name: 
-- Module Name: bcd_to_gray - Behavioral
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

entity bcd_to_gray is
  Port ( bcd : in std_logic_vector(3 downto 0);
         gray : out std_logic_vector(3 downto 0) );
end bcd_to_gray;

architecture Behavioral of bcd_to_gray is

begin

    gray(3 downto 0) <= (bcd(3), bcd(3) xor bcd(2), bcd(2) xor bcd(1), bcd(1) xor bcd(0));


end Behavioral;
