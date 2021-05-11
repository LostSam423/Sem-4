library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity neg is 
	port(A: in std_logic;
			B: out std_logic);
end neg;

architecture structure of neg is
begin
	B <= not A;
end structure;