library ieee;
use ieee.std_logic_1164.all;

entity HW5 is
	port(
		CLK, X: in std_logic;
		Q: out std_logic_vector(2 downto 0)
	);
end HW5;

architecture HW5_part of HW5 is
begin
	Count: process(CLK, X)
		variable counter: integer := 0;
	begin
		if (CLK'event and CLK = '1') then
			if x = '1' then
				counter := counter + 1;
				if counter > 7 then
					counter := 0;
				end if;
			elsif x = '0' then
				counter := counter - 1;
				if counter < 0 then
					counter := 7;
				end if;
			end if;
			
			case counter is
				when 0 => Q <= "000";
				when 1 => Q <= "001";
				when 2 => Q <= "011";
				when 3 => Q <= "010";
				when 4 => Q <= "110";
				when 5 => Q <= "111";
				when 6 => Q <= "101";
				when 7 => Q <= "100";
				when others => null;
			end case;
		end if;
	end process count;
end HW5_part;