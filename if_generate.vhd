----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: if_generate - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity if_generate is
    generic(sel : natural := 0);
    Port ( a, b, c, d : in  STD_LOGIC;
           y : out  STD_LOGIC);
end if_generate;

architecture Behavioral of if_generate is
	
begin

--  Recall, the generate statement simplifies the description of regular design structures.
--  The if generation scheme is used when the regular structure contains some irregularities.

    AND_DATA : if sel = 0 generate
        y <= (((a and b) and c) and d);
    end generate;
    
    OR_DATA : if sel = 1 generate
        y <= (((a or b) or c) or d);
    end generate;
    
    NAND_DATA : if sel = 2 generate
        y <= (((a nand b) nand c) nand d);
    end generate;
    
    NOR_DATA : if sel = 3 generate
        y <= (((a nor b) nor c) nor d);
    end generate;
    
    XOR_DATA : if sel = 4 generate
        y <= (((a xor b) xor c) xor d);
    end generate;
    
    XNOR_DATA : if sel >= 5 generate
        y <= (((a xnor b) xnor c) xnor d);
    end generate;

end Behavioral;
