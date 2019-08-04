library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftR00 is
  port(
       clkshiftR: in std_logic;
	   inFlagshiftR: in std_logic;
	   functshiftR: in std_logic_vector(5 downto 0);
	   inRSshiftR: in std_logic_vector(7 downto 0);
	   inRTshiftR: in std_logic_vector(7 downto 0);
	   outRDshiftR: out std_logic_vector(7 downto 0);
       outFlagshiftR: out std_logic);
end shiftR00;

architecture shiftR0 of shiftR00 is

signal sshift: std_logic_vector(7 downto 0);

begin
  pxora: process(clkshiftR)
  variable aux: bit:='0';
  begin
    if (clkshiftR'event and clkshiftR = '1') then
	  if (functshiftR = "001011") then
	    case inFlagshiftR is
		  when '0' =>
		    outRDshiftR <= (others => '0');
			
			sshift <= inRSshiftR;
			outFlagshiftR <= '0';
			aux:='0';
		  when '1' =>
			sshift(7) <= '0';
			sshift(6 downto 0) <= sshift (7 downto 1);
			outRDshiftR <= sshift;
			
			outFlagshiftR <= '1';
		  when others => null;
		end case;
	  else
	    outRDshiftR <= (others => 'Z');
		outFlagshiftR <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end shiftR0;