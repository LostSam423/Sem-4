library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component RLE is
		port(
			clk, rst: in std_logic;
			input: in std_logic_vector(7 downto 0);
			output: out std_logic_vector(7 downto 0);
			valid: out std_logic
		);
	end component;
	
	signal input_sig, output_sig: std_logic_vector (7 downto 0);
	signal valid, clk, rst: std_logic;
	
begin
	dut_instance: RLE
		port map (clk => clk, rst => rst, input => input_sig, output=> output_sig, valid => valid);
	
	process
		file input_file: text open read_mode is "G:\My Drive\sem4\CS 254\Lab7\RLE\input.txt";
		file output_file: text open write_mode is "G:\My Drive\sem4\CS 254\Lab7\RLE\output.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);

	
	begin
		rst <= '1';
		clk <= '1';
		wait for 20 ns;
		clk <= '0';
		wait for 20 ns;
		rst <= '0';
		
		for i in 0 to 32 loop
			if not endfile(input_file) then
				readline(input_file, input_line);
				read(input_line, input_var);
				input_sig <= input_var;
				
			else
				input_sig <= "00000001";
			end if;
			
			clk <= '1';
			wait for 20 ns;
			clk <= '0';
			
			output_var := output_sig;
			if(valid = '1') then
				write(output_line, output_var);
				writeline(output_file, output_line);
			end if;
			wait for 20 ns;
			
		end loop;
	
	wait;
	end process;

end architecture;
