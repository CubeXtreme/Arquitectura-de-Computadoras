library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ora00 is
  port(
       clko: in std_logic;
	   inFlago: in std_logic;
	   functo: in std_logic_vector(5 downto 0);
	   inRSo: in std_logic_vector(7 downto 0);
	   inRTo: in std_logic_vector(7 downto 0);
	   outRDo: out std_logic_vector(7 downto 0);
       outFlago: out std_logic);
end ora00;

architecture ora0 of ora00 is
begin
---------------------------------------
  por: process(clko)
  variable aux: bit:='0';
  begin
    if (clko'event and clko = '1') then
	  if (functo = "000000") then
	    case inFlago is
		  when '0' =>
		    outRDo <= (others => '0');
			outFlago <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
			outRDo <= inRSo or inRTo;
			outFlago <= '1';
		  when others => null;
		end case;
	  else
	    outRDo <= (others => 'Z');
		outFlago <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process por;
  ------------------------------------------------------
end ora0;