----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/05/2022 02:12:33 PM
-- Design Name: 
-- Module Name: div5_tb - Behavioral
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

entity div5_tb is
--  Port ( );
end div5_tb;

architecture Behavioral of div5_tb is
component div5 is
 Port ( clk, rst, din : in std_logic;
       dout : out std_logic);
end component div5;
signal clk, rst, din : std_logic := '0';
signal dout : std_logic;
constant period : time := 20ns;


begin


end Behavioral;
