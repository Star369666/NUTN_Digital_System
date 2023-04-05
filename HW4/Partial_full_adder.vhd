library ieee;
use ieee.std_logic_1164.all;
 
entity Partial_full_adder is
	port ( 
		A, B, Cin: in std_logic;
		S, P, G : out std_logic
	);
end Partial_full_adder;
 
architecture Partial_full_adder_part of Partial_full_adder is
begin
	S <= A xor B xor Cin;
	P <= A xor B;
	G <= A and B;
end;