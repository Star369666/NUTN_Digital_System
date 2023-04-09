--use Quartus II library--
library ieee;
use ieee.std_logic_1164.all;

--half adder declaration--
entity halfadd is 
    port(
        X, Y: in std_logic;
        Sum, Carry: out std_logic
    );
end halfadd;

architecture halfadd_part of halfadd is 
begin
    Sum <= X xor Y;
    Carry <= X and Y;
end halfadd_part;
