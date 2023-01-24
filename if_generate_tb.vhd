----------------------------------------------------------------------------------
-- Company:  incel
-- Engineer: 
-- 
-- Create Date:
-- Design Name: 
-- Module Name: if_generate_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity if_generate_tb is
--  Port ( );
end if_generate_tb;

architecture Behavioral of if_generate_tb is
    
    constant SEL : integer :=2;
    
    -- Component Declaration for the Unit Under Test (UUT)
    component if_generate is
        generic(sel : natural := 0);
        Port ( a, b, c, d : in  STD_LOGIC;
               y : out  STD_LOGIC);
    end component if_generate;

    --Inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    signal d : std_logic := '0';
    
     --Outputs
    signal y : std_logic;
    
    --Clock signals
    signal Cnt : unsigned(3 downto 0) := (others => '0'); 
    constant cnt_period : time := 100 ns;
    
begin
	-- Instantiate the Unit Under Test (UUT)
    -- If you do not specify the "sel" value explicitly, 
    -- Vivado sim uses the value specified inside the component declaration of the UUT.
    UUT: if_generate generic map (sel => SEL) port map (
          a => a,
          b => b,
          c => c,
          d => d,
          y => y
        );    

    -- Clock process definitions
    clk_process :process
    begin        
        wait for cnt_period/16;
        Cnt <= Cnt + 1;
    end process;

    -- Use of an aggregate as an assignment target        
    (a, b, c, d) <= Cnt;
    
end Behavioral;
