library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port( s1, s2, s3, s4, s5, s6, s7, s8 : in STD_LOGIC;
          C : in STD_LOGIC_VECTOR (2 downto 0);
          d : out STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin

    with C select
        d <=    s1 when "000",
                s2 when "001",
                s3 when "010",
                s4 when "011",
                s5 when "100",
                s6 when "101",
                s7 when "110",
                s8 when others;

end Behavioral;
