library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity checkCode00 is
  port(
       clkch: in std_logic;
	   resetch: in std_logic;
	   inCodech: in std_logic_vector(3 downto 0);
       outFlagch: out std_logic);
end checkCode00;

architecture checkCode0 of checkCode00 is
begin
  pcheck: process(clkch, resetch, inCodech)
  variable aux: bit:='0';
  begin
  if (clkch'event and clkch = '1') then
    case resetch is
	  when '0' =>
	    outFlagch <= '0';
		aux:='0';
	  when '1' =>
		if (inCodech > "0101") then
		  outFlagch <= '1';
		else
		  outFlagch <= '0';
		end if;
	  when others => null;
	end case;
  end if;
  end process pcheck;
end checkCode0;