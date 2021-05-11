library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

entity NotGate is
	port ( A: in std_logic; B: out std_logic);
end entity NotGate;

architecture NG of NotGate is
begin 
	-- Not op used
	B <= not A;
end architecture NG;