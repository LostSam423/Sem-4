library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity PostProcess is 
port (I1, I2, I3: in std_logic_vector(7 downto 0);
		CIN: in std_logic;
		O1: out std_logic;
		O2: out std_logic_vector(7 downto 0));
end entity;

architecture arch of PostProcess is 
	
	signal flow, carry: std_logic_vector(7 downto 0);
	
	component AndMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component OrMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	component XorMux
		port(A,B: in std_logic; C: out std_logic);
	end component;
	
	
	begin
	-- inputs are the values G(i,0), P(i,0), P(i, i) for all i
	-- ouputs sum and cout
	
	-- this part calculates carry as c(i+1) = G(i,0) + P(i,0),c(i)
	carry_calc0: for j in 0 to 7 generate
		post_AndInst: AndMux port map(A => I2(j), B => CIN, C => flow(j));
	end generate;
	
	carry_calc1: for j in 0 to 6 generate
		post_OrInst0: OrMux port map(A => I1(j), B => flow(j), C => carry(j+1));
	end generate;
		
	post_OrInst1: OrMux port map(A => I1(7), B => flow(7), C => O1);
	
	-- this part calculates sum(i) = P(i,i) xor c(i)
	post_XorInst1: XorMux port map(A => I3(0), B => cin, C => O2(0));	
	sum_calc: for j in 1 to 7 generate
		post_XorInst3: XorMux port map(A => I3(j), B => carry(j), C => O2(j));
	end generate;
		
	
end arch;