library ieee;
use ieee.std_logic_1164.all;

entity ThreebitUpDownCount is
	port( clk, rst, up: in std_logic;
	count: out std_logic_vector(2 downto 0));
end entity;

architecture arch of ThreebitUpDownCount is
	
	-- this signal store previous/current state and in the end of the code it'll store the next state for the next call 
	signal pre: std_logic_vector(2 downto 0);
	-- in this signal we just copy the previous state
	signal cur: std_logic_vector(2 downto 0);
	
	component Store is
		port(
			clk, rst: in std_logic;
			pre: in std_logic_vector(2 downto 0);
			cur: out std_logic_vector(2 downto 0)
		);
	end component;
	
	component Delta0 is
		port(
			up: in std_logic;
			cur: in std_logic_vector(2 downto 0);
			pre: out std_logic
		);
	end component;
	
	component Delta1 is
		port(
			up: in std_logic;
			cur: in std_logic_vector(2 downto 0);
			pre: out std_logic
		);
	end component;
	
	component Delta2 is
		port(
			up: in std_logic;
			cur: in std_logic_vector(2 downto 0);
			pre: out std_logic
		);
	end component;
	
	begin
	
	-- get the stored states
	states: Store port map(clk=> clk, rst=> rst, pre => pre, cur => cur);
	
	--delta0
	del0: Delta0 port map (up => up, cur => cur, pre => pre(0));
	
	--delta1
	del1: Delta1 port map (up => up, cur => cur, pre => pre(1));
	
	--delta2
	del2: Delta2 port map (up => up, cur => cur, pre => pre(2));
	
	-- we have maintained an invariant that the state that we transition to is the output
	count(0) <= cur(0);
	count(1) <= cur(1);
	count(2) <= cur(2);

end arch;