library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity MuxNOT is
	port (
		I: in std_logic;
		O: out std_logic);
end entity;

architecture arch of MuxNOT is
	component TwoByOneMux 
		port (I: in std_logic_vector(1 downto 0); SEL: in std_logic; Z: out std_logic);
	end component;
	
	begin
	
	tbo1: TwoByOneMux port map(I(0) => '1', I(1) => '0', SEL => I, Z => O);
	
end arch;