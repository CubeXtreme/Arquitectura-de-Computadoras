library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity and00mult is 
	port(
		Aa: in std_logic;
		Ba: in std_logic;
		Ya: out std_logic);
end and00mult;

architecture and0mult of and00mult is
begin
	Ya <= Aa and Ba;
end and0mult;