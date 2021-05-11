library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity Delta is 
port( s: in std_logic_vector(2 downto 0); 
		d: out std_logic_vector(2 downto 0));
end entity;

architecture arch of Delta is

	signal var: std_logic_vector(2 downto 0);
	
	component AndGate
		port (A, B: in std_logic; C: out std_logic);
	end component;
	
	component OrGate
		port (A, B: in std_logic; C: out std_logic);
	end component;
	
	component NotGate
		port (A: in std_logic; B: out std_logic);
	end component;
	
	begin
	-- Delta 0 
	not0: NotGate
		port map(A=>s(0), B=>d(0));
		
	-- Delta 1
	not1: NotGate
		port map(A=>s(2), B=>var(0));
	or0: OrGate
		port map(A=>s(1), B=>s(0), C=>var(1));
	and0: AndGate
		port map(A=>var(0), b=>var(1), C=>d(1));
		
	-- Delta 2
	or1: OrGate
		port map(A=>s(2), B=>s(0), C=>var(2));
	and1: AndGate
		port map(A=>s(1), B=>var(2), C=>d(2));
		
end arch;

