library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity not00 is
	port(
		Ao: in std_logic;
		Yo: out std_logic);
end not00;

architecture not0 of not00 is
begin
	Yo <= not(Ao);
end not0;