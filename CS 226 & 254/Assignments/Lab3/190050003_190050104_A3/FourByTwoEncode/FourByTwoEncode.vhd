library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity FourByTwoEncode is
	port(i: in std_logic_vector(3 downto 0);
			en: in std_logic;
			z: out std_logic_vector(1 downto 0));
end entity;

architecture arch of FourByTwoEncode is

	signal flow: std_logic_vector(1 downto 0);
	
	component OrByMux is
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component AndByMux is
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	begin
	OrInst0: OrByMux port map( A => i(1), B => i(3), C => flow(0));
	AndInst0: AndByMux port map( A => flow(0) , B => en, C => z(0));
	
	OrInst1: OrByMux port map( A => i(2), B => i(3), C => flow(1));
	AndInst1: AndByMux port map( A => flow(1) , B => en, C => z(1));
	
end arch;

library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;
entity OrByMux is
	port(A : in std_logic; B: in std_logic; C : out std_logic);
end entity;

architecture orarch of OrByMux is
	
	component TwoByOneMux
		port( i : in std_logic_vector(1 downto 0);
				sel : in std_logic;
				z : out std_logic);
	end component;
	begin
		TwoByOneInst0: TwoByOneMux port map( i(0) => B, i(1) => '1', sel => A, z => C);
end orarch;

library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity AndByMux is
	port(A,B: in std_logic; C: out std_logic);
end entity;

architecture andarch of AndByMux is
	
	component TwoByOneMux
		port( i : in std_logic_vector(1 downto 0);
				sel : in std_logic;
				z : out std_logic);
	end component;
	begin
		TwoByOneInst0: TwoByOneMux port map( i(0)=> '0', i(1) => B,sel => A, z => C);
end andarch;