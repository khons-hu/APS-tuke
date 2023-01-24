----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2019 13:22:43
-- Design Name: 
-- Module Name: parity_generator - Behavioral
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

entity parity_generator is
    generic(sel : natural := 0; width : natural := 8);
    Port ( D : in STD_LOGIC_VECTOR (width-1 downto 0);
           parity : out STD_LOGIC);
end parity_generator;

architecture Behavioral of parity_generator is

    signal P : std_logic_vector(width-1 downto 0);

begin

    P(0) <= D(0);
    GEN: for i in 1 to width-1 generate
        P(i) <= P(i-1) xor D(i); 
    end generate;

    EVEN : if sel = 0 generate
        parity <= P(width-1); 
    end generate;

    ODD : if sel = 1 generate
        parity <= not P(width-1); 
    end generate;

end Behavioral;
