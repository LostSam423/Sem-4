library work;
use work.all;

library IEEE, std;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.math_real.all;

entity TrafficLightController is
	port (clk,rst:in std_logic;
	green,yellow, red: out std_logic_vector(3 downto 0));
end entity;

architecture arch of TrafficLightController is
	begin
	-- no component added here and no need of extra signals
	
	process(clk)
	--required variables
	variable count: integer := 0;  -- keeps count of the number of clock edges
	variable lane: integer := 0;   -- lanes 0,1,2,3
	variable last_rst: integer := 0;
	begin
		-- reset the values of count and lane if rst = 1
		if(rst = '1') then
			count := 0;
			lane := 0;
			last_rst := 1;
		else 
			if(rising_edge(clk)) then
				count := (count + 1) mod 7;  -- increase count on each clock edge
				if(count = 1 and last_rst = 0) then 
					lane := (lane + 1) mod 4; -- count = 1 means new lane turns from red to green
				else 
					last_rst := 0;
				end if;
			end if;
		end if;
		-- red is the 1s complement of the current lane being active
		red <= std_logic_vector(to_unsigned(15 - 2 ** lane,4));	
		-- green to yellow when count = 0
		if(count = 0) then
			yellow <= std_logic_vector(to_unsigned(2 ** lane,4));
			green <= "0000"; -- no lane is green
		else
			yellow <= "0000"; -- no lane is yellow
			green <=  std_logic_vector(to_unsigned(2 ** lane,4));
		end if;	
end process;

end arch;