library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--UKNF
entity pos is
    Port ( a, b, c, d : in  STD_LOGIC;
           y : out  STD_LOGIC);
end pos;

architecture Behavioral of pos is

begin

y <= (a or b or (not c) or d) and 
     (a or (not b) or c or d) and 
     (a or (not b) or (not c) or (not d)) and 
     ((not a) or b or (not c) or (not d));

end Behavioral;
