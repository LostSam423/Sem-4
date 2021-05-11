library IEEE;
use ieee.std_logic_1164.all;

entity Main is
	port(P, Q, R: in bit;
		F: out bit);
end Main;

-- implementing (P => Q) => R which is equivalent to (P and ~Q) or R

architecture structure of Main is
	signal X, Y: bit;
	
	component conjunction
		port(A, B: in bit;
				C: out bit);
	end component;
	
	component disjunction
		port(A, B: in bit;
				C: out bit);			
	end component;
	
	component negation
		port(A: in bit;
				B: out bit);
	end component;
	
	begin
	
	neg: negation port map(A => Q, B => X);
	con: conjunction port map(A => P, B => X, C => Y);
	dis: disjunction port map(A => Y, B => R, C => F);
	
end structure;