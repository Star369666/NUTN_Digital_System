library ieee;
use ieee.std_logic_1164.all;

entity HW8_not is
	port(
		A: in std_logic;
		X: out std_logic
	);
end HW8_not;

architecture HW8_not_part of HW8_not is
begin 
	X <= not A;
end HW8_not_part;