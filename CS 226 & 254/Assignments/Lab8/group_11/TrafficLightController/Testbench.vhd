library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use IEEE.numeric_std.all;

entity Testbench is
end entity;

architecture arch of Testbench is 
	component TrafficLightController is
	port ( clk, rst : in std_logic;
				green, yellow, red : out std_logic_vector(3 downto 0)
			);
	end component;
	signal clksig, rstsig : std_logic;
	signal r,g,y : std_logic_vector(3 downto 0);

begin
	dut_instance : TrafficLightController
		port map(clk => clksig, rst => rstsig, red => r, yellow => y,green => g);
	process
	begin
		for i in 0 to 1000 loop
			clksig <= '1';
			if( i = 0) then
				rstsig <= '1';
				else
				rstsig <= '0';
			end if;
			wait for 2.5 sec;
			clksig <= '0';
			wait for 2.5 sec;
		end loop;
	wait;
	end process;
end architecture;