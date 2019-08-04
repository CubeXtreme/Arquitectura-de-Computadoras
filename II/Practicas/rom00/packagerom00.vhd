library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagerom00 is
	component topdiv00
		port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic);
	end component;

	component contRead00
		port(
		clkr: in std_logic;
		enr: in std_logic;
		outr: inout std_logic_vector(4 downto 0));
	end component;

	component rom00
		port(
		clkro : in std_logic;
		enro: in std_logic;
		indirro: in std_logic_vector(4 downto 0);
		outrom: out std_logic_vector(6 downto 0));
	end component;
	
end package ; -- packagerom00 