----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2022 06:38:09 PM
-- Design Name: 
-- Module Name: bcd_to_gray_tb - Behavioral
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

entity bcd_to_gray_tb is

end bcd_to_gray_tb;

architecture Behavioral of bcd_to_gray_tb is

component bcd_to_gray is
  Port ( bcd : in std_logic_vector(3 downto 0);
     gray : out std_logic_vector(3 downto 0) );
end component bcd_to_gray;

signal bcd : std_logic_vector(3 downto 0) := (others => '0');
signal sim_bcd : std_logic_vector(3 downto 0) := (others => '0');
signal gray : std_logic_vector(3 downto 0);
constant period : time := 16ns;

begin
UUT: bcd_to_gray port map(bcd, gray);

    generator_for_b3 : process
    begin
        sim_bcd(3) <= '0';
        wait for period/2;
        sim_bcd(3) <= '1';
        wait for period/2;
    end process;
    
    generator_for_b2 : process
        begin
            sim_bcd(2) <= '0';
            wait for period/4;
            sim_bcd(2) <= '1';
            wait for period/4;
        end process;
        
        
        generator_for_b1 : process
            begin
                sim_bcd(1) <= '0';
                wait for period/8;
                sim_bcd(1) <= '1';
                wait for period/8;
            end process;
            
            
            
            generator_for_b0 : process
                begin
                    sim_bcd(0) <= '0';
                    wait for period/16;
                    sim_bcd(0) <= '1';
                    wait for period/16;
                end process;
                
                
                bcd(3) <= sim_bcd(3);
                bcd(2) <= sim_bcd(2);
                bcd(1) <= sim_bcd(1);
                bcd(0) <= sim_bcd(0);

end Behavioral;
