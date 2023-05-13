library ieee;
use ieee.std_logic_1164.all;

entity HW8_and is
	port(
		A, B: in std_logic;
		X: out std_logic
	);
end HW8_and;

architecture HW8_and_part of HW8_and is
begin 
	X <= A and B;
end HW8_and_part;