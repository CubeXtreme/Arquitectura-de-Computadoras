library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is

	component topdiv00
		port(
			cdiv0: in std_logic_vector (4 downto 0);
			clk0: inout std_logic
		);
	end component;
	
	component anda00
		port(
			clka: in std_logic;
			inFlaga: in std_logic;
			functa: in std_logic_vector (5 downto 0);
			inrsa:  in std_logic_vector (7 downto 0);
			inrta:  in std_logic_vector (7 downto 0);			
			outrda:  out std_logic_vector (7 downto 0);
			outFlaga: out std_logic
		);
	end component;
	
	component ora00
		port(
			clko: in std_logic;
			inFlago: in std_logic;
			functo: in std_logic_vector (5 downto 0);
			inrso:  in std_logic_vector (7 downto 0);
			inrto:  in std_logic_vector (7 downto 0);			
			outrdo:  out std_logic_vector (7 downto 0);
			outFlago: out std_logic
		);
	end component;

	component ac00
		port(
			clkac: in std_logic;
			enableac: in std_logic;
			inFlagac: in std_logic;
			inac: in std_logic_vector(7 downto 0);
			outac: out std_logic_vector(7 downto 0);
			outFlagac: out std_logic
		);
	end component;
	
end packagealu00;