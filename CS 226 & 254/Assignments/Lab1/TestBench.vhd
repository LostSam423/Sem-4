entity TestBench is 
end TestBench;

architecture stu of TestBench is
	signal top, mid, bot: bit; --inputs
	signal opt: bit; --output
	
	component Main is
	port(P,Q,R: in bit;
			F: out bit);
	end component;

begin
	tester: Main port map(P => top, Q => mid, R => bot, F => opt);
	
	process
	begin
		
		top <= '0';
		mid <= '0';
		bot <= '0';
		wait for 5 ns;
		
		top <= '0';
		mid <= '0';
		bot <= '1';
		wait for 5 ns;
		
		top <= '0';
		mid <= '1';
		bot <= '0';
		wait for 5 ns;
		
		top <= '0';
		mid <= '1';
		bot <= '1';
		wait for 5 ns;
		
		top <= '1';
		mid <= '0';
		bot <= '0';
		wait for 5 ns;
		
		top <= '1';
		mid <= '0';
		bot <= '1';
		wait for 5 ns;
		
		top <= '1';
		mid <= '1';
		bot <= '0';
		wait for 5 ns;
		
		top <= '1';
		mid <= '1';
		bot <= '1';
		wait for 5 ns;
		
	end process;
end stu;
	
	