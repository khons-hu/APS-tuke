----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2022 03:45:47 PM
-- Design Name: 
-- Module Name: mul_6_tb - Behavioral
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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mul_6_tb is
--  Port ( );
end mul_6_tb;

architecture Behavioral of mul_6_tb is

    component mul_6 is Port (
         A : in STD_LOGIC_VECTOR(5 downto 0);
         B : in STD_LOGIC_VECTOR(5 downto 0);
         Y : out STD_LOGIC_VECTOR(11 downto 0));
   end component;
         
    signal A : STD_LOGIC_VECTOR(5 downto 0);
    signal B : STD_LOGIC_VECTOR(5 downto 0);
    signal Y : STD_LOGIC_VECTOR(11 downto 0);

begin

uut: mul_6 port map (
    A => A,                                    
    B => B,
    Y => Y
);

mul_6_tb: process
begin
    
    for i in 0 to 63 loop
        for j in 0 to 63 loop
            A <= std_logic_vector(to_unsigned(i, A'length));
            B <= std_logic_vector(to_unsigned(j, B'length));
            wait for 10 ns;
        end loop;
    end loop;
    
end process;

end Behavioral;
