library ieee;
use ieee.std_logic_1164.all;

entity Two_1s_out_of_four is 
	port (
		a, b, c, d in std_logic;
		f out std_logic
	);
end Two_1s_out_of_four;

architecture Two_1s_out_of_four_part of Two_1s_out_of_four is
begin
	process(a, b, c, d)
	begin
		f = (not a and not b and c and d) or
			 (not a and b and not c and d) or
			 (not a and b and c and not d) or
			 (a and not b and not c and d) or
			 (a and not b and c and not d) or
			 (a and b and not c and not d);
	end process;
end Two_1s_out_of_four_part;