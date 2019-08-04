library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ac800 is
  port(
       clkac8: in std_logic;
	   inAC8: in std_logic_vector(7 downto 0);
	   inFlagac8: in std_logic;
	   outAC8: out std_logic_vector(7 downto 0);
       outFlagac8: out std_logic);
end ac800;

architecture ac80 of ac800 is
begin
  pac8: process(clkac8, inFlagac8, inAC8)
  variable aux: bit:='0';
  begin
    if (clkac8'event and clkac8 = '1') then
	  case inFlagac8 is
	    when '1' =>
		  if (aux = '0') then
		  aux:='1';
		  outAC8 <= inAC8;
		  outFlagac8 <= '1';
		  else
		    outFlagac8 <= '0';
		  end if;
		when '0' =>
		  outFlagac8 <= '0';
		  aux:='0';
		when others => null;
	  end case;
	end if;
  end process pac8;
end ac80;