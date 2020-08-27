LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

ENTITY decodificador is
PORT (
u, d, c: in integer;
display_1, display_2, display_3: out std_logic_vector (6 downto 0)
);

END decodificador; 

architecture arch_decodificador of decodificador is
signal tmp1, tmp2, tmp3: std_logic_vector (3 downto 0);

begin


		tmp1<=
			"0000" when u = 0 else
			"0001" when u = 1 else
			"0010" when u = 2 else
			"0011" when u = 3 else
			"0100" when u = 4 else
			"0101" when u = 5 else
			"0110" when u = 6 else
			"0111" when u = 7 else
			"1000" when u = 8 else
			"1001" when u = 9;
		tmp2<=
			"0000" when d = 0 else
			"0001" when d = 1 else
			"0010" when d = 2 else
			"0011" when d = 3 else
			"0100" when d = 4 else
			"0101" when d = 5 else
			"0110" when d = 6 else
			"0111" when d = 7 else
			"1000" when d = 8 else
			"1001" when d = 9;
		tmp3<=
			"0000" when c = 0 else
			"0001" when c = 1 else
			"0010" when c = 2 else
			"0011" when c = 3 else
			"0100" when c = 4 else
			"0101" when c = 5 else
			"0110" when c = 6 else
			"0111" when c = 7 else
			"1000" when c = 8 else
			"1001" when c = 9;
	
	
	
		display_1 <= 
			  "1000000" when (tmp1)= "0000" else	
			  "1111001" when (tmp1)= "0001" else	
			  "0100100" when (tmp1)= "0010" else	
			  "0110000" when (tmp1)= "0011" else	
			  "0011001" when (tmp1)= "0100" else	
			  "0010010" when (tmp1)= "0101" else	
			  "0000011" when (tmp1)= "0110" else	
			  "1111000" when (tmp1)= "0111" else	
			  "0000000" when (tmp1)= "1000" else	
			  "0011000" when (tmp1)= "1001";    	
		display_2 <= 
			  "1000000" when (tmp2(3 downto 0))= "0000" else	
			  "1111001" when (tmp2(3 downto 0))= "0001" else	
			  "0100100" when (tmp2(3 downto 0))= "0010" else	
			  "0110000" when (tmp2(3 downto 0))= "0011" else	
			  "0011001" when (tmp2(3 downto 0))= "0100" else	
			  "0010010" when (tmp2(3 downto 0))= "0101" else	
			  "0000011" when (tmp2(3 downto 0))= "0110" else	
			  "1111000" when (tmp2(3 downto 0))= "0111" else	
			  "0000000" when (tmp2(3 downto 0))= "1000" else	
			  "0011000" when (tmp2(3 downto 0))= "1001";    	
		display_3 <= 
			  "1000000" when (tmp3(3 downto 0))= "0000" else	
			  "1111001" when (tmp3(3 downto 0))= "0001" else	
			  "0100100" when (tmp3(3 downto 0))= "0010" else
			  "0110000" when (tmp3(3 downto 0))= "0011" else	
			  "0011001" when (tmp3(3 downto 0))= "0100" else	
			  "0010010" when (tmp3(3 downto 0))= "0101" else
			  "0000011" when (tmp3(3 downto 0))= "0110" else
			  "1111000" when (tmp3(3 downto 0))= "0111" else
			  "0000000" when (tmp3(3 downto 0))= "1000" else
			  "0011000" when (tmp3(3 downto 0))= "1001";    
				  
end arch_decodificador;
