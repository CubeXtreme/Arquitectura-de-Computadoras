library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
  port(
       clkcr: in std_logic;
	   encr: in std_logic;
       outcr: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal soutcr: std_logic_vector(3 downto 0);
begin
  pring: process(clkcr)
  begin
    if (clkcr'event and clkcr = '1') then
	  case encr is
	    when '0' =>
		  outcr <= (others => '0');
		  soutcr <= "1000";
		when '1' =>
		  soutcr(3) <= soutcr(0);
		  soutcr(2 downto 0) <= soutcr(3 downto 1);
		  outcr <= soutcr;
		when others => null;
	  end case;
	end if;
  end process pring;
end contring0;