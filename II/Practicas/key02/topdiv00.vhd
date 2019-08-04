library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity topdiv00 is 
  port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic);
end topdiv00;

architecture topdiv0 of topdiv00 is
signal sdiv: std_logic;
begin

  D00: osc00 port map(osc_int => sdiv);
  
  D01: div00 port map(clkdiv => sdiv,
                      indiv => indiv0,
                      outosc => oscout0);

end topdiv0;