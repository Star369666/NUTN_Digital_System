library ieee;
use ieee.std_logic_1164.all;

entity HW8_or is
	port(
		A, B: in std_logic;
		X: out std_logic
	);
end HW8_or;

architecture HW8_or_part of HW8_or is
begin 
	X <= A or B;
end HW8_or_part;