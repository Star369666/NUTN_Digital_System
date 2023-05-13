library ieee;
use ieee.std_logic_1164.all;

entity Three_state_buffer is 
	port (
		control, data_in: in std_logic;
		data_out: out std_logic
	);
end Three_State_Buffer;

architecture Three_state_buffer_part of Three_state_buffer is
begin
	f <= 'Z' when control = '0' else data_in;
end Three_state_buffer_part;