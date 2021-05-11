library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity TwobitUpCount is
	port(clk,rst: in std_logic;
			count : out std_logic_vector(1 downto 0));
end entity;

architecture arch of TwobitUpCount is

	-- signals to store intermediate states
	signal di: std_logic_vector(2 downto 0);
	signal s: std_logic_vector(2 downto 0);
	
	-- Delta as component 
	component Delta is 
		port( s: in std_logic_vector(2 downto 0); 
				d: out std_logic_vector(2 downto 0));
	end component;
	
	-- Storage as component
	component Storage is 
		port( d: in std_logic_vector(2 downto 0);
				clk,rst: in std_logic;
				s: out std_logic_vector(2 downto 0));
	end component;

	begin
	
	Storage0: Storage
		port map(clk=>clk, rst=>rst, d=>di, s=>s);
	
	Delta0: Delta 
		port map(s=>s, d=>di);
	
	-- Outputs
	count(0) <= s(0);
	count(1) <= s(1);
	
end arch;	  
