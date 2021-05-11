library IEEE;
use ieee.std_logic_1164.all;

entity NotThree is 
	port(A: in std_logic_vector(2 downto 0);
			B: out std_logic_vector(2 downto 0));
end NotThree;

architecture structure of NotThree is
	
	component neg
	port (A: in std_logic; B: out std_logic);
	end component;

	begin

	neg1: neg port map(A => A(0), B => B(0));
	neg2: neg port map(A => A(1), B => B(1));
	neg3: neg port map(A => A(2), B => A(2));
	
end structure;