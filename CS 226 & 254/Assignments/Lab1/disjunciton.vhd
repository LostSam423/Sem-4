entity disjunction is 
	port(A, B: in bit;
			C: out bit);
end disjunction;

architecture structure of disjunction is
begin
	C <= A or B;
end structure;