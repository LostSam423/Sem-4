entity negation is 
	port(A: in bit;
			B: out bit);
end negation;

architecture structure of negation is
begin
	B <= not A;
end structure;