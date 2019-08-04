library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packgewordkey00 is

	component topdiv00 
	 port(
		indiv0: in std_logic_vector(4 downto 0);
		oscout0: inout std_logic
		--outdiv0: inout std_logic
	 );
	end component;
	
	component contring00
	 port(
		en,clkr: in std_logic;
		outc: inout std_logic_vector (4 downto 0);
		outtransis: out std_logic_vector(3 downto 0)
	 );
	end component;
	
	component muxletra
	 port(
		clkc: in std_logic;
		enc: in std_logic;
		inkey: in std_logic_vector(3 downto 0);
		incont: in std_logic_vector(4 downto 0);
		outcoder: out std_logic_vector(6 downto 0)
     );
	end component;

end packgewordkey00;