Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

 entity frequencimetro is
	 port (
		 clk: in STD_LOGIC;
		 entrada, reset : in std_LOGIC;
		 sel: std_logic_vector (1 downto 0);
		 display_1, display_2, display_3: out std_logic_vector (6 downto 0);
		 led1, led2, ledm, ledk: out std_logic		 
		 );
 end frequencimetro; 
 
 architecture arq_frequencimetro of frequencimetro is
 
 constant const: integer := 9;
 signal tmp, clk_h, clk_k, clk_m: std_logic;
 signal unidade, dezena, centena, unidade2, centena2, dezena2: integer range 0 to 10 :=0;
 signal flag : std_logic := '0';
 
  component  divisor
		port (
		 clk: in std_logic;
		 clk_h, clk_k, clk_m: out std_logic
		 );
 end component; 
 
 component decodificador
		PORT (
	u, d, c: in integer;
	display_1, display_2, display_3: out std_logic_vector (6 downto 0)
    );
 end component;

 begin
 
	div: divisor port map(clk=>clk, clk_h=>clk_h, clk_m => clk_m, clk_k=>clk_k);
   dis: decodificador port map(u=>unidade2, d=>dezena2, c=>centena2, display_1=>display_1, display_2=>display_2, display_3=>display_3);
  
		process (entrada, sel, clk_h, clk_k, clk_m)
		begin
			
		if (sel = "00") then
			tmp <= clk_h;
		elsif(sel = "01") then
				tmp <= clk_k;
		elsif(sel = "10") then
				tmp <= clk_m;
		end if;
		

   	if (tmp = '1') then
			if(entrada'event and entrada = '1') then
			
				unidade <= unidade + 1;
				if(unidade = const) then
					unidade <= 0;
					dezena<= dezena + 1;
				elsif(dezena = const) then
					dezena <= 0;
					centena <= centena + 1;
				elsif (centena = const) then
					centena <= 0;
				end if;
			end if;
		else
				unidade2 <= unidade;
				dezena2 <= dezena;
				centena2 <= centena;
		end if;
		end process;
		
led1 <= clk_h; --att hertz
ledm <= clk_m; --att mega
ledk <= clk_k; --att kilo
led2 <= entrada;
		
 end arq_frequencimetro;