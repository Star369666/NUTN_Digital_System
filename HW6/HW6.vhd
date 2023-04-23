library ieee;
use ieee.std_logic_1164.all;

entity HW6 is
	port(
		A, B: in std_logic_vector(2 downto 0);
		Cin: in std_logic;
		X: out std_logic_vector(5 downto 0)
	);
end HW6;

architecture HW6_part of HW6 is
component Triple_adder is
	port(
		A, B: in std_logic_vector(2 downto 0);
		Sum: out std_logic_vector(2 downto 0);
		Cin: in std_logic;
		Carry: out std_logic
	);
end component;

signal AB0, AB1, AB2: std_logic_vector(2 downto 0);
signal temp: std_logic_vector(3 downto 0);

begin
	AB0 <= (A(2) and B(0)) & (A(1) and B(0)) & (A(0) and B(0));
	AB1 <= (A(2) and B(1)) & (A(1) and B(1)) & (A(0) and B(1));
	AB2 <= (A(2) and B(2)) & (A(1) and B(2)) & (A(0) and B(2));
	
	t1: Triple_adder port map(AB1, ("0" & AB0(2 downto 1)), temp(2 downto 0), '0', temp(3));
	t2: Triple_adder port map(AB2, temp(3 downto 1), X(4 downto 2), '0', X(5));
	X(0) <= AB0(0);
	X(1) <= temp(0);
end HW6_part;