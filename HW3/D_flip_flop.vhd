library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity D_flip_flop is
	port(
		Reset: in std_logic;
		A, B, IN1, IN2, CLK: in std_logic;
		D: inout std_logic;
		Q: out std_logic
	);
end D_flip_flop;

architecture D_flip_flop_part of D_flip_flop is
	component multiplexer is
		port( 
			A, B, IN1, IN2: in std_logic;
			Out_mux: out std_logic
		);
	end component;
	
begin
	M1: multiplexer port map(A => A, B => B, IN1 => IN1, IN2 => IN2, Out_mux => D);
	process(CLK, Reset)
	begin
		if(Reset = '1') then
			Q <= '0';
		elsif(CLK'event and CLK = '1') then 
			Q <= D;
		end if;
	end process;
end D_flip_flop_part;
