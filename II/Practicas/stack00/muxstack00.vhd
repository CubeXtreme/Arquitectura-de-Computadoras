library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity muxstack00 is
  port(
       enm: in std_logic;
	   rwm: in std_logic;
	   inwordkeym: in std_logic_vector(6 downto 0);
	   inwordramm: in std_logic_vector(6 downto 0);
       outwordm: out std_logic_vector(6 downto 0));
end muxstack00;

architecture muxstack0 of muxstack00 is
signal sconcatena: std_logic_vector(1 downto 0);
begin
  sconcatena <= (enm)&(rwm);--&(inFlagm);
    with sconcatena select
	  outwordm <= inwordkeym when "10",
	              inwordramm when "11",
			      "1111111" when others;
end muxstack0;