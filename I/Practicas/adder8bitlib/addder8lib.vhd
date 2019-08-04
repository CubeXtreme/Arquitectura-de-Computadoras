library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity adder8bitlib00 is
	port(
		SL: in std_logic;
		Ai, Bi: std_logic_vector(7 downto 0);
		So: out std_logic_vector(7 downto 0)
	);
end adder8bitlib00;
	
architecture ad8l of adder8bitlib00 is
begin
	with SL select So <=
		Ai + Bi when '0',
		Ai - Bi when '1',
		"00000000" when others;
end ad8l;