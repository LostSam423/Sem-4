library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

-- here we define a generic node in the graph
entity Node is 
port (g1, p1, g2, p2: in std_logic;
		gout, pout: out std_logic);
end entity;

architecture arch of Node is 
	
	signal flow: std_logic;
	
	component AndMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component OrMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component XorMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component NotMux
		port(A: in std_logic; B: out std_logic);
	end component;
	
	begin
	
	-- ouputs gout = g1 + g2.p1
	AndInst0: AndMux port map(A => p1, B => g2, C => flow);
	OrInst: OrMux port map(A => g1, B => flow, C => gout);
	
	-- ouputs pout = p1.p2
	AndInst1: AndMux port map(A => p1, B => p2, C => pout); 
	
end arch;


	
	