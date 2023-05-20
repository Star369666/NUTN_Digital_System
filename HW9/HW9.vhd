library ieee;
use ieee.std_logic_1164.all;

entity HW9 is
	port(
		A, B, C, D, E: in std_logic;
		Y1, Y2, Y3: out std_logic
	);
end HW9;

architecture HW9_part of HW9 is
function Fn1(F1, F2, F3, F4: std_logic) return std_logic is
variable temp: std_logic;
begin
	temp := (F1 xor F2) xor (F3 xor F4);
	return temp;
end function Fn1;

begin
	Y1 <= Fn1(A, B, C, D) xor E;
	Y2 <= Fn1(A, B, C, D) xor E;
	Y3 <= Fn1(A, B, C, D) xor E;
end HW9_part;