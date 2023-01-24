----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2022 01:45:49 PM
-- Design Name: 
-- Module Name: sop_tb - Behavioral
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

entity sop_tb is
--  Port ( empty like life at TUKE >D );
end sop_tb;

architecture Behavioral of sop_tb is

    --the same port like in the entity of sop, but there we have to put it into a component that we are going to use
    component sop
            Port ( a, b, c, d : in std_logic;
                   f : out std_logic );
    end component sop;

    --declaring'n defining all the input variables, initially to 0 
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    signal d : std_logic := '0';

    --declaring output value
    signal f : std_logic;
    
    --declaring'n defining temporary values for the inputs, also called as simulation values
    signal sim_a : std_logic := '0';
    signal sim_b : std_logic := '0';
    signal sim_c : std_logic := '0';
    signal sim_d : std_logic := '0';
    
    --in this case, we have 4 input values, so if we want to split the time equally, 16 nanoseconds can be enough (2^4);
    constant sim_period : time := 16ns;

begin

    -- porting the values from the testbench to the function (like passing arguments into a functions) (UUT: {name of component} port map(arguments);)
    UUT: sop port map(a,b,c,d,f);
    
    --In this case, we have to create 4 processes to simulate 4 input values in the same way but with different time 'delays'
    --We have to make it 4 times, i don't think that needs to be explained, going from sim_period/2 up to sim_period/2^n
    
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
    
    generator_for_c : process
    begin
       sim_c <= '0';
       wait for sim_period/8;
       sim_c <= '1';
       wait for sim_period/8;
    end process;
        
    generator_for_d : process
    begin
       sim_d <= '0';
       wait for sim_period/16;
       sim_d <= '1';
       wait for sim_period/16;
    end process;
    
    --after the generators we assign the simulated values to the original input values
    a <= sim_a;
    b <= sim_b; 
    c <= sim_c; 
    d <= sim_d; 
    
end Behavioral;
