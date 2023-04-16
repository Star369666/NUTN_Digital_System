library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity hw2 is
port(
	reset,clk,din,start : in std_logic;
	count_out,dout_valid,dout : out std_logic;
	count_one : out std_logic_vector(3 downto 0)
);
end hw2;

architecture a of hw2 is
signal state : std_logic_vector(2 downto 0);--狀態
signal reg : std_logic_vector(7 downto 0);--暫存器
signal count : std_logic_vector(2 downto 0);--計算資料個數
signal counter1 : std_logic_vector(3 downto 0);--計算1的個數，每讀一個位元資料更新一次

begin
	process(clk,reset)
	begin
		if reset = '1' then -- 一切歸零
			state <= "000";
			reg <= "00000000";
			count <= "000";
			count_one <= (others => '0');
			count_out <= '0';
			counter1 <= "0000";
			dout_valid <= '0';
			dout <= '0';
		elsif clk'event and clk = '1' then
			case state is
				when "000" =>
					if(start = '1') then
						state <= "001";--進入狀態一
						count <= "000";--歸零
						counter1 <= "0000";--歸零
					end if;
				when "001" =>
					reg <= (din & reg(7 downto 1));--讀資料
					if(din = '1') then
						counter1 <= counter1 + 1;--計算1的次數
					end if;
					count <= count + 1;--計算讀的次數
					if(count = "111") then--當讀到第8次(0~7)跳到下一個狀態
						state <= "010";
					end if;
				when "010" =>
					count_out <= '1';
					count <= "000";--歸零
					count_one <= counter1;--把計算出1的次數給count_one
					state <= "011";
				when "011" =>
					count_out <= '0';
					dout_valid <= '1';
					dout <= reg(7);-- 輸出資料
					reg <= (reg(6 downto 0) & '0');--一格一格往左移
					count <= count + 1;--計算輸出的次數
					if(count = "111") then--輸出到第8次(0~7)跳到下一個狀態
						state <= "100";
					end if;
				when "100" =>
					dout_valid <= '0';
					state <= "000";
				when others => null;
			end case;
		end if;
	end process;
end a;
