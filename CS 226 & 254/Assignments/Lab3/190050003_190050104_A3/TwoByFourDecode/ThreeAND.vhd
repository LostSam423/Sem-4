library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity ThreeAND is
	port (
		I: in std_logic_vector(2 downto 0);
		O: out std_logic
	);
end entity;

architecture arch of ThreeAND is
	signal flow: std_logic;
	
	component TwoByOneMux 
		port (I: in std_logic_vector(1 downto 0); SEL: in std_logic; Z: out std_logic);
	end component;
	
	-- defining 3AND input gate using ROBDD
	begin
	tbo1: TwoByOneMux port map(I(0) => '0', I(1) => i(0), SEL => i(1), Z => flow);
	tbo2: TwoByOneMux port map(I(0) => '0', I(1) => flow, SEL => i(2), Z => O);
	
end arch;