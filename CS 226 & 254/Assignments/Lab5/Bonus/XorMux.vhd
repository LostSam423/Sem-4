library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity XorMux is
port( A,B: in std_logic;
		C: out std_logic);
end entity;

architecture arch of XorMux is
	
	signal flow : std_logic;
	component TwoByOneMux
		port( I : in std_logic_vector(1 downto 0);
			SEL : in std_logic;
			Z : out std_logic);
	end component;
	
	begin
	Mux0: TwoByOneMux port map(I(0) => '1', I(1) => '0', SEL => B, Z => flow);
	Mux1: TwoByOneMux port map(I(0) => B, I(1) => flow, SEL => A, Z => C);
end arch;