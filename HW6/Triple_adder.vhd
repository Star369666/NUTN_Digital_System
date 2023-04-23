library ieee;
use ieee.std_logic_1164.all;

entity Triple_adder is
	port(
		A, B: in std_logic_vector(2 downto 0);
		Sum: out std_logic_vector(2 downto 0);
		Cin: in std_logic;
		Carry: out std_logic
	);
end Triple_adder;

architecture Triple_adder_part of Triple_adder is
component Fulladder is 
	port(
		A, B, Cin: in std_logic;
		Sum, Carry: out std_logic
	);
end component;

signal c: std_logic_vector(3 downto 0);

begin
	c(0) <= Cin;
	G1: for i in 2 downto 0 generate
		full: Fulladder port map(A(i), B(i), c(i), Sum(i), c(i+1));
	end generate G1;
	Carry <= c(3);
end Triple_adder_part;
