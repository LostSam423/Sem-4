library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

-- defining the input and output ports
entity EightbyThreeEncode is
	port(
		i: in std_logic_vector(7 downto 0);
		en: in std_logic;
		z: out std_logic_vector(2 downto 0));
end entity;

-- setting up the architecture for the ENCODER
architecture structure of EightbyThreeEncode is
	
	-- this signal stores outputs from the intermediate 4 input OR gates
	signal flow: std_logic_vector(2 downto 0);
	
	-- loading component that computes AND of two given inputs
	component con
		port(
			A, B: in std_logic;
			C: out std_logic);
	end component;
	
	-- loading component that outputs I1 | I2 | I3 | I4, where | represents or. 
	component OrFour
		port(
			I: in std_logic_vector(3 downto 0);
			O: out std_logic
		);	
	end component;


	begin
	
	--making 4 instances of the 4 input OR gate
	
	-- first bit will be one when one of 7, 6, 5, 4 are present
	inst2: OrFour port map(I(0) => i(7), I(1) => i(6), I(2) => i(5), I(3) => i(4), O => flow(2));
	con2: con port map(A => en, B => flow(2), C => z(2));
	
	-- second bit will be one when one of 7, 6, 3, 2 are present
	inst1: OrFour port map(I(0) => i(7), I(1) => i(6), I(2) => i(3), I(3) => i(2), O => flow(1));
	con1: con port map(A => en, B => flow(1), C => z(1));
	
	-- third bit will be one when one of 7, 5, 3, 1 are present
	inst0: OrFour port map(I(0) => i(7), I(1) => i(5), I(2) => i(3), I(3) => i(1), O => flow(0));
	con0: con port map(A => en, B => flow(0), C => z(0));
	
end structure;