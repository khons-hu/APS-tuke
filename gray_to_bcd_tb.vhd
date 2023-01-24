----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2022 06:21:34 PM
-- Design Name: 
-- Module Name: gray_to_bcd_tb - Behavioral
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

entity gray_to_bcd_tb is

end gray_to_bcd_tb;

architecture Behavioral of gray_to_bcd_tb is

component gray_to_bcd is
Port ( gray : in std_logic_vector(3 downto 0);
         bcd: out std_logic_vector(3 downto 0)  );
end component gray_to_bcd;

signal gray : std_logic_vector(3 downto 0) := (others => '0'); --in
signal bcd : std_logic_vector(3 downto 0); --out

signal sim_gray : std_logic_vector(3 downto 0) := (others => '0'); --sim in
constant period : time := 16ns;

begin

UUT: gray_to_bcd port map(gray, bcd);

    generator_for_g3 : process
        begin
        sim_gray(3) <= '0';
        wait for period/2;
        sim_gray(3) <= '1';
        wait for period/2;
    end process;
    
    generator_for_g2 : process
    begin
            sim_gray(2) <= '0';
            wait for period/4;
            sim_gray(2) <= '1';
            wait for period/4;
    end process;
        
    generator_for_g1 : process
    begin
                sim_gray(1) <= '0';
                wait for period/8;
                sim_gray(1) <= '1';
                wait for period/8;
    end process;
            
   generator_for_g0 : process
   begin
        sim_gray(0) <= '0';
        wait for period/16;
        sim_gray(0) <= '1';
        wait for period/16;
    end process;
                
gray(3) <= sim_gray(3);
gray(2) <= sim_gray(2);
gray(1) <= sim_gray(1);
gray(0) <= sim_gray(0);



end Behavioral;
