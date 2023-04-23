library ieee;
use ieee.std_logic_1164.all;

entity Halfadder is
	port(
		A, B: in std_logic;
		Sum, Carry: out std_logic
	);
end Halfadder;

architecture Halfadder_part of Halfadder is
begin
	Sum <= A xor B;
	Carry <= A and B;
end Halfadder_part;
