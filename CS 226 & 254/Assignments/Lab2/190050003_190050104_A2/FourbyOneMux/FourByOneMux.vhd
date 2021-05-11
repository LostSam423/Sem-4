library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

-- defining entity and input and output ports
entity FourByOneMux is 
	port(i: in std_logic_vector(3 downto 0);
			sel: in std_logic_vector(1 downto 0);
			z: out std_logic);
end entity;

-- setting up architecture for the 4 by 1 Mux
architecture fourbyonearch of FourByOneMux is
	
	-- storage signals output from the two 2 by 1 mux
	signal flow: std_logic_vector(1 downto 0);
	
	--loading component that computes 2 by 1 mux
	component TwoByOneMux
		port( I : in std_logic_vector(1 downto 0);
				SEL : in std_logic;
			  Z : out std_logic);
	end component;
	
	begin
		-- computing mux of first two bits and sel(0) bit and storing in flow
		TwoByOneInst0: TwoByOneMux port map( I(0) => i(0), I(1) => i(1), SEL => sel(0), Z => flow(0));
		-- computing mux of last two bits and sel(0) bit and storing in flow
		TwoByOneInst1: TwoByOneMux port map( I(0) => i(2), I(1) => i(3), SEL => sel(0), Z => flow(1));
		-- computing mux of outputs of previous 2 mux and sel(1) bit and outputting in z
		TwoByOneInst2: TwoByOneMux port map( I(0) => flow(0), I(1) =>flow(1), SEL => sel(1), Z => z);
		
end fourbyonearch;