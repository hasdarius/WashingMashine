library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use work.matrix_package.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
port(input1, input0: in std_logic_vector(7 downto 0);
    RT: in std_logic_vector(7 downto 0);
	clk: in std_logic;
	start: in std_logic;
	reset: in std_logic;
	pwr: in std_logic;
	close_door:in std_logic;
	presp,ClaSup:in std_logic;
	MODA: in std_logic_vector(2 downto 0);
	selma:in std_logic;
	state: in states;
	rot_out: out std_logic_vector(4 downto 0);
	outputs: out std_logic_vector(6 downto 0);
	selout:out std_logic_vector(3 downto 0);
	fin: out std_logic;
	ok_out: out std_logic;
	blk:out std_logic);
end display;

architecture Behavioral of display is
signal LED_BCD: std_logic_vector(3 downto 0);
signal refresh_counter: std_logic_vector(19 downto 0);
signal selin: std_logic_vector(1 downto 0);
signal displayed_number: std_logic_vector(15 downto 0);
signal one_second_counter: STD_LOGIC_VECTOR (27 downto 0);
signal one_second_enable: std_logic;
signal pause:std_logic:='0';
signal x:std_logic_vector(4 downto 0) :="00000";
signal ok:std_logic:='0';
begin


process(LED_BCD)
begin 
case LED_BCD is
	when "0000"=>outputs<="0000001";
	when "0001"=>outputs<="1001111";
	when "0010"=>outputs<="0010010";
	when "0011"=>outputs<="0000110";
	when "0100"=>outputs<="1001100";
	when "0101"=>outputs<="0100100";
	when "0110"=>outputs<="0100000";
	when "0111"=>outputs<="0001111";
	when "1000"=>outputs<="0000000";
	when "1001"=>outputs<="0000100";
	when others=>outputs<="0000000";
	end case;
end process;
process(displayed_number,presp,clasup,selma,moda,state,pwr,close_door)
begin 
if((state=FUNCTIONING) and pwr='1') then
    if(displayed_number(11 downto 0)="100101011001") then
    if(selma='0') then
        if(presp='0') then
                                            if(clasup='0') then 
                                                case displayed_number(15 downto 12) is
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00001";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
                                            else
                                            case displayed_number(15 downto 12) is
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00011";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
                                            end if;
                                       else
                                        if(clasup='0') then 
                                        case displayed_number(15 downto 12) is
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00001";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
                                            else
                                            case displayed_number(15 downto 12) is
                                                when "0101"=>x<="00001";
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00011";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
                                            end if;
           end if;
           else
           case MODA is
           when "000"=>case displayed_number(15 downto 12) is
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00001";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
         when "001"=>case displayed_number(15 downto 12) is
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00001";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
          when "010"=>case displayed_number(15 downto 12) is
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00011";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
         when "011"=>case displayed_number(15 downto 12) is
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00011";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
         when "110"=>case displayed_number(15 downto 12) is
                                                when "0100"=>x<="00001";
                                                when "0011"=>x<="00001";
                                                when "0010"=>x<="00001";
                                                when "0001"=>x<="00011";
                                                when "0000"=>x<=RT(4 downto 0);
                                                when others=>x<="00000";
                                                end case;
         when others=>x<="00000";                              
         end case;
         end if;                                
    else
        x<=x;
     end if; 
elsif(state=BLOCK_DOOR) then
    x<="00000";
else x<="00000";
end if;
rot_out<=x;

end process;
process(clk,reset)
begin 
    if(reset='1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clk)) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;
selin<=refresh_counter(19 downto 18);
process(selin,displayed_number,state,pwr)
begin
if((state=ON_PROGRAM or state=READY or state=FUNCTIONING or state=BLOCK_DOOR or state=END_AUTOMATA) and pwr='1')then
case selin is
	when"00"=>
	selout<="1110";
	LED_BCD<=displayed_number(3 downto 0);
	when "01"=>
	selout<="1101";
	LED_BCD<=displayed_number(7 downto 4);
	when "10"=>
	selout<="1011";
	LED_BCD<=displayed_number(11 downto 8);
	when "11"=>
	selout<="0111";
	LED_BCD<=displayed_number(15 downto 12);
	when others=>
	selout<="1111";
	end case;
else
    selout<="1111";
    LED_BCD<="0000";
end if;
end process;
	
process(clk, reset,state,pwr,close_door,start)--,state)
begin
    if((state=FUNCTIONING or state=BLOCK_DOOR) and pwr='1' and start='1')then
        if(reset='1') then
            one_second_counter <= (others => '0');
        elsif(rising_edge(clk)) then
            if(one_second_counter>=x"5F5E0FF") then
                one_second_counter <= (others => '0');
            else
                one_second_counter <= one_second_counter + "0000001";
            end if;
        end if;
    else
        one_second_counter <= (others => '0');
     end if;
end process;
one_second_enable <= '1' when one_second_counter=x"5F5E0FF" else '0';

process(clk, reset,input1,input0,state,pwr,close_door,start)
begin
    if((state=FUNCTIONING or state=BLOCK_DOOR) and pwr='1'  and start='1') then
        if(displayed_number=x"0000" and (state=BLOCK_DOOR or state=END_AUTOMATA)) then
            blk<='0';
            else 
            blk<='1';
           end if;
        elsif(state=ON_PROGRAM or state=READY) then
        ok<='0';
        ok_out<='0';
        fin<='0';
        blk<='0';
        end if;
        if(state=FUNCTIONING or state=BLOCK_DOOR)  then
            if(start='0') then
                displayed_number<=displayed_NUMBER;  
            elsif(pwr='1' and start='1') then
                    if(reset='1') then
                        displayed_number(15 downto 8)<=input1;
                        displayed_number(7 downto 0) <= input0;
                    elsif(rising_edge(clk)) then
                         if(one_second_enable='1') then
                            if(displayed_number(3 downto 0) = "0000") then
                                    displayed_number(3 downto 0) <="1001";
                                     if(displayed_number(7 downto 4) = "0000") then
                                            displayed_number(7 downto 4) <="0101";
                                        if(displayed_number(11 downto 8) = "0000") then
                                                displayed_number(11 downto 8) <="1001";
                                            if(displayed_number(15 downto 12) = "0000") then
                                                    if(state=BLOCK_DOOR or state=END_AUTOMATA) then 
                                                    displayed_number(15 downto 0) <="0000000000000000";
                                                    fin<='1';
                                                    blk<='0';
                                                    else
                                                        ok<='1';
                                                        ok_out<='1';
                                                        displayed_number<="0000000100000000";
                                                    end if;
                                                   else
            --                                       
                                                   displayed_number(15 downto 12)<=displayed_number(15 downto 12)-"0001";
                                     end if; 
                                     else
                                     displayed_number(11 downto 8)<=displayed_number(11 downto 8)-"0001";
                                    end if;
                                    else
                                    displayed_number(7 downto 4)<=displayed_number(7 downto 4)-"0001";
                                   end if; 
                                else
                                    displayed_number<=displayed_number-"0000000000000001";
                         end if;
                 end if;
                 end if;
     end if;
     elsif(state=ON_PROGRAM or state=READY) then
        displayed_number(15 downto 8)<=input1;
      displayed_number(7 downto 0) <= input0;
  end if;
end process;

end Behavioral;