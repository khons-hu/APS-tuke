----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date:
-- Design Name: 
-- Module Name: mult_5x5u_5x5u - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

--This entity performs these operations: 
--    XY2 <= std_logic_vector(unsigned(X2) * unsigned(Y2));
--    XY1 <= std_logic_vector(unsigned(X1) * unsigned(Y1));

entity mult_5x5u_5x5u is
    Port ( X2, Y2 : in STD_LOGIC_VECTOR (4 downto 0); --high-order bits
           X1, Y1 : in STD_LOGIC_VECTOR (4 downto 0); --low-order bits
           XY2 : out STD_LOGIC_VECTOR (9 downto 0); --high-order bits    
           XY1 : out STD_LOGIC_VECTOR (9 downto 0));--low-order bits
end mult_5x5u_5x5u;

architecture Behavioral of mult_5x5u_5x5u is
    
    signal A, B : std_logic_vector(17 downto 0);
    signal P : std_logic_vector(35 downto 0);

begin

    A(17 downto 12) <= '0' & X2;
    A(11 downto 5) <= (others => '0');
    A(4 downto 0) <= X1;
    
    B(17 downto 12) <= '0' & Y2;
    B(11 downto 5) <= (others => '0');
    B(4 downto 0) <= Y1;

    -- MULT18X18: 18 x 18 signed asynchronous multiplier
    MULT18X18_inst : MULT18X18 port map (
        P => P, -- 36-bit multiplier output
        A => A, -- 18-bit multiplicand input
        B => B -- 18-bit multiplier input
    );

    XY2 <= P(33 downto 24);
    XY1 <= P(9 downto 0);

end Behavioral;
