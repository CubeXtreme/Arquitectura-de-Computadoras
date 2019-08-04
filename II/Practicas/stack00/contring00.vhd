library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
  port(
       clkri: in std_logic;
	   enri: in std_logic;
	   outri: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal scont: std_logic_vector(3 downto 0);
begin
  pring: process(clkri)
  begin
  if (clkri'event and clkri = '1') then
    case enri is
	  when '0' =>
	    outri <= (others => '0');
		scont <= "1000";
	  when '1' =>
	    scont(3) <= scont(0);
		scont(2 downto 0) <= scont(3 downto 1);
		outri <= scont;
	  when others => null;
	end case;
  end if;
  end process pring;
end contring0;