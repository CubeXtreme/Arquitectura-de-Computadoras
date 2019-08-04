library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packagelcd00 is
	component toposc00
	port(
			clk0: inout std_logic;
			cdiv0: in std_logic_vector(4 downto 0)
			);
	end component;
	
	component lcdcontconfig00
		port(
			clkcc: in std_logic;
			resetcc: in std_logic;
			inFlagcc: in std_logic;
			outcc: inout std_logic_vector(4 downto 0);
			outFlagcc: out std_logic
		);
	end component;
	
	component lcdconfig00
		port(
			clkc: in std_logic;
			resetc: in std_logic;
			inFlagc: in std_logic;
			incontc: in std_logic_vector(4 downto 0);
			comandoc: out std_logic_vector(7 downto 0);
			outFlagc: out std_logic;
			RWc: out std_logic;
			RSc: out std_logic;
			ENc: out std_logic
		);
	end component;
	
	component topkey00
	port(
		clk01: inout std_logic;
		en01: in std_logic;
		inkey01: in std_logic_vector(3 downto 0);
		outr01: inout std_logic_vector(3 downto 0);
		outcoder01: out std_logic_vector(7 downto 0);
		RWcd: out std_logic;
		RScd: out std_logic;
		ENcd: out std_logic;
		flag01: in std_logic
	);
	end component;
	
	component lcdmux00
		port(
			clear: inout std_logic;--nuevoLimpiar
			clklcdm: in std_logic;
			resetlcdm: in std_logic;
			inFlagcm: in std_logic;
			inFlagcdm: in std_logic;
			inwordconfigm: in std_logic_vector(7 downto 0);
			inworddatam: in std_logic_vector(7 downto 0);
			RWcm: in std_logic;
			RScm: in std_logic;
			ENcm: in std_logic;
			RWdm: in std_logic;
			RSdm: in std_logic;
			ENddm: in std_logic;
			outwordlcdm: out std_logic_vector(7 downto 0);
			RWm: out std_logic;
			RSm: out std_logic;
			ENm: out std_logic
		);
	end component;
	
end packagelcd00;