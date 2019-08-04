library ieee; 
use ieee.std_logic_1164.all; 
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;
use packageosc00.all;

entity toposc00 is
	port(
		 indiv0: in std_logic_vector(3 downto 0);
		 outosc0: inout std_logic);
end toposc00; 

architecture toposc0 of toposc00 is
signal sclk: std_logic;

begin

	o00: osc00 port map( osc_int => sclk);
	
	o001: div00 port map(
						 clkdiv=> sclk,
						 indiv => indiv0,
						 outdiv => outosc0);
	

end toposc0;