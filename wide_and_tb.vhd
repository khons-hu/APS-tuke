----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:13:05 PM
-- Design Name: 
-- Module Name: wide_and_tb - Behavioral
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

entity wide_and_tb is
--  Port ( );
end wide_and_tb;

architecture Behavioral of wide_and_tb is

component wide_and
  Port ( data : in std_logic_vector(3-1 downto 0);
         output: out std_logic  );
end component;
         
  signal data : std_logic_vector(3-1 downto 0);
  signal output: std_logic;
         
begin

uut: wide_and port map (
    data => data,
    output => output
);

tst: process
begin

for i in 0 to 1 loop
    for j in 0 to 1 loop
        for k in 0 to 1 loop
        
            if i = 0 then data(2) <= '0'; else data(2) <= '1'; end if; 
            if j = 0 then data(1) <= '0'; else data(1) <= '1'; end if; 
            if k = 0 then data(0) <= '0'; else data(0) <= '1'; end if; 
            
            wait for 10 ns;
        
        end loop;
    end loop;
end loop;

end process;


end Behavioral;
