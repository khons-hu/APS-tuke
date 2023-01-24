----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: mx4_1_with_select_tb - Behavioral
-- Project Name: vhdl_02
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

entity mx4_1_with_select_tb is
--  Port ( );
end mx4_1_with_select_tb;

architecture Behavioral of mx4_1_with_select_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component mx4_1_with_select is
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               S : in STD_LOGIC_VECTOR (1 downto 0);
               y : out STD_LOGIC);
    end component mx4_1_with_select;

    --Inputs
    signal D : std_logic_vector(3 downto 0) := "0000";
    signal S : std_logic_vector(1 downto 0) := "00";
    
    --Outputs
    signal y : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: mx4_1_with_select port map (
          D => D,
          S => S,
          y => y
        );

    process
    begin
        S(0) <= '0';
        wait for 10 ns;
        S(0) <= '1';
        wait for 10 ns;        
    end process;

    process
    begin
        S(1) <= '0';
        wait for 20 ns;
        S(1) <= '1';
        wait for 20 ns;        
    end process;

    -- Stimulus process
    stim_proc: process
    begin        

        -- Hold reset state for 80 ns.
        wait for 80 ns;    

        D <= "0000", 
             "0001" after 40 ns, 
             "0010" after 80 ns, 
             "0011" after 120 ns, 
             "0100" after 160 ns, 
             "0101" after 200 ns, 
             "0110" after 240 ns, 
             "0111" after 280 ns, 
             "1000" after 320 ns,                          
             "1001" after 360 ns,                          
             "1010" after 400 ns,                          
             "1011" after 440 ns,                          
             "1100" after 480 ns,                          
             "1101" after 520 ns,                          
             "1110" after 560 ns,                          
             "1111" after 600 ns;                          
        wait;
    end process;

end Behavioral;
