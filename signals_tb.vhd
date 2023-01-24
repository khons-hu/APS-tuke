----------------------------------------------------------------------------------
-- Company:  incelSoft
-- Engineer: macka
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: signals_tb - Behavioral
-- Project Name: vhdl_01
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

entity signals_tb is
--  Port ( );
end signals_tb;

architecture Behavioral of signals_tb is

    -- Component Declaration for the Unit Under Test (UUT)    
    component signals is
        Port ( a3, a2, a1, a0 : in  STD_LOGIC;
               b3, b2, b1, b0 : in  STD_LOGIC;
               y : out  STD_LOGIC);
    end component signals;

    --Inputs
    signal a3 : std_logic := '0';
    signal b3 : std_logic := '0';

    signal a2 : std_logic := '0';
    signal b2 : std_logic := '0';

    signal a1 : std_logic := '0';
    signal b1 : std_logic := '0';

    signal a0 : std_logic := '0';
    signal b0 : std_logic := '0';
    
     --Outputs
    signal y : std_logic;
    
    signal sim_a3 : std_logic := '0';
    signal sim_b3 : std_logic := '0';

    signal sim_a2 : std_logic := '0';
    signal sim_b2 : std_logic := '0';

    signal sim_a1 : std_logic := '0';
    signal sim_b1 : std_logic := '0';

    signal sim_a0 : std_logic := '0';
    signal sim_b0 : std_logic := '0';
    
    constant sim_period : time := 256 ns;
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: signals port map (a3, a2, a1, a0, b3, b2, b1, b0, y);
        
    -- Signal generators
    generator_for_a3 : process
    begin
        sim_a3 <= '0';
        wait for sim_period/2;
        sim_a3 <= '1';
        wait for sim_period/2;
    end process;
    
    generator_for_a2 : process
    begin
        sim_a2 <= '0';
        wait for sim_period/4;
        sim_a2 <= '1';
        wait for sim_period/4;
    end process;
    
    generator_for_a1 : process
    begin
        sim_a1 <= '0';
        wait for sim_period/8;
        sim_a1 <= '1';
        wait for sim_period/8;
    end process;

    generator_for_a0 : process
    begin
        sim_a0 <= '0';
        wait for sim_period/16;
        sim_a0 <= '1';
        wait for sim_period/16;
    end process;

    generator_for_b3 : process
    begin        
        sim_b3 <= '0';
        wait for sim_period/32;
        sim_b3 <= '1';
        wait for sim_period/32;
    end process;
    
    generator_for_b2 : process
    begin
        sim_b2 <= '0';
        wait for sim_period/64;
        sim_b2 <= '1';
        wait for sim_period/64;
    end process;
    
    generator_for_b1 : process
    begin
        sim_b1 <= '0';
        wait for sim_period/128;
        sim_b1 <= '1';
        wait for sim_period/128;
    end process;

    generator_for_b0 : process
    begin
        sim_b0 <= '0';
        wait for sim_period/256;
        sim_b0 <= '1';
        wait for sim_period/256;
    end process;

    a3 <= sim_a3;
    a2 <= sim_a2;
    a1 <= sim_a1;
    a0 <= sim_a0;

    b3 <= sim_b3;
    b2 <= sim_b2;
    b1 <= sim_b1;
    b0 <= sim_b0;
    
end Behavioral;
