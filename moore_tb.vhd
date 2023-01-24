----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:09:52 PM
-- Design Name: 
-- Module Name: moore_tb - Behavioral
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

entity moore_tb is
--  Port ( );
end moore_tb;

architecture Behavioral of moore_tb is
component moore is 
  Port ( clk, rst, din : in std_logic;
       dout : out std_logic);
end component moore;

signal clk, rst, din : std_logic := '0';
signal dout : std_logic;
constant period : time := 50ns;
constant test : std_logic_vector(0 to 15) := "0010100000001010";

begin
UUT: moore port map(clk => clk, rst => rst, din => din, dout => dout);
clkp : process
begin
clk <= not clk after period/2;
end process clkp;

stimp : process
begin
rst <= '1', '0' after 100ns;
wait until rst'event and rst = '0';
for i in 0 to 15 loop
wait until clk'event and clk = '1';
din <= test(i);
end loop;
wait;
end process stimp;

end Behavioral;
