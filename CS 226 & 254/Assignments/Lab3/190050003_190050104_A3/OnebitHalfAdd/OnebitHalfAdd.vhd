library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity OnebitHalfAdd is
	port(a,b: in std_logic;
		sum,carry: out std_logic);
end entity;

architecture arch of OnebitHalfAdd is
	signal p: std_logic_vector(2 downto 0);
	
	component TwoByOneMux
		port( i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic);
	end component;
	
	begin 
	-- And a and b to get carry
	mux1: TwoByOneMux port map( i(0) => '0', i(1) => b, sel => a, z => carry);
	
	-- xor a and b to get sum
	mux2: TwoByOneMux port map( i(0) => '0', i(1) => '1', sel => b, z => p(1));
	mux3: TwoByOneMux port map( i(0) => '1', i(1) => '0', sel => b, z => p(2));
	mux4: TwoByOneMux port map( i(0) => p(1), i(1) => p(2), sel => a, z => sum);
	
end arch;