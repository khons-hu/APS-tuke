----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
--
-- Create Date:
-- Design Name:
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture Behavioral of counter_tb is

    constant width : positive := 4;
    -- Component Declaration for the Unit Under Test (UUT)
    component counter is
        generic (up_counter : boolean := TRUE;
                 width      : positive := width;
                 init_value : natural := 0);
        Port ( clk  : in STD_LOGIC;
               rst  : in STD_LOGIC;
               en   : in STD_LOGIC;
               Y    : out STD_LOGIC_VECTOR (width-1 downto 0);
               o    : out STD_LOGIC);
    end component counter;

    -- Inputs
    signal rst : STD_LOGIC := '0';
    signal en : STD_LOGIC := '0';
    -- Clock signal
        signal clk : STD_LOGIC := '0';
        constant clk_period : time := 10 ns;

    -- Output
    signal Y_up : STD_LOGIC_VECTOR (width-1 downto 0);
    signal Y_down : STD_LOGIC_VECTOR (width-1 downto 0);
    signal o_up, o_down : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UP_COUNTER: counter port map (clk => clk, rst => rst, en => en, Y => Y_up, o => o_up);
    DOWN_COUNTER: counter generic map (up_counter => false, init_value => 8) port map (clk => clk, rst => rst, en => en, Y => Y_down, o => o_down);

    clock_generator : process
    begin
        clk <= '0';
        wait for clk_period;
        clk <= '1';
        wait for clk_period;
    end process;

    -- Stimulus process
    stim_proc : process
    begin
        rst <= '1', '0' after 100 ns;
        en <= '0', '1' after 200 ns;
        wait;
    end process;

end Behavioral;
