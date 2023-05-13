library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Binary_2up_counter is
	port(
		rst, clk: in std_logic;
		q: out std_logic_vector(3 downto 0)
	);
end Binary_2up_counter;

architecture Binary_2up_counter_part of Binary_2up_counter is

signal count: std_logic_vector(3 downto 0);

begin
	process (rst,clk)
	begin
		if rst = '1' then 
			count <= "0000";
		elsif rising_edge (clk) 
			then count <= count + 2;
		end if;
	end process;
	q <= count;
end Binary_2up_counter_part;