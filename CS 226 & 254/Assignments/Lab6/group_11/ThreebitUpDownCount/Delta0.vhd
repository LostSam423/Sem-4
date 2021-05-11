library ieee;
use ieee.std_logic_1164.all;

entity Delta0 is
	port(
		up: in std_logic;
		cur: in std_logic_vector(2 downto 0);
		pre: out std_logic
	);
end entity;

architecture arch of Delta0 is
	
	component NotGate
		port (A: in std_logic; B: out std_logic);
	end component;
	
	begin
	
	-- s0 := ~s0
	not0: NotGate port map(A => cur(0), B => pre);
	
end arch;