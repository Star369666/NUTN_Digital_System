library ieee;
use ieee.std_logic_1164.all;

entity Fulladder is
	port(
		A, B, Cin: in std_logic;
		Sum, Carry: out std_logic
	);
end Fulladder;

architecture Fulladder_part of Fulladder is
component Halfadder is 
	port(
		A, B: in std_logic;
		Sum, Carry: out std_logic
	);
end component;

signal s1, c1, c2: std_logic;

begin
	h1: Halfadder port map(A, B, s1, c1);
	h2: Halfadder port map(s1, Cin, Sum, c2);
	Carry <= c1 or c2;
end Fulladder_part;
