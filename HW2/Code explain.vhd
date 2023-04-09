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
signal state : std_logic_vector(2 downto 0);--���A
signal reg : std_logic_vector(7 downto 0);--�Ȧs��
signal count : std_logic_vector(2 downto 0);--�p���ƭӼ�
signal counter1 : std_logic_vector(3 downto 0);--�p��1���ӼơA�CŪ�@�Ӧ줸��Ƨ�s�@��

begin
	process(clk,reset)
	begin
		if reset = '1' then -- �@���k�s
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
						state <= "001";--�i�J���A�@
						count <= "000";--�k�s
						counter1 <= "0000";--�k�s
					end if;
				when "001" =>
					reg <= (din & reg(7 downto 1));--Ū���
					if(din = '1') then
						counter1 <= counter1 + 1;--�p��1������
					end if;
					count <= count + 1;--�p��Ū������
					if(count = "111") then--��Ū���8��(0~7)����U�@�Ӫ��A
						state <= "010";
					end if;
				when "010" =>
					count_out <= '1';
					count <= "000";--�k�s
					count_one <= counter1;--��p��X1�����Ƶ�count_one
					state <= "011";
				when "011" =>
					count_out <= '0';
					dout_valid <= '1';
					dout <= reg(7);-- ��X���
					reg <= (reg(6 downto 0) & '0');--�@��@�橹����
					count <= count + 1;--�p���X������
					if(count = "111") then--��X���8��(0~7)����U�@�Ӫ��A
						state <= "100";
					end if;
				when "100" =>
					dout_valid <= '0';
					state <= "000";
				when others =>
			end case;
		end if;
	end process;
end a;