library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity AndGate is 
	port (A, B: in std_logic; C: out std_logic);
end entity AndGate;

architecture Archi of AndGate is 
begin 
	-- And op used
	C <= (A and B);
end architecture Archi;