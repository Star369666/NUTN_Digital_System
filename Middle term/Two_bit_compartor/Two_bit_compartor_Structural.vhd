library ieee;
use ieee.std_logic_1164.all;

entity Two_bit_compartor_Structural is
	port(
		a, b: in std_logic_vector(1 downto 0);
		equal, larger, smaller: out std_logic
	);
end Two_bit_compartor_Structural;

architecture Two_bit_compartor_Structural_part of Two_bit_compartor_Structural is
begin
	equal <= (not a(1) and not a(0) and not b(1) and not b(0)) or
			 (not a(1) and a(0) and not b(1) and b(0)) or
			 (a(1) and a(0) and b(1) and b(0)) or
			 (a(1) and not a(0) and b(1) and not b(0));
	larger <= (a(1) and not b(1)) or (a(0) and not b(1) and not b(0)) or (a(1) and a(0) and not b(0));
	smaller <= (not a(1) and b(1)) or (not a(1) and not a(0) and not b(1)) or (not a(0) and b(1) and b(0));
end Two_bit_compartor_Structural;