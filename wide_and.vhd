----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:05:00 PM
-- Design Name: 
-- Module Name: wide_and - Behavioral
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

entity wide_and is
generic (width : integer := 3);

  Port ( data : in std_logic_vector(width-1 downto 0);
         output: out std_logic  );
end wide_and;

architecture Behavioral of wide_and is
signal tmp_signal : std_logic;
begin

process(data)

variable tmp : std_logic;

begin

tmp := '1';

for i in 0 to width-1 loop
    tmp := tmp and data(i);
end loop;

--tmp_signal <= tmp;
output <= tmp;

end process;

--output <= tmp_signal;


end Behavioral;
