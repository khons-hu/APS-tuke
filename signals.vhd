----------------------------------------------------------------------------------
-- Company:  incelSoft
-- Engineer: macka
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: signals - Behavioral
-- Project Name: vhdl_01
-- Target Devices: xc7a35tcpg236-1
-- Tool Versions: 
-- Description: meow
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

entity signals is
    Port ( a3, a2, a1, a0 : in  STD_LOGIC;
           b3, b2, b1, b0 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end signals;

--Uk·ûka RTL schÈmy:
--Zobraziù RTL a Technologick˙ schÈmu pre
-- Architekt˙ru Behavioral_1 (zakomentujte blok Behavioral_2)
-- Architekt˙ru Behavioral_2 (zakomentujte blok Behavioral_1)
--Vöimnite si rozdiel !

architecture Behavioral_1 of signals is
begin

    y <= (a3 xnor b3) and (a2 xnor b2) and (a1 xnor b1) and (a0 xnor b0); --
	
end Behavioral_1;

--architecture Behavioral_2 of signals is
--    signal a3b3, a2b2, a1b1, a0b0 : std_logic;
--    signal upper_half, lower_half : std_logic;
--begin
	
--    a3b3 <= a3 xnor b3; 
--    a2b2 <= a2 xnor b2; 
--    a1b1 <= a1 xnor b1; 
--    a0b0 <= a0 xnor b0;
    
--    upper_half <= a3b3 and a2b2;    
--    lower_half <= a1b1 and a0b0;    
    
--    y <= upper_half and lower_half;

--end Behavioral_2;
