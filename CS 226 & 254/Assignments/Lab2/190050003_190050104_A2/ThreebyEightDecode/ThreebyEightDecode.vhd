library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity ThreebyEightDecode is 
	port(
		i: in std_logic_vector(2 downto 0);
		en: in std_logic;
		z: out std_logic_vector(7 downto 0)
	);
end entity;

architecture st of ThreebyEightDecode is
	-- to store negation of input bits
	signal negs: std_logic_vector(2 downto 0);
	
	component con
		port (A: in std_logic; B: in std_logic; C: out std_logic);
	end component;
	
	component AndFour
		port (A: in std_logic_vector(3 downto 0); B: out std_logic);
	end component;
	
	component neg
		port (A: in std_logic; B: out std_logic);
	end component;
	
	begin 
	
	neg0: neg port map(A => i(0), B => negs(0));
	neg1: neg port map(A => i(1), B => negs(1));
	neg2: neg port map(A => i(2), B => negs(2));
	
	
	inst7: AndFour port map(A(0) => i(0), A(1) => i(1), A(2) => i(2), A(3) => en, B => z(7)); 
	
	inst6: AndFour port map(A(0) => negs(0), A(1) => i(1), A(2) => i(2), A(3) => en, B => z(6));
	
	inst5: AndFour port map(A(0) => i(0), A(1) => negs(1), A(2) => i(2), A(3) => en, B => z(5)); 
	
	inst4: AndFour port map(A(0) => negs(0), A(1) => negs(1), A(2) => i(2), A(3) => en, B => z(4));
	
	inst3: AndFour port map(A(0) => i(0), A(1) => i(1), A(2) => negs(2), A(3) => en, B => z(3)); 
	
	inst2: AndFour port map(A(0) => negs(0), A(1) => i(1), A(2) => negs(2), A(3) => en, B => z(2));
	
	inst1: AndFour port map(A(0) => i(0), A(1) => negs(1), A(2) => negs(2), A(3) => en, B => z(1)); 
	
	inst0: AndFour port map(A(0) => negs(0), A(1) => negs(1), A(2) => negs(2), A(3) => en, B => z(0));
	
end st;