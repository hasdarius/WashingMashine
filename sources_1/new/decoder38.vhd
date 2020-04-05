----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2019 03:09:48 PM
-- Design Name: 
-- Module Name: decoder38 - Behavioral
-- Project Name: 
-- Target Devices: 
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
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.matrix_package.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder38 is
 Port (input: in std_logic_vector(2 downto 0);
        state: out STATES);
end decoder38;

architecture Behavioral of decoder38 is
begin
process(input)
begin
case input is
    when "000"=>state<=IDLE;
    when "001"=>state<=ON_PROGRAM;
    when "011"=>state<=READY;
    when "111"=>state<=FUNCTIONING;
    when "101"=>state<=BLOCK_DOOR;
    when "100"=>state<=END_AUTOMATA;
    when others=>state<=IDLE;
    end case;
    end process;
end Behavioral;
