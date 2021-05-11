library work;
use work.all;

library ieee;
use ieee.std_logic_1164.all;

entity dis is 
	port(A, B: in std_logic;
			C: out std_logic);
end dis;

architecture structure of dis is
begin
	C <= A or B;
end structure;