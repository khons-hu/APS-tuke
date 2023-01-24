----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2022 01:45:35 PM
-- Design Name: 
-- Module Name: sop - Behavioral
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


--UDNF
--[0,1,4,10] - these numbers are 0 in the truth table (see ppi uknf/udnf setup)


--4 input values(a, b, c, d) <- (std_logic is a bit - 0 or 1, in VHDL when assigning those values (testbench), using them as '0' and '1')
--1 output value(f) <- f(a, b, c, d) - output value(s) from the truth table (0 or 1, in ppi we also had undefined(x), don't know if it will be needed because it could make the testbench more difficult)
entity sop is
  Port ( a, b, c, d : in std_logic;
        f : out std_logic );
end sop;

architecture Behavioral of sop is

begin
    
    f <= ((not a and not b and c and not d) or 
    (not a and not b and c and d) or 
    (not a and b and not c and d) or 
    (not a and b and c and not d) or 
    (not a and b and c and d) or 
    (a and not b and not c and not d) or 
    (a and not b and not c and d) or 
    (a and not b and c and d) or 
    (a and b and not c and not d) or 
    (a and b and not c and d) or 
    (a and b and c and not d) or 
    (a and b and c and d));

end Behavioral;
