----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: concurrent_signal_assignment - Behavioral
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

entity concurrent_signal_assignment is

    Port ( a,b,c : in STD_LOGIC;
           y : out STD_LOGIC);
           
end concurrent_signal_assignment;

architecture Behavioral of concurrent_signal_assignment is

-- Signal declarations
signal not_a_and_not_B : STD_LOGIC;
signal not_b_and_not_c : STD_LOGIC;
signal a_and_b_and_c   : STD_LOGIC;

begin

    not_a_and_not_B <= (not a) and (not b); -- {0,1}
    not_b_and_not_c <= (not b) and (not c); -- (0,4}
    a_and_b_and_c   <= a and b and c; 		-- {7}
    
    y <= not_a_and_not_B or not_b_and_not_c or a_and_b_and_c;

end Behavioral;
