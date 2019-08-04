library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

package packagekey00 is
	component contring00
		port(
			clkr : in std_logic;
			enable: in std_logic;
			outr: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component coder00
		port(
			clkc: inout std_logic;
			inkey: in std_logic_vector(3 downto 0);
			incont: in std_logic_vector(3 downto 0);
			flag: in std_logic;
			RWcdc: out std_logic;
			RScdc: out std_logic;
			ENcdc: out std_logic;
			outcoder: out std_logic_vector(7 downto 0)
		);
	end component;
	
end packagekey00;