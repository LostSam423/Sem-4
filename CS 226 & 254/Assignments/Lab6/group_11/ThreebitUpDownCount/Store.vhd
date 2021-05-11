library ieee;
use ieee.std_logic_1164.all;

entity Store is
	port(
		clk, rst: in std_logic;
		pre: in std_logic_vector(2 downto 0);
		cur: out std_logic_vector(2 downto 0)
	);
end entity;

architecture arch of Store is
	
	component DFlipFlop is
		port (clk, rst, d: in std_logic; q: out std_logic);
	end component;
	
	begin
	
	ff0: DFlipFlop port map(clk => clk, rst => rst, d => pre(0), q => cur(0));
	ff1: DFlipFlop port map(clk => clk, rst => rst, d => pre(1), q => cur(1));
	ff2: DFlipFlop port map(clk => clk, rst => rst, d => pre(2), q => cur(2));
 	
end arch;