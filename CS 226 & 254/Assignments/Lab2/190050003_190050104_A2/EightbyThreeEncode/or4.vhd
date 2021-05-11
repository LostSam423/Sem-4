library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity OrFour is
port (
	I: in std_logic_vector(3 downto 0);
	O: out std_logic);	

end entity;

architecture str of OrFour is
	signal x,y: std_logic;
	
	component dis
		port(A: in std_logic; B: in std_logic; C: out std_logic);
	end component;
	
	begin
	
	dis1: dis port map(A => I(3), B => I(2), C => x);
	dis2: dis port map(A => x, B => I(1), C => y);
	dis3: dis port map(A => y, B => I(0), C => O);

end str;