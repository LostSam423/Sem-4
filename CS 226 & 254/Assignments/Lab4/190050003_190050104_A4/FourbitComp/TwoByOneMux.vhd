library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

-- defining entity and input and output ports
entity TwoByOneMux is
	port( I : in std_logic_vector(1 downto 0);
			SEL : in std_logic;
			Z : out std_logic);
end entity;

-- setting up architecture for the 2 by 1 Mux
architecture twobyonearch of TwoByOneMux is

	-- storing outputs of and gate and not of sel
	signal flow: std_logic_vector(2 downto 0);
	
	-- loading component that computes AND of two inputs
	component AndGate
		port(A,B : in std_logic; C : out std_logic);
	end component;
	
	-- loading component that computes NOT of two inputs
	component NotGate
		port(A: in std_logic; B : out std_logic);
	end component;
	
	-- loading component that computes OR of two inputs
	component OrGate
		port(A,B : in std_logic; C: out std_logic);
	end component;
	
	begin
	-- Generating not of sel and storing in flow
	NotInst0: NotGate port map(A => SEL, B => flow(0));
	-- Taking And of first bit and not(sel) and storing in flow
	AndInst0: AndGate port map(A => I(0), B => flow(0), C => flow(1));
	-- Taking And of 2nd bit and sel and storing in flow
	AndInst1: AndGate port map(A => I(1), B => SEL, C => flow(2) );
	-- Taking or of the stored bits and outputting final value
	OrInst0: OrGate port map(A => flow(1),  B => flow(2), C=> Z);
	
end twobyonearch;
