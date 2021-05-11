library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity con is
	port(A: in std_logic;
			B: in std_logic;
			C: out std_logic);
end con;

architecture structure of con is
begin
	C <= A and B;
end structure;