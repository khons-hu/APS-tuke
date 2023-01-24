----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:09:40 PM
-- Design Name: 
-- Module Name: moore - Behavioral
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

entity moore is
  Port ( clk, rst, din : in std_logic;
         dout : out std_logic);
end moore;

architecture Behavioral of moore is
type states is (S0, S1, S2);
signal state, next_state : states := S0;
begin

clkp : process(rst,clk)
begin
if rst = '1' then state <= S0;
elsif (rising_edge(clk)) then state <= next_state;
end if;
end process clkp;

stimp : process(state, din)
begin
case (state) is
when S0 =>
if din = '1' then next_state <= S0;
else next_state <= S1;
end if;

when S1 =>
if din = '1' then next_state <= S2;
else next_state <= S1;
end if;

when S2 =>
if din = '1' then next_state <= S0;
else next_state <= S1;
end if; 

when others =>
next_state <= S0;

end case;
end process stimp;

dout <= '1' when state = S0 else '0';

end Behavioral;
