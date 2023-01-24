----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
--
-- Create Date:
-- Design Name:
-- Module Name: dff_tb - Behavioral
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

entity dff_tb is
--  Port ( );
end dff_tb;

architecture Behavioral of dff_tb is
    -- Component Declaration for the Unit Under Test (UUT)
    component dff is
        Port ( clk  : in  STD_LOGIC;
               d    : in  STD_LOGIC;
               q    : out  STD_LOGIC);
    end component dff;

    --Inputs
    signal d    : std_logic := '0';
        -- Clock signal
        signal clk : std_logic;
        constant clk_period : time := 10 ns;

    --Outputs
    signal q : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: dff port map (clk => clk, d => d, q => q);

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

        d <= '0', '1' after 104 ns, '0' after 116 ns, '1' after 134 ns;

        wait;
    end process;

end Behavioral;
