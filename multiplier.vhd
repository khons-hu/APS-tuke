----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: mult18x18 - Behavioral
-- Project Name: vhdl_03
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
library UNISIM;
use UNISIM.VComponents.all;

entity multiplier is
    Port ( A, B : in STD_LOGIC_VECTOR (17 downto 0);    -- 18-bit multiplicand A and multiplier B 
                                                        -- The Multiplicand is the number taken or multiplied.
                                                        -- The Multiplier is the number denoting how many times the multiplicand is taken.
           P : out STD_LOGIC_VECTOR (35 downto 0));     -- 36-bit multiplier output
end multiplier;

--architecture Behavioral of multiplier is

--begin

--    P <= std_logic_vector(signed(A) * signed(B));

--end Behavioral;

architecture Structural of multiplier is

begin

    -- MULT18X18: 18 x 18 signed asynchronous multiplier
    MULT18X18_inst : MULT18X18 port map (
        P => P, -- 36-bit multiplier output
        A => A, -- 18-bit multiplicand input
        B => B  -- 18-bit multiplier input
    );
    
    --doplnit

end Structural;
