----------------------------------------------------------------------------------
-- Company:  DCI FEEI TUKE
-- Engineer: Norbert Ádám
--
-- Create Date:
-- Design Name:
-- Module Name: seven_seg_decoder_tb - Behavioral
-- Project Name: vhdl_04
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

entity seven_seg_decoder_tb is
    Port ( debug : out character;
           a, b, c, d, e, f, g : out STD_LOGIC );
end seven_seg_decoder_tb;

architecture Behavioral of seven_seg_decoder_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component seven_seg_decoder is
        Port ( Data : in STD_LOGIC_VECTOR (3 downto 0);
               Segments : out STD_LOGIC_VECTOR (6 downto 0));
    end component seven_seg_decoder;

    --Inputs
    signal Data : std_logic_vector(3 downto 0) := (others => '0');

      --Outputs
    signal Segments : std_logic_vector (6 downto 0);

begin

	-- Instantiate the Unit Under Test (UUT)
    UUT: seven_seg_decoder port map (Data => Data, Segments => Segments);

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;

        for i in 0 to 2**Data'length-1 loop
            Data <= std_logic_vector(to_unsigned(i, Data'length));
            wait for 50 ns;
        end loop;

        wait;
    end process;

    process(Segments) begin
        case Segments is
               -- abcdefg
            when "1111110" =>   debug <= '0';
            when "0110000" =>   debug <= '1';
            when "1101101" =>   debug <= '2';
            when "1111001" =>   debug <= '3';
            when "0110011" =>   debug <= '4';
            when "1011011" =>   debug <= '5';
            when "1011111" =>   debug <= '6';
            when "1110000" =>   debug <= '7';
            when "1111111" =>   debug <= '8';
            when "1110011" =>   debug <= '9';
            when others =>      debug <= ' ';
        end case;
        (a,b,c,d,e,f,g) <= Segments;
    end process;


end Behavioral;
