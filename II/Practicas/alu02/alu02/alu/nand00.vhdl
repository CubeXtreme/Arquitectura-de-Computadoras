library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nand00 is 
	port(
		Aa: in std_logic;
		Ba: in std_logic;
		Ya: out std_logic);
end nand00;

architecture nand0 of and00 is
begin
	Ya <= Aa nand Ba;
end nand0;