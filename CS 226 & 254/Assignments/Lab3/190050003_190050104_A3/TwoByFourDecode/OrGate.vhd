library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity OrGate is 
	port (A, B: in std_logic; C: out std_logic);
end entity OrGate;

architecture OT of OrGate is
begin 
	-- Or op used
	C <= A or B;
end architecture OT;