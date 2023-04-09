--use Quartus II library--
library ieee;
use ieee.std_logic_1164.all;

--full adder declaration--
entity fulladd is 
    port(
        X, Y, Cin: in std_logic;
        Sum, Carry: out std_logic
    );
end fulladd;

architecture fulladd_part of fulladd is
component halfadd is 
	port(
		X, Y: in std_logic;
		Sum, Carry: out std_logic
	);
end component;

    signal s1, c1, c2: std_logic;
begin
    --first half adder--
    h1: halfadd port map(X => X, Y => Y, Sum => s1, Carry => c1);
    
    --second half adder--
    h2: halfadd port map(X => s1, Y => Cin, Sum => Sum, Carry => c2);
    
    --giving the final promotion result--
    Carry <= c1 or c2;
end fulladd_part;
