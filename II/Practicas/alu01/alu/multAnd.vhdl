library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity multAnd is 
	port(
		Aa: in std_logic;
		Ba: in std_logic;
		Ya: out std_logic);
end multAnd;

architecture mult of multAnd is
begin
	Ya <= Aa and Ba;
end mult;