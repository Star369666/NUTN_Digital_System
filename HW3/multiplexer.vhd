library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity multiplexer is
	port( 
		A, B, IN1, IN2: in std_logic;
		Out_mux: out std_logic
	);
end multiplexer;

architecture multiplexer_part of multiplexer is
	signal and_out: std_logic;
	
begin
	and_out <= A and B;
	Out_mux <= IN1 when (and_out = '0') else IN2;
end;
	