library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity FourbitComp is
	port ( a, b: in std_logic_vector(1 downto 0);
	l, g, e: out std_logic);
end entity;

architecture arch of FourbitComp is 
	
	signal less, greater: std_logic; -- these are created just to get e from l and g in an easier to implement way
	signal l1, l2, l3, l4: std_logic; -- helper signals
	signal g1, g2, g3, g4: std_logic; -- helper signals
	signal e1: std_logic; -- helper signals
	
	component TwoByOneMux 
	port (
		I: in std_logic_vector(1 downto 0);
		SEL: in std_logic;
		Z: out std_logic
	);
	end component;
	
	begin
	
	-- computing g = a1.~b1 + a0.~b0.(a1 + ~b1)
	
	-- g1 = a1.~b1
	tbo_g0: TwoByOneMux port map (I(1) => '0', I(0) => a(1), SEL => b(1), Z => g1);
	
	-- g2 = a0.~b0
	tbo_g1: TwoByOneMux port map (I(1) => '0', I(0) => a(0), SEL => b(0), Z => g2);
	-- g3 = a1 + ~b1
	tbo_g2: TwoByOneMux port map (I(1) => a(1), I(0) => '1', SEL => b(1), Z => g3);
	-- g4 = g2.g3
	tbo_g3: TwoByOneMux port map (I(1) => g3, I(0) => '0', SEL => g2, Z => g4);
	
	-- less = g1 + g4
	tbo_g4: TwoByOneMux port map (I(1) => '1', I(0) => g1, SEL => g4, Z => greater);
	
	-- similarly computing l = ~a1.b1 + ~a0.b0.(~a1 + b1)
	
	-- l1 = ~a1.b1
	tbo_l0: TwoByOneMux port map (I(1) => '0', I(0) => b(1), SEL => a(1), Z => l1);
	
	-- l2 = ~a0.b0
	tbo_l1: TwoByOneMux port map (I(1) => '0', I(0) => b(0), SEL => a(0), Z => l2);
	-- l3 = ~a1 + b1
	tbo_l2: TwoByOneMux port map (I(1) => b(1), I(0) => '1', SEL => a(1), Z => l3);
	-- l4 = l2.l3
	tbo_l3: TwoByOneMux port map (I(1) => l3, I(0) => '0', SEL => l2, Z => l4);
	
	-- l5 = l1 + l4
	tbo_l4: TwoByOneMux port map (I(1) => '1', I(0) => l1, SEL => l4, Z => less);
	
	-- e = ~less.~greater
	
	tbo_e1: TwoByOneMux port map (I(1) => '0', I(0) => '1', SEL => less, Z => e1);
	tbo_e2: TwoByOneMux port map (I(1) => '0', I(0) => e1, SEL => greater, Z => e);
	
	l <= less;
	g <= greater;
		
end arch;
