----------------------------------------------------------------------------------
-- Company:  incelSoft
-- Engineer: macka
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: gates - Behavioral
-- Project Name: vhdl_01
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

entity gates is
    Port ( a : in STD_LOGIC;        
           b : in STD_LOGIC;        
           y_not : out STD_LOGIC;
           y_and : out STD_LOGIC;
           y_or : out STD_LOGIC;
           y_nand : out STD_LOGIC;
           y_nor : out STD_LOGIC;
           y_xor : out STD_LOGIC;
           y_xnor : out STD_LOGIC);
end gates;

architecture Behavioral of gates is

begin

    y_not <= not a; 
    y_and <= a and b;
    y_or <= a or b;
    y_nand <= a nand b;
    y_nor <= a nor b;
    y_xor <= a xor b;
    y_xnor <= a xnor b;
    
end Behavioral;
