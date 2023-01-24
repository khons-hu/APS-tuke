----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: d_latch - Behavioral
-- Project Name: vhdl_04
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

entity d_latch is
    Port ( d    : in STD_LOGIC;
           en   : in STD_LOGIC; --podla toho bude prepnute
           q    : out STD_LOGIC); -- output, co bude vlastne len vysimulovany dole
end d_latch;

architecture Behavioral of d_latch is

begin

    DFF_LATCH_EN: process(d, en) is
    begin	
        if (en = '1') then
            q <= d;
        end if;            
    end process;

end Behavioral;
