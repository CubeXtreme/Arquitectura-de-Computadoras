library ieee; 
use ieee.std_logic_1164.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;

package packagekey00 is 
	
	component contring00
	port(
		 clkkr: in std_logic;
		 enablekr: in std_logic;
		 outkr: out std_logic_vector(3 downto 0));
	end component; 
	
	component coderk00
	port(clkc: in std_logic;
		 enablec: in std_logic;
		 inkey: in std_logic_vector(3 downto 0); 
		 incontk: in std_logic_vector(3 downto 0);
		 outcontk: inout std_logic_vector(4 downto 0);
		 outcoderk: out std_logic_vector(7 downto 0)); 
	end component; 

end packagekey00;