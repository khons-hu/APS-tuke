----------------------------------------------------------------------------------
-- Company:  
-- Engineer: 
-- 
-- Create Date: 
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Mode : in  STD_LOGIC_VECTOR (1 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0));
end shifter;

architecture Behavioral of shifter is

    constant SHTL : std_logic_vector(1 downto 0) := "00";
    constant ROTL : std_logic_vector(1 downto 0) := "01";
    constant SHTR : std_logic_vector(1 downto 0) := "10";
    constant ROTR : std_logic_vector(1 downto 0) := "11";

    component mx4_1_with_select is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           y : out STD_LOGIC);
    end component mx4_1_with_select;

    signal Mx3, Mx2, Mx1, Mx0 : std_logic_vector(3 downto 0);
begin

    Mx3 <= X(0) & '0' & X(2) & X(2);
	MUX3: mx4_1_with_select PORT MAP ( 
                D => Mx3,
                S => Mode,
                y => Y(3)
    );

    Mx2 <= X(3) & X(3) & X(1) & X(1);
	MUX2: mx4_1_with_select PORT MAP ( 
                D => Mx2,
                S => Mode,
                y => Y(2)
    );

    Mx1 <= X(2) & X(2) & X(0) & X(0);
	MUX1: mx4_1_with_select PORT MAP ( 
                D => Mx1,
                S => Mode,
                y => Y(1)
    );

    Mx0 <= X(1) & X(1) & X(3) & '0';
	MUX0: mx4_1_with_select PORT MAP ( 
				D => Mx0,
                S => Mode,
				y => Y(0)
    );
        
end Behavioral;
