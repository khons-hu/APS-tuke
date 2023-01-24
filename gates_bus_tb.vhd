----------------------------------------------------------------------------------
-- Company:  incelSoft
-- Engineer: macka
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: gates_bus_tb - Behavioral
-- Project Name: vhdl_01
-- Target Devices: xc7a35tcpg236-1
-- Tool Versions: 
-- Description: som zdravy
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

entity gates_bus_tb is
--  Port ( prazdna ako moja hlava );
end gates_bus_tb;

architecture Behavioral of gates_bus_tb is

    -- Component Declaration for the Unit Under Test (UUT)    
    component gates_bus is
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (6 downto 0));
    end component gates_bus;
    
    --Inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    
     --Outputs
    signal Y : std_logic_vector(6 downto 0);
    
    signal sim_a : std_logic := '0';
    signal sim_b : std_logic := '0';
    constant sim_period : time := 100 ns;
    
    begin
    
    -- Instantiate the Unit Under Test (UUT)
    UUT: gates_bus port map (a, b, Y);
        
    -- Signal generators
    generator_for_a : process
    begin
        sim_a <= '0';
        wait for sim_period/2;
        sim_a <= '1';
        wait for sim_period/2;
    end process;
    
    generator_for_b : process
    begin
        sim_b <= '0';
        wait for sim_period/4;
        sim_b <= '1';
        wait for sim_period/4;
    end process;
    
    a <= sim_a;
    b <= sim_b;

end Behavioral;