Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

 entity divisor is
	 port (
		 clk: in std_logic;
		 clk_h, clk_k, clk_m: out std_logic
		 );
 end divisor; 

 architecture arq_frequencimetro of divisor is 

 constant time_h : integer := 50000000;
 constant time_k : integer  := 50000;
 constant time_m : integer  := 50;

 signal count0: integer range 0 to 50000000 := 0;
 signal count_k: integer range 0 to 50000 :=0;
 signal count_m: integer range 0 to 50 :=0;
 signal h, m, k: std_logic := '0';

 begin 

			process (clk)
				begin
				 if (clk'event and clk = '1') then
					 count0 <= count0 + 1;
						 if (count0 = time_h) then
							count0 <= 0;	
						   h <= not h;
						 end if;
					 end if;
				end process;
			
			process (clk)
				begin
			if (clk'event and clk = '1') then
					count_k <= count_k + 1;
					if (count_k = time_k) ThEN
						count_k <= 0;
						k <= not k;
					end if;
				end if;
			end process;
				
			process (clk)
				begin
				if (clk'event and clk = '1') then
					count_m <= count_m + 1;
					if (count_m = time_m) ThEN
						count_m <= 0;
						m <= not m;
					end if;
				end if;
		end process;
		
clk_h <= h;
clk_m <= m;
clk_k<= k;

 end arq_frequencimetro;