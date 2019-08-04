library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nor00 is
	port(
		Ao: in std_logic;
		Bo: in std_logic;
		Yo: out std_logic);
end nor00;

architecture nor0 of nor00 is
begin
	Yo <= Ao nor Bo;
end nor0;