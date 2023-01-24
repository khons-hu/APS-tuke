----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
--
-- Create Date:
-- Design Name:
-- Module Name: d_latch_tb - Behavioral
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

entity d_latch_tb is
--  Port ( );
end d_latch_tb;

architecture Behavioral of d_latch_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component d_latch is
        Port ( d    : in STD_LOGIC;
               en   : in STD_LOGIC;
               q    : out STD_LOGIC);
    end component d_latch;

    --Inputs
    signal d    : std_logic := '0';
    signal en   : std_logic := '0';

    --Outputs
    signal q : std_logic;

    -- Clock signal
    signal clk : std_logic;
    constant clk_period : time := 10 ns;
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: d_latch port map (d => d, en => en, q => q);

    -- Clock process definitions
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;

        d <= '0', '1' after 104 ns,
             '0' after 116 ns, 
             '1' after 134 ns;
        en <= '0', 
              '1' after 50 ns, 
              '0' after 70 ns,
              '1' after 90 ns;
        wait;
    end process;

end Behavioral;
