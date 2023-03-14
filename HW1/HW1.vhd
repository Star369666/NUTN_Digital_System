--use Quartus II library--
library ieee;
use ieee.std_logic_1164.all;

-- adderSubtractor declaration--
entity HW1 is
    port(
        Control: in std_logic;
        X, Y: in std_logic_vector(3 downto 0);
        S: out std_logic_vector(3 downto 0);
        Cout: out std_logic
    );
end HW1;

architecture adderSubtractor of HW1 is
component fulladd is
    port(
        X, Y, Cin: in std_logic;
        Sum, Carry: out std_logic
    );
end component;

    signal c: std_logic_vector(3 downto 0);
begin
    --first to forth 1-bit full adders mapping--
    f1: fulladd port map(X => X(0), Y => Y(0) xor Control, Cin => Control, Sum => S(0), Carry => c(0));
    f2: fulladd port map(X => X(1), Y => Y(1) xor Control, Cin => c(0), Sum => S(1), Carry => c(1));
    f3: fulladd port map(X => X(2), Y => Y(2) xor Control, Cin => c(1), Sum => S(2), Carry => c(2));
    f4: fulladd port map(X => X(3), Y => Y(3) xor Control, Cin => c(2), Sum => S(3), Carry => c(3));
    --to avoid overflow: double positive or negative number addition--
    Cout <= c(3) xor Control;
end;	