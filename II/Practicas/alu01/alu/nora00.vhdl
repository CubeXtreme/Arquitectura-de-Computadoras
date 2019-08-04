library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nora00 is
  port(
       clknor: in std_logic;
	   inFlagnor: in std_logic;
	   functnor: in std_logic_vector(5 downto 0);
	   inRSnor: in std_logic_vector(7 downto 0);
	   inRTnor: in std_logic_vector(7 downto 0);
	   outRDnor: out std_logic_vector(7 downto 0);
       outFlagnor: out std_logic);
end nora00;

architecture nora0 of nora00 is
begin
  pnor: process(clknor)
  variable aux: bit:='0';
  begin
    if (clknor'event and clknor = '1') then
	  if (functnor = "000100") then
	    case inFlagnor is
		  when '0' =>
		    outRDnor <= (others => '0');
			outFlagnor <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
  		    outRDnor <= inRSnor nor inRTnor;
		    outFlagnor <= '1';
		  when others => null;
		end case;
	  else
	    outRDnor <= (others => 'Z');
		outFlagnor <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pnor;
  ------------------------------------------------
end nora0;

