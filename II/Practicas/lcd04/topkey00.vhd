library ieee; 
use ieee.std_logic_1164.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;
use packagekey00.all;

entity topkey00 is 
	port(
		 clkk: in std_logic; 
		 enablek: in std_logic; 
		 inkeyk: in std_logic_vector(3 downto 0);
		 outrk: inout std_logic_vector(3 downto 0);
		 outcontk0: inout std_logic_vector(4 downto 0);
		 outlcdword: out std_logic_vector(7 downto 0));
end topkey00; 

architecture topkey0 of topkey00 is 
begin
	
	K00: contring00 port map( clkkr => clkk,
							  enablekr => enablek,
							  outkr => outrk);
	
	K01: coderk00 port map( clkc => clkk,
							enablec => enablek,
							inkey => inkeyk,
							incontk => outrk,
							outcontk => outcontk0,
							outcoderk => outlcdword);
	

end topkey0;