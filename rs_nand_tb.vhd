library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rs_nand_tb is
--  Port ( );
end rs_nand_tb;

architecture Behavioral of rs_nor_tb is

    component rs_nand is
  Port ( R : in std_logic;
           S : in std_logic;
           Q, notQ : inout std_logic );
    end component rs_nand;
    
            --Inputs
    signal R : std_logic := '0';
    signal S : std_logic := '0';
    
             --Outputs
    signal Q : std_logic;
    signal notQ : std_logic;
    
             --Period
    constant sim_period : time := 4 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: rs_nand port map (R, S, Q, notQ);
    
        -- Signal generators
--    generator_for_R : process
--    begin
--        R <= '0';
--        wait for sim_period/2;
--        R <= '1';
--        wait for sim_period/2;
--   end process;
    
--    generator_for_S : process
--    begin
--        S <= '0';
--        wait for sim_period/4;
--        S <= '1';
--        wait for sim_period/4;
--    end process;
   
   generator_for_S : process
   begin
       S <= '0';
       R <= '0';
       wait for 10 ns;
       R <= '1';
       S <= '0';
       wait for 10 ns;
       S <= '0';
       R <= '0';
       wait for 10 ns;
       R <= '0';
       S <= '1';
       wait for 10 ns;
       S <= '0';
       R <= '0';
       wait for 10 ns;
       S <= '1';
       R <= '1';
       wait for 10 ns;    
    end process;

end Behavioral;
