library ieee;
use ieee.std_logic_1164.all;

entity Two_bit_compartor_Dataflow is
	port(
		a, b: in std_logic_vector(1 downto 0);
		equal, larger, smaller: out std_logic
	);
end Two_bit_compartor_Dataflow;

architecture Two_bit_compartor_Dataflow_part of Two_bit_compartor_Dataflow is
begin
	equal <= '1' when a = b else '0';
	larger <= '1' when a > b else '0';
	smaller <= '1' when a < b else '0';
end Two_bit_compartor_Dataflow_part;