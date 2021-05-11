library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity OnebitFullAdd is
	port(
		a, b, cin: in std_logic;
		sum, carry: out std_logic
	);
end entity;

architecture arch of OnebitFullAdd is
	component TwoByOneMux 
		port (
			I: in std_logic_vector(1 downto 0); 
			SEL: in std_logic;
			Z: out std_logic);
	end component;
	
	component OnebitHalfAdd
		port (
			a,b: in std_logic;
			sum, carry: out std_logic);
	end component;
	
	signal flow: std_logic_vector(2 downto 0);
	
	begin
	
	-- suming sequentially first a and b then sum of a and b with cin
	-- using sum = a^b^cin where ^ represents xor
	
	onha0: OnebitHalfAdd port map(a => a, b => b, sum => flow(0), carry => flow(1));
	onha1: OnebitHalfAdd port map(a => flow(0), b => cin, sum => sum, carry => flow(2));
	
	-- using carry= (a&b)|(sum(a,b)&cin), these both terms individually from the 2 instances of OnebitHalfAdd above and are xored in the
	-- following line using ROBDD implementation
	tbo0: TwoByOneMux port map(I(0) => flow(1), I(1) => '1', SEL => flow(2),Z => carry);
	
end arch;