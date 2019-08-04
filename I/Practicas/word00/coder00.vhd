library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		incont:in std_logic_vector(5 downto 0);
		outcoder:out std_logic_vector(7 downto 0)
	);
end entity;

architecture codere0 of coder00 is
begin
	with incont select
		outcoder<="11111111" when "011111",--NADA
				"11111111" when "101111",--NADA
				"10010001" when "110111",--H
				
				"00000011" when "111011",--O
				"11100011" when "111101",--L
				"00010000" when "111110",--A
				"00000011" when others;--NADA
end architecture;