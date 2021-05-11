library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity Storage is 
port( d: in std_logic_vector(2 downto 0);
		clk,rst: in std_logic;
		s: out std_logic_vector(2 downto 0));
end entity;

architecture arch of Storage is

	component DFlipFlop
		port(clk,rst,d: in std_logic; q: out std_logic);
	end component;
	
	begin
	
	-- Storing s(0)
	dff0: DFlipFlop
		port map(clk=>clk, rst=>rst, d=>d(0), q=>s(0));
		
	-- Storing s(1)
	dff1: DFlipFlop
		port map(clk=>clk, rst=>rst, d=>d(1), q=>s(1));
		
	-- Storing s(2)
	dff2: DFlipFlop
		port map(clk=>clk, rst=>rst, d=>d(2), q=>s(2));
end arch;