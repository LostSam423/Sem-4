library ieee;
use ieee.std_logic_1164.all;

entity DFlipFlop is
	port (
		clk, rst: in std_logic;
		d: in std_logic_vector(7 downto 0);
		q: out std_logic_vector(7 downto 0)
	);
end entity;

architecture behave of DFlipFlop is
begin
	process (clk)
	begin
		if (rising_edge(clk)) then
			if (rst = '1' ) then
				q <= "00000000";
			else
				q <= d;
			end if;
		end if;
	end process;
end architecture;