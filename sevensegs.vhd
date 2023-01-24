----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
--
-- Create Date:
-- Design Name:
-- Module Name: seven_seg_decoder - Behavioral
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

entity seven_seg_decoder is
    Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
           Segments : out STD_LOGIC_VECTOR (6 downto 0));
end seven_seg_decoder;

architecture Behavioral of seven_seg_decoder is

begin

    process(Data) begin
        case Data is
                                      -- abcdefg
            when X"0" =>    Segments <= "1111110";
            when X"1" =>    Segments <= "0110000";
            when X"2" =>    Segments <= "1101101";
            when X"3" =>    Segments <= "1111001";
            when X"4" =>    Segments <= "0110011";
            when X"5" =>    Segments <= "1011011";
            when X"6" =>    Segments <= "1011111";
            when X"7" =>    Segments <= "1110000";
            when X"8" =>    Segments <= "1111111";
            when X"9" =>    Segments <= "1110011";
            when others =>  Segments <= "0000000";
        end case;
    end process;

end Behavioral;
