library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity OnebitHalfAdd is
	port(a,b: in std_logic;
		sum,carry: out std_logic);
end entity;

architecture arch of OnebitHalfAdd is
	signal p: std_logic_vector(2 downto 0);
	
	component TwoByOneMux
		port(I: in std_logic_vector(1 downto 0);
			SEL: in std_logic;
			Z : out std_logic);
	end component;
	
	begin 
	-- And a and b to get carry
	mux1: TwoByOneMux port map( I(0) => '0', I(1) => a, SEL => b, Z => carry);
--	mux2: TwoByOneMux port map( I(0) => '0', I(1) => p(0), SEL => a, Z => carry);
	
	-- xor a and b to get sum
	mux3: TwoByOneMux port map( I(0) => '0', I(1) => '1', SEL => b, Z => p(1));
	mux4: TwoByOneMux port map( I(0) => '1', I(1) => '0', SEL => b, Z => p(2));
	mux5: TwoByOneMux port map( I(0) => p(1), I(1) => p(2), SEL => a, Z => sum);
	
end arch;