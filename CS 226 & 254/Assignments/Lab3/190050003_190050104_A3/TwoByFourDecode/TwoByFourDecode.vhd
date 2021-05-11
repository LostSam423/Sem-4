library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity TwoByFourDecode is
	port( i: in std_logic_vector(1 downto 0);
			en: in std_logic;
			z: out std_logic_vector(3 downto 0));
end entity;

architecture arch of TwoByFourDecode is
	signal nots: std_logic_vector(1 downto 0);
	
	-- loading components
	component MuxNOT 
		port (I: in std_logic; O: out std_logic);
	end component;
	
	component ThreeAND 
		port (I: in std_logic_vector(2 downto 0); O: out std_logic);
	end component;
	
	begin
	--nots
	not0: MuxNOT port map(I => i(0), O => nots(0));
	not1: MuxNOT port map(I => i(1), O => nots(1));
	
	--z(3): using defined 3AND gate to and 3 inputs i.e. i(0), i(1) & en
	and3: ThreeAND port map(I(0) => i(0), I(1) => i(1), I(2) => en, O => z(3));
	
	--z(2): using defined 3AND gate to and 3 inputs i.e. ~i(0), i(1) & en
	and2: ThreeAND port map(I(0) => nots(0), I(1) => i(1), I(2) => en, O => z(2));
	
	--z(1): using defined 3AND gate to and 3 inputs i.e. i(0), ~i(1) & en 
	and1: ThreeAND port map(I(0) => i(0), I(1) => nots(1), I(2) => en, O => z(1));
	
	--z(0): using defined 3AND gate to and 3 inputs i.e. ~i(0), ~i(1) & en
	and0: ThreeAND port map(I(0) => nots(0), I(1) => nots(1), I(2) => en, O => z(0));	
		
end arch;
