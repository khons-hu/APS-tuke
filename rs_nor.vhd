library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rs_nor is
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           Q : inout STD_LOGIC;
           notQ : inout STD_LOGIC);
end rs_nor;

architecture Behavioral of rs_nor is

begin

    Q <= R nor notQ;
    notQ <= S nor Q;

end Behavioral;
