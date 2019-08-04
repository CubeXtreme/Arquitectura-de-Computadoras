library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageadder_and_mult is

	component adder8bits
		port(SLadder8bits: in std_logic;
		   inRSadder8bits: in std_logic_vector(7 downto 0);
		   inRTadder8bits: in std_logic_vector(7 downto 0);
		   outLED: out std_logic;
		   outRDadder8bits: out std_logic_vector(7 downto 0));
	end component;
	
	component mult8bits
		port(inRSmult8bits: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			inRTmult8bits: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			outRDmult8bits : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	end component;

end packageadder_and_mult;