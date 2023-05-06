library ieee;
use ieee.std_logic_1164.all;

entity Q7 is
	port(
		Input, CLK: in std_logic;
		Q: out std_logic_vector(3 downto 0)
	);
end Q7;

architecture Q7_part of Q7 is
	
signal temp: std_logic_vector(4 downto 0);
	
component D_Filp_Flop is
	port(
		CLK, D: in std_logic;
		Q: out std_logic
	);
end component;

begin
	temp(0) <= Input;
	forloop: for i in 0 to 3 generate 
		D_F_Fs: D_Filp_Flop port map(CLK, temp(i), temp(i+1));
		Q(i) <= temp(i+1);
	end generate;
end Q7_part;