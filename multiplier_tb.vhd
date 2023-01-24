----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date:
-- Design Name: 
-- Module Name: multiplier_tb - Behavioral
-- Project Name: vhdl_03
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

entity multiplier_tb is
--  Port ( );
end multiplier_tb;

architecture Behavioral of multiplier_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component multiplier is
        Port ( A, B : in STD_LOGIC_VECTOR (17 downto 0);
               P : out STD_LOGIC_VECTOR (35 downto 0));
    end component multiplier;

    --Inputs
    signal A : std_logic_vector(17 downto 0) := (others => '0');
    signal B : std_logic_vector(17 downto 0) := (others => '0');
 
      --Outputs
    signal P : std_logic_vector(35 downto 0) := (others => '0');

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: multiplier PORT MAP (A => A, B => B, P => P);
    
    -- Stimulus process
    stim_proc : process
    begin
    
    A <= "000100101010000100";
    B <= "000100101010000100";
    wait for 10 ns;
    
    A <= "001100100010000100";
    B <= "000100101010000100";
    wait for 10 ns;
    
    A <= "010100101010000100";
    B <= "000100101010000100";
    wait for 10 ns;
    
    end process;        
    

end Behavioral;
