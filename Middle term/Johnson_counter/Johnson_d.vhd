library ieee;
use ieee.std_logic_1164.all;

entity Johnson_D is 
	port (
		clk, d: in std_logic;
		q: inout std_logic;
		not_q: out std_logic
	);
end Johnson_D;

architecture Johnson_D_part of Johnson_D is
begin
	process(clk)
	begin
		if clk'event and clk = '1' then
			q <= d;
			not_q <= not q;
		end if;
	end process;
end Johnson_D_part;