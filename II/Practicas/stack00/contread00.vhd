library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contread00 is
  port(
       clkre: in std_logic;
	   enre: in std_logic;
	   rwre: in std_logic;
	   inFlagre: in std_logic;
	   incontkeyre: in std_logic_vector(4 downto 0);
       outcontre: inout std_logic_vector(4 downto 0));
end contread00;

architecture contread0 of contread00 is
begin
  pSP: process(clkre)
  begin
    if (clkre'event and clkre = '1') then
	  case enre is
	    when '0' =>
		  outcontre <= incontkeyre;
		when '1' =>
		  case rwre is
		    when '0' =>
			  outcontre <= incontkeyre;
			when '1' =>
			  case inFlagre is
			    when '0' =>
				  outcontre <= incontkeyre;
				when '1' =>
				  if (outcontre > "00000") then
					outcontre <= outcontre - '1';
				  else
					outcontre <= outcontre;
				  end if;
				when others => null;
			  end case;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pSP;
end contread0;