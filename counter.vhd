----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    generic (up_counter : boolean := TRUE;
             width      : positive := 8; 
             init_value : natural := 0);
    Port ( clk  : in STD_LOGIC;
           rst  : in STD_LOGIC;
           en   : in STD_LOGIC;
           Y    : out STD_LOGIC_VECTOR (width-1 downto 0);
           o    : out STD_LOGIC);
end counter;

architecture Behavioral of counter is

begin

    process(clk, rst)
        variable cnt : unsigned(width-1 downto 0) := (others => '0');          
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                cnt := to_unsigned(init_value, Y'length);
                o <= '0';
            else
                if (en = '1') then
                    if up_counter then 
                        cnt := cnt + 1;
                    else
                        cnt := cnt - 1;  
                    end if;
                    if (cnt = 0) then
                        o <= '1';
                    else
                        o <= '0';
                    end if;
                end if;
            end if;
        end if;
        Y <= std_logic_vector(cnt);
    end process;
    
end Behavioral;
