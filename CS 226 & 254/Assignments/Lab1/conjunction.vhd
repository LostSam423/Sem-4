entity conjunction is
	port(A: in bit;
			B: in bit;
			C: out bit);
end conjunction;

architecture structure of conjunction is
begin
	C <= A and B;
end structure;