library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

use packagerom00.all;

entity toprom00 is
   port(
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		outcont0: inout std_logic_vector(4 downto 0);
		outword0: out std_logic_vector(6 downto 0);
		outtransist0: out std_logic_vector(3 downto 0)
       );
end entity ; -- toprom00

architecture toprom0 of toprom00 is
begin
	outtransist0 <= "0001";

		RO00: topdiv00 port map(oscout0 => clk0,
							  indiv0 => cdiv0);

		RO01: contRead00 port map(clkr => clk0,
								  enr => en0,
								  outr => outcont0);

		RO02: rom00 port map(clkro => clk0,
							 enro => en0,
							 indirro => outcont0,
							 outrom => outword0);

end architecture ; -- toprom0