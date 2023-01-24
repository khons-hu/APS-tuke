----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 03:00:53 PM
-- Design Name: 
-- Module Name: gray2bcd - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gray2bcd is
  Port ( 
  gray: in STD_LOGIC_VECTOR(3 downto 0); 
  bcd : out STD_LOGIC_VECTOR(3 downto 0) );
end gray2bcd;

architecture Behavioral of gray2bcd is
signal tmp : std_logic_vector(3 downto 0);
begin

process(gray)
variable tmp_vec : std_logic_vector(3 downto 0);
variable control : integer;
begin

tmp_vec(3) := gray(3);
for i in 2 downto 0 loop
    tmp_vec(i) := tmp_vec(i + 1) xor gray(i);
end loop;

control := to_integer(unsigned(tmp_vec));

if (control > 9) then
    tmp <= "XXXX";
else 
    tmp <= tmp_vec;
end if;

end process;

bcd <= tmp;


end Behavioral;
