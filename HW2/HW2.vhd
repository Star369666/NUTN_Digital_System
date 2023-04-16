library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity HW2 is 
	port(
		clk, reset, din, start: in std_logic;
		count_out, dout_valid, d_out: out std_logic;
		count_one: out std_logic_vector(3 downto 0)
	);
end HW2;

architecture HW2_part of HW2 is
signal state, count: std_logic_vector(2 downto 0);
signal reg: std_logic_vector(7 downto 0);
signal counter1: std_logic_vector(3 downto 0);

begin
    process(clk, reset)
    begin
        if(reset = '1') then
            state <= (others => '0');
            reg <= (others => '0');
            count <= (others => '0');
            counter1 <= (others => '0');
            count_out <= '0';
            count_one <= (others => '0');
            dout_valid <= '0';
            d_out <= '0';
        elsif (clk'event and clk = '1') then
            case state is 
                when "000" =>
                    if start='1' then
                        state<="001";
                        count<=(others=>'0');
                        counter1<=(others=>'0');
                    end if; 

                when "001" =>
                    reg <= (din & reg(7 downto 1));
                    if din='1' then
                        counter1 <= counter1 + 1;
                    end if;
                    count <= count + 1;
                    if count="111" then
                        state <= "010";
                    end if;

                when "010" =>
                    count_out <= '1';
                    count_one <= counter1;
                    state <= "011";
                    count <= (others => '0');

                when "011" =>
                    count_out <= '0';
                    dout_valid <='1';
                    d_out <= reg(7);
                    reg <= (reg(6 downto 0) & '0');
                    count <= count + 1;
                    if count="111" then
                        state <= "100";
                    end if;

                when "100"=>
                    dout_valid <= '0';
                    state <= "000";

                when others => null;

            end case;
        end if;
    end process;
end HW2_part;
