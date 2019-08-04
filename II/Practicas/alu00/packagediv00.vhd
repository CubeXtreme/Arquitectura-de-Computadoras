library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagediv00 is
	component div00 
		port
		(
			clkdiv:in std_logic;
			indiv: in std_logic_vector(4 downto 0);
			outdiv:inout std_logic
		);
	end component;
	component osc00 
		port(
			osc_int: out std_logic
		);
	end component;
end package;