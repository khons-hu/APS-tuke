----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 01:33:25 PM
-- Design Name: 
-- Module Name: div3 - Behavioral
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

entity div3 is
  Port ( clk, rst, din : in std_logic;
         dout : out std_logic_vector(1 downto 0) );
end div3;

architecture Behavioral of div3 is
type states is (S0, S1, S2);
signal state, next_state : states := S0;
begin

clkp : process(clk, rst)
begin
if rst = '1' then state <= S0;
elsif rising_edge(clk) then state <= next_state;
end if;
end process clkp;

stimp : process(state, din)
begin
case (state) is
when S0 =>
if din = '1' then next_state <= S1;
else next_state <= S0;
end if;

when S1 =>
if din = '1' then next_state <= S0;
else next_state <= S2;
end if;

when S2 => if din = '1' then next_state <= S2; else next_state <= S1;
end if;

when others => null;

end case;

if state = S0 then dout <= "00";
elsif state = S1 then dout <= "01";
elsif state = S2 then dout <= "10";
end if;

end process stimp;

end Behavioral;
