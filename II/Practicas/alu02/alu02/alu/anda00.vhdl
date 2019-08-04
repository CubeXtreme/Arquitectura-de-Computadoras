library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity anda00 is
  port(
       clka: in std_logic;
	   inFlaga: in std_logic;
	   functa: in std_logic_vector(5 downto 0);
	   inRSa: in std_logic_vector(7 downto 0);
	   inRTa: in std_logic_vector(7 downto 0);
	   outRDa: out std_logic_vector(7 downto 0);
       outFlaga: out std_logic);
end anda00;

architecture anda0 of anda00 is
begin
  pand: process(clka)
  variable aux: bit:='0';
  begin
    if (clka'event and clka = '1') then
	  if (functa = "000001") then
	    case inFlaga is
		  when '0' =>
		    outRDa <= (others => '0');
			outFlaga <= '0';
			aux:='0';
		  when '1' =>
		    if (aux = '0') then
			  aux:='1';
			  outRDa <= inRSa and inRTa;
			  outFlaga <= '1';
			end if;
		  when others => null;
		end case;
	  else
	    outRDa <= (others => 'Z');
		outFlaga <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pand;
  ------------------------------------------------
end anda0;

