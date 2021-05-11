library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity PreProcess is 
port (Cin: in std_logic;
		I1, I2: in std_logic_vector(7 downto 0);
		O1, O2: out std_logic_vector(7 downto 0));
end entity;

architecture arch of PreProcess is 
	
	signal flow: std_logic_vector(7 downto 0);
	
	component AndMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component XorMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	begin
	
	--inputs are cin, b and a
		-- we sequentially xor every bit of b with cin and then store the values of G(i,i) and P(i, i)
	
	pretag: for j in 0 to 7 generate
		-- cin xor b(i)
		pre_XorInst1: XorMux port map(A => Cin, B => I2(j), C => flow(j));
		
		-- G(i,i) = a(i).(cin xor b(i))
		pre_AndInst: AndMux port map(A => I1(j), B =>  flow(j), C => O1(j));
		-- G(i,i) = a(i) xor(cin xor b(i))
		pre_XorInst2: XorMux port map(A => I1(j), B => flow(j), C => O2(j));
	end generate;
		
	
	
end arch;
