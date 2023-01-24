----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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

entity shifter_tb is
--  Port ( );
end shifter_tb;

architecture Behavioral of shifter_tb is
    
    constant SHTL : std_logic_vector(1 downto 0) := "00";
    constant ROTL : std_logic_vector(1 downto 0) := "01";
    constant SHTR : std_logic_vector(1 downto 0) := "10";
    constant ROTR : std_logic_vector(1 downto 0) := "11";

    -- Component Declaration for the Unit Under Test (UUT)
    component shifter is
        Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
               Mode : in  STD_LOGIC_VECTOR (1 downto 0);
               Y : out  STD_LOGIC_VECTOR (3 downto 0));
    end component shifter;

   --Inputs
    signal X : std_logic_vector(3 downto 0) := (others => '0');
    signal Mode : std_logic_vector(1 downto 0) := (others => '0');
 
      --Outputs
    signal Y : std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: shifter port map (X => X, Mode => Mode, Y => Y);
    
    -- Stimulus process
    stim_proc: process
    begin		
        -- hold reset state for 100 ns.
        wait for 100 ns;
        X <= "1111";
        Mode <= SHTL;
        wait for 100ns;
        Mode <= ROTL;
        wait for 200ns;
        Mode <= SHTR;
        wait for 300ns;
        Mode <= ROTR;
        wait for 400 ns;
        
        X <= "1001";
        Mode <= SHTL;
        wait for 100ns;
        Mode <= ROTL;
        wait for 200ns;
        Mode <= SHTR;
        wait for 300ns;
        Mode <= ROTR;
        wait;
    end process;
    
end Behavioral;
