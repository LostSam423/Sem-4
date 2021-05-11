library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity OrGate is 
	port (A: in std_logic_vector(3 downto 0); C: out std_logic);
end entity OrGate;

architecture OT of OrGate is
begin 
	-- Or op used
	C <= A(0) or A(1) or A(2) or A(3);
end architecture OT;