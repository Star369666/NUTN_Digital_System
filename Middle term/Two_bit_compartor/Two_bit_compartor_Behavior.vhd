library ieee;
use ieee.std_logic_1164.all;

entity Two_bit_compartor_Behavior is
	port(
		a, b: in std_logic_vector(1 downto 0);
		equal, larger, smaller: out std_logic
	);
end Two_bit_compartor_Behavior;

architecture Two_bit_compartor_Behavior_part of Two_bit_compartor_Behavior is
begin
	process(a, b)
	begin
		if a = b then
			equal <= '1';
		else
			equal <= '0';
		end if;
		
		if a > b then
			larger <= '1';
		else
			larger <= '0';
		end if;
		
		if a < b then
			smaller <= '1';
		else
			smaller <= '0';
		end if;
	end process;
end Two_bit_compartor_Behavior_part;