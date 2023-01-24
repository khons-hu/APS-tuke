----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: number_representation_tb - Behavioral
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

entity number_representation_tb is
--  Port ( );
end number_representation_tb;

architecture Behavioral of number_representation_tb is

    -- Component Declaration for the Unit Under Test (UUT)    
    component number_representation is
        Port ( sign : in STD_LOGIC;                                     
               Magnitude : in STD_LOGIC_VECTOR (6 downto 0);            
               Signed_magnitude : out STD_LOGIC_VECTOR (7 downto 0);    
               Ones_complement : out STD_LOGIC_VECTOR (7 downto 0);
               Twos_complement : out STD_LOGIC_VECTOR (7 downto 0));
    end component number_representation;
    
    --Inputs
    signal sign : std_logic := '0';
    signal Magnitude : std_logic_vector(6 downto 0) := (others => '0');
    
    --Outputs
    signal Signed_magnitude : std_logic_vector(7 downto 0);
    signal Ones_complement : std_logic_vector(7 downto 0);
    signal Twos_complement : std_logic_vector(7 downto 0);
        
begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: number_representation port map (
         sign => sign,
         Magnitude => Magnitude,
         Signed_magnitude => Signed_magnitude,
         Ones_complement => Ones_complement,
         Twos_complement => Twos_complement
    );
            
    -- Stimulus process
    stim_proc: process
    begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
    
      sign <= '1', '0' after 200 ns;
      Magnitude <= "0000011";
    
      wait;
    end process;

end Behavioral;
