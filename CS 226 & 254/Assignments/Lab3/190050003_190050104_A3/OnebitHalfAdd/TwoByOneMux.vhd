library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

-- defining entity and input and output ports
entity TwoByOneMux is
	port( i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic);
end entity;

-- setting up architecture for the 2 by 1 Mux
architecture twobyonearch of TwoByOneMux is

	-- storing outputs of and gate and not of sel
	signal flow: std_logic_vector(2 downto 0);
	
	-- loading component that computes AND of two inputs
	component AndGate
		port(A,B : in std_logic; C : out std_logic);
	end component;
	
	-- loading component that computes NOT of two inputs
	component NotGate
		port(A: in std_logic; B : out std_logic);
	end component;
	
	-- loading component that computes OR of two inputs
	component OrGate
		port(A,B : in std_logic; C: out std_logic);
	end component;
	
	begin
	-- Generating not of sel and storing in flow
	NotInst0: NotGate port map(A => sel, B => flow(0));
	-- Taking And of first bit and not(sel) and storing in flow
	AndInst0: AndGate port map(A => i(0), B => flow(0), C => flow(1));
	-- Taking And of 2nd bit and sel and storing in flow
	AndInst1: AndGate port map(A => i(1), B => sel, C => flow(2) );
	-- Taking or of the stored bits and outputting final value
	OrInst0: OrGate port map(A => flow(1),  B => flow(2), C=> z);
	
end twobyonearch;
library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;
-- AND component
entity AndGate is 
	port (A, B: in std_logic; C: out std_logic);
end entity AndGate;

architecture Archi of AndGate is 
begin 
	-- And op used
	C <= (A and B);
end architecture Archi;

library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;

-- OR component
entity OrGate is 
	port (A, B: in std_logic; C: out std_logic);
end entity OrGate;

architecture OT of OrGate is
begin 
	-- Or op used
	C <= A or B;
end architecture OT;

library work;
use work.all;

library IEEE;
use ieee.std_logic_1164.all;
-- NOT component
entity NotGate is
	port ( A: in std_logic; B: out std_logic);
end entity NotGate;

architecture NG of NotGate is
begin 
	-- Not op used
	B <= not A;
end architecture NG;