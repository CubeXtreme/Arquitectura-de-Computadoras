library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
package packageword00 is
component topdiv00
	port(
		cdiv0:in std_logic_vector(4 downto 0);
		clk0:inout std_logic
	);
end component;

component contring00 
	port(
		enr: in std_logic;
		clkr: in std_logic;
		outr: out std_logic_vector(5 downto 0)
	);
end component;

component coder00
	port(
		incont:in std_logic_vector(5 downto 0);
		outcoder:out std_logic_vector(7 downto 0)
	);
end component;
end package;