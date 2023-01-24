----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2022 03:36:32 PM
-- Design Name: 
-- Module Name: mul_6 - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul_6 is
  Port ( A : in STD_LOGIC_VECTOR(5 downto 0);
         B : in STD_LOGIC_VECTOR(5 downto 0);
         Y : out STD_LOGIC_VECTOR(11 downto 0) );
end mul_6;

architecture Behavioral of mul_6 is
    signal res : integer;
    signal res_vec : STD_LOGIC_VECTOR(11 downto 0);
begin


    res <= to_integer(unsigned(A)) * to_integer(unsigned(B));
    res_vec <= std_logic_vector(to_unsigned(res, res_vec'length));
    Y <= res_vec;

end Behavioral;
