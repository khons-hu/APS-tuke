----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: concurrent_signal_assignment_tb - Behavioral
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

entity concurrent_signal_assignment_tb is
--  Port ( );
end concurrent_signal_assignment_tb;

architecture Behavioral of concurrent_signal_assignment_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component concurrent_signal_assignment is
        Port ( a, b, c : in  STD_LOGIC;
               y : out  STD_LOGIC);
    end component concurrent_signal_assignment;
    
    --Inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    
    --Outputs
    signal y : std_logic;
    
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: concurrent_signal_assignment port map (
          a => a,
          b => b,
          c => c,
          y => y
        );

    -- Stimulus process
    stim_proc: process
    begin        

        -- Hold reset state for 100 ns.
        wait for 100 ns;    

        a <= '0', '1' after 200 ns;
        b <= '0', '1' after 100 ns, '0' after 200 ns, '1' after 300 ns;
        c <= '0', '1' after 50 ns, '0' after 100 ns, '1' after 150 ns, '0' after 200 ns, '1' after 250 ns, '0' after 300 ns, '1' after 350 ns;

        wait;
    end process;

end Behavioral;
