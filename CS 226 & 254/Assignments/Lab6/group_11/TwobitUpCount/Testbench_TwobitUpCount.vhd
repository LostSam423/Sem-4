library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TestBench is
end entity;

architecture arch of TestBench is
	component TwobitUpCount is
		port ( 
			clk, rst: in std_logic;
			count: out std_logic_vector(1 downto 0)
		);
	end component;
	
	constant clkFreq : integer := 100e6;
	constant clkPer : time := 1000 ms / clkFreq;
	
	signal clk : std_logic := '1';
	signal rst: std_logic := '1';
	signal count: std_logic_vector(1 downto 0);
	
begin
	dut_instance: TwobitUpCount
		port map ( clk => clk, rst => rst, count => count );
	
	clk <= not clk after clkPer/2;
	
	process
	begin
		wait for 13 ns;
		rst <= '0';
		wait for 81 ns;
		rst <= '1';
	end process;
end arch;