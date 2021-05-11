library work;
use work.all;

library IEEE, std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity RLE is
	port(
		clk, rst: in std_logic;
		input: in std_logic_vector (7 downto 0);
		output: out std_logic_vector (7 downto 0);
		valid: out std_logic
	);
end entity;

architecture arch of RLE is 
	-- signal last stores the last input character
	signal last: std_logic_vector(7 downto 0);
	-- constant for ESC
	constant ESC: std_logic_vector(7 downto 0) := "00011011";
	
	-- FlipFlop to store the 
	component DFlipFlop is
		port(
			clk, rst: in std_logic;
			d: in std_logic_vector(7 downto 0);
			q: out std_logic_vector(7 downto 0)
		);
	end component;
	
	-- the buffer required for the outputs
	type MEM is array (63 downto 0) of std_logic_vector(7 downto 0);
	
	begin
	Store: DFlipFlop port map(clk => clk, rst => rst, d => input, q => last);	-- get the signal to contain the last character
	
	process(clk)
	
	variable buff: MEM;
	variable r: integer := 0;	-- variable r and w represent the read adn write pointers for the buffer
	variable w: integer := 0;
	variable count: integer := 0;
	
	begin
		
		if(rising_edge(clk)) then -- processing invloved after each clock positive edge
			valid <= '0';
			-- if the last input same as the current, then we just 
			if(last = input and count < 15) then
				count := count+1; 
			
			else
				-- add bytes to buffer if the input is valid
				if (last /= "00000001") then 
					-- dealing with ESC seperately
					if(last = ESC) then
						buff(w) := ESC;
						w := (w+1) mod 64;
						buff(w) := std_logic_vector(to_unsigned(count, 8));
						w := (w+1) mod 64;
						buff(w) := ESC;
						w := (w+1) mod 64;
					else
					-- rest of the characters
						if (count = 1) then
							buff(w) := last;
							w := (w+1) mod 64;
						elsif(count = 2) then
							buff(w) := last;
							w := (w+1) mod 64;
							buff(w) := last;
							w := (w+1) mod 64;
						elsif (count > 0) then
							buff(w) := ESC;
							w := (w+1) mod 64;
							buff(w) := std_logic_vector(to_unsigned(count, 8));
							w := (w+1) mod 64;
							buff(w) := last;
							w := (w+1) mod 64;
						end if;
					end if;
				end if;
				-- count will now be 1 (of the new character)
				count := 1;
				
			end if;
			
			-- output from buffer, one at a time in each cycle
			if (r /= w) then
				valid <= '1';
				output <= buff(r);
				r := (r+1) mod 64;
			else
				valid <= '0';
				output <= "00000000";
			end if;
		end if;
	end process;

end architecture;