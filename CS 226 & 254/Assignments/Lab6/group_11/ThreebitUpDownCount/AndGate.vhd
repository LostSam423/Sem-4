library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity AndGate is 
	port (A: in std_logic_vector(3 downto 0); C: out std_logic);
end entity AndGate;

architecture Archi of AndGate is 
begin 
	-- And op used
	C <= A(0) and A(1) and A(2) and A(3);
end architecture Archi;