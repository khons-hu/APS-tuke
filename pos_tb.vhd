library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pos_tb is
--  Port ( );
end pos_tb;

architecture Behavioral of pos_tb is

    component pos is
    Port ( a, b, c, d : in  STD_LOGIC;
               y : out  STD_LOGIC);
    end component pos;
    
        --Inputs
    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal c : std_logic := '0';
    signal d : std_logic := '0';
    
         --Outputs
   signal y : std_logic;
   
   signal sim_a : std_logic := '0';
   signal sim_b : std_logic := '0';
   signal sim_c : std_logic := '0';
   signal sim_d : std_logic := '0';
   
   constant sim_period : time := 16 ns;


begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: pos port map (a, b, c, d, y);
    
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
        
        a <= sim_a;
        b <= sim_b;
        c <= sim_c;
        d <= sim_d;

end Behavioral;
