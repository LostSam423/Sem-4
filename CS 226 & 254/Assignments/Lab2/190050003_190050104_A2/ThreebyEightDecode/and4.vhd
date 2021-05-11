library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity AndFour is 
	port(A: in std_logic_vector(3 downto 0);
			B: out std_logic);
end entity;

architecture structure of AndFour is
	signal x, y: std_logic;
	
	component con
	port (A: in std_logic; B: in std_logic; C: out std_logic);
	end component;

begin
	con1: con port map(A => A(0), B => A(1), C => x);
	con2: con port map(A => x, B => A(2), C => y);
	con3: con port map(A => y, B => A(3), C => B);
	
end structure;