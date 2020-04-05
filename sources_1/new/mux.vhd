library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.Matrix_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--type MAT is array (2**nr_sel-1  downto 0) of std_logic_vector(7 downto 0);

entity MUX8bit is
generic(nr_sel:integer;
		X: MAT8bit);
port( sel: in std_logic_vector(nr_sel-1 downto 0);
   -- state: in states;
		Y:inout std_logic_vector(7 downto 0));

end MUX8bit;

architecture Behavioral of MUX8bit is
--signal X: MAT;
begin

Y<=X(conv_integer(sel));-- when state=ON_PROGRAM
    --else "00000000";
end Behavioral;