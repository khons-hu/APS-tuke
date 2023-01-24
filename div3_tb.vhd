----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:33:35 PM
-- Design Name: 
-- Module Name: div3_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity div3_tb is
--  Port ( );
end div3_tb;

architecture Behavioral of div3_tb is
component div3 is
  Port ( clk, rst, din : in std_logic;
       dout : out std_logic_vector(1 downto 0) );
end component div3;

signal clk, rst, din : std_logic := '0';
signal dout : std_logic_vector(1 downto 0);

constant period : time := 20ns;
constant number : integer := 3;

constant tester : std_logic_vector(0 to 15) := std_logic_vector(to_unsigned(number, 8));

begin
UUT: div3 port map(clk => clk, rst => rst, din => din, dout => dout);

clkp : process
begin
clk <= not clk after period/2;
end process clkp;

stimp : process
variable test : integer := 0;

begin
for num in 0 to 255 loop
rst <= '1';
tester <= std_logic_vector(to_unsigned(num, 8));
wait for period;
rst <= '0';

for i in 0 to 7 loop
din <= tester(i);
wait for period;

end loop;

wait for period;

test := num mod 3;
assert test = to_integer(unsigned(dout));
report "error at number = " & integer'image(num)
severity failure;
end loop;
wait;
end process stimp;


end Behavioral;
