----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: dff - Behavioral 
-- Project Name: vhdl_04
-- Target Devices: xc7a35tcpg236-1
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff is
    Port ( clk  : in  STD_LOGIC;
           d    : in  STD_LOGIC; 
           q    : out  STD_LOGIC);
end dff;

architecture Behavioral of dff is

begin

	DFF_UP: process(clk) is
	begin			
		if rising_edge(clk) then
--		if (clk'event and clk = '1') then
			q <= d;
		end if;
	end process;

end Behavioral;

--architecture Behavioral of dff is

--begin

--	DFF_DOWN: process(clk) is
--	begin			
--		if falling_edge(clk) then
----		if (clk'event and clk = '0') then
--			q <= d;
--		end if;
--	end process;

--end Behavioral;
