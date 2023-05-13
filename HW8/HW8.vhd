library ieee;
use ieee.std_logic_1164.all;

entity HW8 is
	port(
		CLK, Serial_in, LOAD: in std_logic;
		Parallel_in: in std_logic_vector(3 downto 0);
		Q: out std_logic_vector(3 downto 0)
	);
end HW8;

architecture HW8_part of HW8 is

signal and_output: std_logic_vector(7 downto 0);
signal or_output, d_output: std_logic_vector(3 downto 0);
signal not_load: std_logic;

component HW8_not is
	port(
		A: in std_logic;
		X: out std_logic
	);
end component;

component HW8_and is
	port(
		A, B: in std_logic;
		X: out std_logic
	);
end component;

component HW8_or is
	port(
		A, B: in std_logic;
		X: out std_logic
	);
end component;

component HW8_D_filp_flop is
	port(
		CLK, PRESET, CLEAR, D: in std_logic;
		Q: out std_logic
	);
end component;

begin 
	not_load <= not LOAD;
	and1: HW8_and port map(Serial_in, not_load, and_output(7));
	and2: HW8_and port map(LOAD, Parallel_in(3), and_output(6));
	and3: HW8_and port map(d_output(3), not_load, and_output(5));
	and4: HW8_and port map(LOAD, Parallel_in(2), and_output(4));
	and5: HW8_and port map(d_output(2), not_load, and_output(3));
	and6: HW8_and port map(LOAD, Parallel_in(1), and_output(2));
	and7: HW8_and port map(d_output(1), not_load, and_output(1));
	and8: HW8_and port map(LOAD, Parallel_in(0), and_output(0));
	
	forOR: for i in 0 to 3 generate
		or_temp: HW8_or port map(and_output(2*i+1), and_output(2*i), or_output(i));
	end generate forOR;
	
	forD_filp_filp: for j in 0 to 3 generate
		D_temp: HW8_D_filp_flop port map(CLK, '0', '0', or_output(3-j), d_output(3-j));
	end generate forD_filp_filp;
	
	Q <= d_output;
end HW8_part;