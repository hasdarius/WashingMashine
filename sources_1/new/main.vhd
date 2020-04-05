library IEEE;
library work;
use IEEE.STD_LOGIC_1164.ALL;
use work.matrix_package.all;
--use work.MUX.;
--use work.display.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
port( SELMA,Presp,ClaSup: in STD_logic;
       PWR,Start:in std_logic;
		Temp: in STD_logic_vector(1 downto 0);
		Rot_sel: in std_logic_vector(1 downto 0);
		MODA: in STD_logic_vector(2 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		close_door:in std_logic;
		selout: out std_logic_vector( 3 downto 0);
		blk: out std_logic;
		 output: out std_logic_vector(6 downto 0);
	 rot_out: out std_logic_vector(4 downto 0));
end main;

    architecture Behavioral of main is
signal m1,m0,a1,a0,rezm,rezs,RM,RA,RT:std_logic_vector(7 downto 0);
signal STATE: STATES;-- :=IDLE;
signal fin,ok_out:std_logic;
signal D:std_logic_vector(2 downto 0):="000";
signal Q2,Q1,Q0:std_logic;
    component Mux8bit 
	 generic(nr_sel:integer;
				X:MAT8bit);
	port(sel: in std_logic_vector(nr_sel-1 downto 0);
	       -- state: in STATES;
			Y:inout std_logic_vector(7 downto 0));
	end component;
	component d_flipflop is 
   port(
      Q : out std_logic;   
      Clk :in std_logic;   
      D :in  std_logic    
   );
end component;

	component display
	port(input1, input0: in std_logic_vector(7 downto 0);
    RT: in std_logic_vector(7 downto 0);
	clk: in std_logic;
	start: in std_logic;
	reset: in std_logic;
	pwr: in std_logic;
	close_door:in std_logic;
	presp,ClaSup:in std_logic;
	MODA: in std_logic_vector(2 downto 0);
	selma: in std_logic;
	state: in states;
	rot_out: out std_logic_vector(4 downto 0);
	outputs: out std_logic_vector(6 downto 0);
	selout:out std_logic_vector(3 downto 0);
	fin: out std_logic;
	ok_out: out std_logic;
	blk:out std_logic);
	end component;
	component decoder38 is
 Port (input: in std_logic_vector(2 downto 0);
        state: out STATES);
end component;

begin


mux1: mux8bit
	generic map(nr_sel=>4,
	X=>("01000000","01010000","01010000","01100000","01000000","01010000","01010000","01100000","01000001","01010001","01010001","01100001","01000010","01010010","01010010","01100010"))
	port map(sel(3 downto 2)=>temp,
				sel(1)=>Presp,
				sel(0)=>ClaSup,
				Y=>m1);
mux2: mux8bit
	generic map(nr_sel=>2,
	X=>("00110000","01010000","00110000","00110000"))
	port map(sel=>temp,
	Y=>m0);
mux3: mux8bit
	generic map(nr_sel=>2,
	X=>("01000000","01000001","01010000","01010010"))
	port map(sel=>MODA(1 downto 0),
	Y=>a1);
mux4: mux8bit
	generic map(nr_sel=>2,
	X=>("00110000","00110000","01010000","00110000"))
	port map(sel=>MODA(1 downto 0),
	Y=>a0);
process(SELMA,m1,m0,a1,a0,ClaSup,Presp)
begin
case SELMA is
	when '0' => rezm<=m1;
	when '1' => rezm<=a1;
	when others => rezm<="00000000";
end case;
case SELMA is
	when '0' =>rezs<=m0;
	when '1' => rezs<=a0;
	when others => rezs<="00000000";
end case;
end process;
mux5: mux8bit
    generic map(nr_sel=>2,
	X=>("00000111","00001111","00011111","00000000"))
	port map(sel=>rot_sel,
	Y=>RM);
mux6: mux8bit
    generic map(nr_sel=>2,
	X=>("00011111","00000111","00001111","00011111"))
	port map(sel=>MODA(1 downto 0),
	Y=>RA);
process(SELMA,RM,RA)
	begin
	if(SELMA='0') then 
        RT<=RM;
        elsif (SELMA='1') then
        RT<=RA;
        else
        RT<=(others=>'0');
        end if;
end process;
ff2:d_flipflop
	port map(q=>q2,clk=>clk,d=>d(2));
ff1:d_flipflop
	port map(q=>q1,clk=>clk,d=>d(1));
ff0:d_flipflop
    port map(q=>q0,clk=>clk,d=>d(0));
process(q2,q1,q0,pwr,fin,ok_out,close_door,start)
	begin
	d(2)<=(q2 and close_door) or (q1 and start);
	d(1)<=(q1 and (not ok_out)) or ((not q2) and q0 and close_door);
	d(0)<=((not q2) and pwr) or (q0 and (not fin));
end process;
	decoder:decoder38
	port map(input=>d,state=>state);
 displayf: display
        port map(input1=>rezm,
        input0=>rezs,
        RT=>RT,
        clk=>clk,
       start=>start,
        reset=>reset,
       pwr=>pwr,
       close_door=>close_door,
        presp=>presp,
        clasup=>clasup,
        moda=>moda,
        selma=>selma,
        state=>state,
        rot_out=>rot_out,
        outputs=>output,
        selout=>selout,
        fin=>fin,
        ok_out=>ok_out,
        blk=>blk
        );   

end Behavioral;