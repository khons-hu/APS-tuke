----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: number_representation - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity number_representation is
    Port ( sign : in STD_LOGIC;                                     
           Magnitude : in STD_LOGIC_VECTOR (6 downto 0);            
           Signed_magnitude : out STD_LOGIC_VECTOR (7 downto 0);    
           Ones_complement : out STD_LOGIC_VECTOR (7 downto 0);
           Twos_complement : out STD_LOGIC_VECTOR (7 downto 0));
end number_representation;

architecture Behavioral of number_representation is
    signal Tmp : std_logic_vector(7 downto 0);
begin

        Signed_magnitude <= sign & Magnitude;
        Tmp <= ('0' & Magnitude) when sign = '0' else ('1' & not(Magnitude));
        Ones_complement <= Tmp;
        Twos_complement <= Tmp when sign = '0' else std_logic_vector(unsigned(Tmp)+1);

end Behavioral;
