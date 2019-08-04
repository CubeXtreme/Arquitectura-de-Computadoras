library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageStack00.all;

entity topstack00 is
  port(
       clk0: inout std_logic;
	   cdiv0: in std_logic_vector(4 downto 0);
	   en0: in std_logic;
	   rw0: in std_logic;
	   inkey0: in std_logic_vector(3 downto 0);
	   outr0: out std_logic_vector(3 downto 0);
	   outrled0: out std_logic_vector(3 downto 0);
	   outword0: out std_logic_vector(6 downto 0);
	   outcontW0: inout std_logic_vector(4 downto 0);
	   outcontR0: inout std_logic_vector(4 downto 0);
	   outFlagcoder0: inout std_logic;
       outFlagram0: inout std_logic;
	   outtransist0: out std_logic_vector(3 downto 0));
end topstack00;

architecture topstack0 of topstack00 is
signal scontring: std_logic_vector(3 downto 0);
signal swordcoder: std_logic_vector(6 downto 0);
signal swordram: std_logic_vector(6 downto 0);
begin
outtransist0 <= "1000";
outr0 <= scontring;
outrled0 <= scontring;

  RA00: topdiv00 port map(oscout0 => clk0,
                          indiv0 => cdiv0);
  
  RA01: contring00 port map(clkri => clk0,
                            enri => en0,
                            outri => scontring);
  
  RA02: coderstack00 port map(clkr => clk0,
                              enr => en0,
							  inkeyr => inkey0,
							  incontr => scontring,
							  outcoderr => swordcoder,
							  outcontr => outcontW0,
                              outFlagr => outFlagcoder0);
  
  RA03: stack00 port map(clkra => clk0,
                         enra => en0,
					     rwra => rw0,
					     inFlagra => outFlagcoder0,
					     inwordra => swordcoder,
					     indirraw => outcontW0,
					     indirrar => outcontR0,
					     outwordra => swordram,
                         outFlagra => outFlagram0);
  
  RA04: muxstack00 port map(enm => en0,
                           rwm => rw0,
						   inwordkeym => swordcoder,
						   inwordramm => swordram,
                           outwordm => outword0);
  
  
  RA05: contread00 port map(clkre => clk0,
                                enre => en0,
							    rwre => rw0,
							    inFlagre => outFlagram0,
							    incontkeyre => outcontW0,
                                outcontre => outcontR0);

end topstack0;