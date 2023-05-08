library ieee;
use ieee.std_logic_1164.all;

entity D_Filp_Flop is
	port(
		CLK, D, Preset, Reset: in std_logic;
		Q: out std_logic
	);
end D_Filp_Flop;

architecture D_Filp_Flop_part of D_Filp_Flop is
begin
	process(CLK)
	begin
		if Preset = '1' then 
			Q <= '1';
		elsif Reset = '1' then
			Q <= '0';
		elsif CLK'event and CLK = '1' then
			Q <= D;
		end if;
	end process;
end D_Filp_Flop_part;
