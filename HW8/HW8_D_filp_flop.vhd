library ieee;
use ieee.std_logic_1164.all;

entity HW8_D_filp_flop is
	port(
		CLK, PRESET, CLEAR, D: in std_logic;
		Q: out std_logic
	);
end HW8_D_filp_flop;

architecture HW8_D_filp_flop_part of HW8_D_filp_flop is
begin 
	process(CLK, PRESET, CLEAR)
	begin
		if CLEAR = '1' then
			Q <= '0';
		elsif PRESET = '1' then
			Q <= '1';
		elsif CLK'event and CLK = '1' then
			Q <= D;
		end if;
	end process;
end HW8_D_filp_flop_part;