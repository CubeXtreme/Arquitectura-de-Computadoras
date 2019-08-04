library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packageram00 is 
	
	component toposc00
		port(
			clk0: inout std_logic;
			cdiv0: in std_logic_vector(4 downto 0)
			);
	end component;
	
	component contring00
		port(
		clks: in std_logic;
		en: in std_logic;
		outr: out std_logic_vector(4 downto 0)
	);
	end component;
	
	component coderram00
		port(
       clkc: in std_logic;
	   inFlagc: in std_logic;
	   enc: in std_logic;
       inkey: in std_logic_vector(3 downto 0);
	   incont: in std_logic_vector(4 downto 0);
	   outcontc: inout std_logic_vector(4 downto 0); --palabra a segmentos
       outcoder: out std_logic_vector(6 downto 0);
	   outFlagc: out std_logic
	   );	
	end component;
		
	component ram00
		port(
		  clkra: in std_logic;
		  inFlagra: in std_logic;
		  enra: in std_logic;
		  rwra: in std_logic;
		  indirWra: in std_logic_vector(4 downto 0);
		  indirRra: in std_logic_vector(4 downto 0);
		  inWordra: in std_logic_vector(6 downto 0);
		  outWordra: out std_logic_vector(6 downto 0);
		  outFlagra: out std_logic
			);
	end component;	
	
	component muxram00
		port(
		enm: in std_logic;
		rwm: in std_logic;
		inWordkeym: in std_logic_vector(6 downto 0);
		inWordramm: in std_logic_vector(6 downto 0);
		outWordm: out std_logic_vector(6 downto 0)
	 );
	end component;
	
	component contRead00
		port(
		clkcr: in std_logic;
		encr: in std_logic;
		rwcr: in std_logic;
		incontkeycr: in std_logic_vector(4 downto 0);
		outcontRcr: inout std_logic_vector(4 downto 0)
	 );
	end component;
	

end packageram00;