library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity ac1200 is
  port(
      clkac12: in std_logic;
	  inAC12: in std_logic_vector(11 downto 0);
	  inFlagac12: in std_logic;
	  outAC12: out std_logic_vector(11 downto 0);
      outFlagac12: out std_logic);
end ac1200;

architecture ac120 of ac1200 is
begin
  pac12: process(clkac12, inFlagac12, inAC12)
  variable aux: bit:='0';
  begin
    if (clkac12'event and clkac12 = '1') then
	  case inFlagac12 is
	    when '1' =>
		  if (aux = '0') then
		    aux:='1';
		    outAC12 <= inAC12;
		    outFlagac12 <= '1';
		  else
		    outFlagac12 <= '0';
		  end if;
		when '0' =>
		  outFlagac12 <= '0';
		  aux:='0';
		when others => null;
	  end case;
	end if;
  end process pac12;
end ac120;