library ieee;
use ieee.std_logic_1164.all;

entity Delta1 is
	port(
		up: in std_logic;
		cur: in std_logic_vector(2 downto 0);
		pre: out std_logic
	);
end entity;

architecture arch of Delta1 is

	signal flow: std_logic_vector(3 downto 0);
	signal negs: std_logic_vector(3 downto 0);
	
	component AndGate
		port (A: in std_logic_vector(3 downto 0); C: out std_logic);
	end component;
	
	component OrGate
		port (A: in std_logic_vector(3 downto 0); C: out std_logic);
	end component;
	
	component NotGate
		port (A: in std_logic; B: out std_logic);
	end component;
	
	begin
	
	--storing negations
	not0: NotGate port map(A => cur(0), B => negs(0));
	not1: NotGate port map(A => cur(1), B => negs(1));
	not2: NotGate port map(A => cur(2), B => negs(2));
	not3: NotGate port map(A => up, B => negs(3));
	
	-- a = ~s1.~s0.~up
	and0: AndGate port map(A(0) => '1', A(1) => negs(1), A(2) => negs(0), A(3) => negs(3), C => flow(0));
	-- b = s1.~s0.up
	and1: AndGate port map(A(0) => '1', A(1) => cur(1), A(2) => negs(0), A(3) => up, C => flow(1));
	-- c = ~s1.s0.up
	and2: AndGate port map(A(0) => '1', A(1) => negs(1), A(2) => cur(0), A(3) => up, C => flow(2));
	-- d = s1.s0.~up
	and3: AndGate port map(A(0) => '1', A(1) => cur(1), A(2) => cur(0), A(3) => negs(3), C => flow(3));
	
	-- s1 := a + b + c + d
	or1: OrGate port map(A(0) => flow(0), A(1) => flow(1), A(2) => flow(2), A(3) => flow(3), C => pre);
	
end arch;