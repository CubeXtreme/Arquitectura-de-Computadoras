library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nanda00 is
  port(
       clknand: in std_logic;
	   inFlagnand: in std_logic;
	   functnand: in std_logic_vector(5 downto 0);
	   inRSnand: in std_logic_vector(7 downto 0);
	   inRTnand: in std_logic_vector(7 downto 0);
	   outRDnand: out std_logic_vector(7 downto 0);
       outFlagnand: out std_logic);
end nanda00;

architecture nanda0 of nanda00 is
begin
   ------------------------------------------------------
  pnand: process(clknand)
  variable aux: bit:='0';
  begin
    if (clknand'event and clknand = '1') then
	  if (functnand = "000011") then
	    case inFlagnand is
		  when '0' =>
		    outRDnand <= (others => '0');
			outFlagnand <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
			outRDnand <= inRSnand nand inRTnand;
			outFlagnand <= '1';
		  when others => null;
		end case;
	  else
	    outRDnand <= (others => 'Z');
		outFlagnand <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pnand;
  ------------------------------------------------
end nanda0;

