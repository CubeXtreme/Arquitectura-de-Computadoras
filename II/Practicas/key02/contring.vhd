library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contring00 is 
 port(
	en,clkr: in std_logic;
	outc: inout std_logic_vector (4 downto 0);
	outtransis: out std_logic_vector(3 downto 0)
 );
end contring00;

architecture contring0 of contring00 is
signal sring: std_logic_vector(4 downto 0);
begin
  ring: process(clkr)
     begin
	   if (clkr'event and clkr = '1') then
	      case en is
		     when '0' =>
			    sring <= "10000";
				outc <= "00000";
				outtransis<="0000";
			 when '1' =>
				sring(4 downto 1) <= sring(3 downto 0);
				sring(0) <= sring(4);
				outc <= sring;
				outtransis<="0001";
			 when others => null;
		  end case;
	   end if;
     end process ring;
end contring0;