library ieee;
use ieee.std_logic_1164.all;

entity D_Filp_Flop is
	port(
		CLK, D: in std_logic;
		Q: out std_logic
	);
end D_Filp_Flop;

architecture D_Filp_Flop_part of D_Filp_Flop is
begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			Q <= D;
		end if;
	end process;
end D_Filp_Flop_part;