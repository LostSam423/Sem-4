library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity FourbitFullAdd is 
	port(a,b: in std_logic_vector(3 downto 0);
			cin: in std_logic;
			sum: out std_logic_vector(3 downto 0);
			carry: out std_logic);
end entity;

architecture arch of FourbitFullAdd is
	
	signal flow: std_logic_vector(2 downto 0);
	
	component OnebitFullAdd
		port(
		a, b, cin: in std_logic;
		sum, carry: out std_logic
		);
	end component;
	
	begin
		FullAdd0: OnebitFullAdd port map(a => a(0), b => b(0), cin=>cin, sum =>sum(0), carry=>flow(0));
		FullAdd1: OnebitFullAdd port map(a => a(1), b => b(1), cin=>flow(0), sum =>sum(1), carry=>flow(1));
		FullAdd2: OnebitFullAdd port map(a => a(2), b => b(2), cin=>flow(1), sum =>sum(2), carry=>flow(2));
		FullAdd3: OnebitFullAdd port map(a => a(3), b => b(3), cin=>flow(2), sum =>sum(3), carry=>carry);
	
	end arch;
