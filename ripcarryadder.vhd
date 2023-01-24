----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: ripple_carry_adder - Behavioral
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

entity ripple_carry_adder is
    generic(width : positive := 4);
    Port ( A, B : in STD_LOGIC_VECTOR (width-1 downto 0);
           Sum : out STD_LOGIC_VECTOR (width-1 downto 0);
           carry : out STD_LOGIC);
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is

    component half_adder is
        Port ( a, b : in STD_LOGIC;
               sum : out STD_LOGIC;
               carry : out STD_LOGIC);
    end component half_adder;

    component full_adder is
        Port ( a, b, c : in STD_LOGIC;
               sum : out STD_LOGIC;
               carry : out STD_LOGIC);
    end component full_adder;

	signal C : std_logic_vector(width-1 downto 0);
    
begin

--  The generate statement simplifies the description of regular design structures. 
--  Usually it is used to specify a group of identical components using just one 
--  component specification and repeating it using the generate mechanism.
--    
--  A generate statement consists of three main parts:
--      + generation scheme (either for scheme or if scheme);
--      + declaration part (local declarations of subprograms, types, signals, constants,  
--                          components, attributes, configurations, files and groups);
--      + concurrent statements.
--    
--  The generation scheme specifies how the concurrent structure statement should be generated. 
--  There are two generation schemes available: for scheme and if scheme.
--    
--  The for generation scheme is used to describe regular structures in the design. 
--  In such a case, the generation parameter and its scope of values are generated in similar way as in the sequential loop statement.
--  The if generation scheme is used when the regular structure contains some irregularities.

	RCA : for i in 0 to width-1 generate
		LSB : if i = 0 generate
			ADD0 : half_adder port map (a => A(0), b => B(0), sum => SUM(0), carry => C(0));
		end generate LSB;

		UPPER_BITS : if i > 0 generate
			ADDX : full_adder port map (a => A(i), b => B(i), c => C(i-1), sum => SUM(i), carry => C(i));
		end generate UPPER_BITS;
		
	end generate RCA;

	carry <= C(width-1);

end Behavioral;
