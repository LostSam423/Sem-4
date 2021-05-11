library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is
end entity;

architecture arch of TestBench is
	component EightbitKogStonAddSub is
		port
			(
				a,b : in std_logic_vector (7 downto 0);
				cin : in std_logic;
				sum : out std_logic_vector (7 downto 0);
				cout : out std_logic
			);
	end component;
	
	signal a,b : std_logic_vector (7 downto 0);
	signal cin: std_logic;
	signal sum: std_logic_vector (7 downto 0);
	signal carry: std_logic;

	begin
	dut_instance: EightbitKogStonAddSub
		port map ( a => a, b => b, cin => cin, sum => sum, cout => carry);
		
	process
	begin
	
	for c in 0 to 1 loop 
		if c = 0 then
			cin <= '0';
		else
			cin <= '1';
		end if;
		
		for i in 0 to 2**8 - 1 loop
			a <= std_logic_vector( to_unsigned(i, 8) );
			for j in 0 to 2**8 - 1 loop
				b <= std_logic_vector( to_unsigned(j, 8) );
				wait for 10 ps;
			end loop;
		end loop;
	end loop;
	
	end process;
end architecture;