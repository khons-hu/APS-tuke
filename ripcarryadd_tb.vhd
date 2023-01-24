----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
-- 
-- Create Date:
-- Design Name: 
-- Module Name: ripple_carry_adder_tb - Behavioral
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

entity ripple_carry_adder_tb is
--  Port ( );
end ripple_carry_adder_tb;

architecture Behavioral of ripple_carry_adder_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    constant width : positive := 5;
    component ripple_carry_adder is
        generic(width : positive := width);
        Port ( A, B : in STD_LOGIC_VECTOR (width-1 downto 0);
               Sum : out STD_LOGIC_VECTOR (width-1 downto 0);
               carry : out STD_LOGIC);
    end component ripple_carry_adder;

    -- Inputs
    signal A : std_logic_vector(width-1 downto 0) := (others => '0');
    signal B : std_logic_vector(width-1 downto 0) := (others => '0');
    
    -- Outputs
    signal Sum : std_logic_vector(width-1 downto 0);
    signal carry : std_logic;

    -- Clock definition
    signal clk : std_logic;
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: ripple_carry_adder PORT MAP (A => A, B => B, Sum => Sum, carry => carry);

    -- Clock process definition
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;


    -- Stimulus process
    stim_proc : process
        variable test_sum : integer;
    begin        
        -- Hold reset state for 100 ns
        wait for 100 ns;    

        for i in 0 to 2**width-1 loop
            A <= std_logic_vector(to_unsigned(i, width));
            for j in 0 to 2**width-1 loop
                B <= std_logic_vector(to_unsigned(j, width));                
                wait for 2*clk_period;

                test_sum := i + j;
                
				assert test_sum = to_integer(unsigned(Sum))
                    report "Wrong result for arguments : A = " & integer'image(i) & ", B = " & integer'image(j) 
                    severity error;   -- If the severity clause is ommited, the default level is error.
                    --severity note;       
                    --severity warning;                 
                    --severity failure; -- Level failure aborts the simulation.     
                
            end loop;
        end loop;

        wait;
    end process;

end Behavioral;
