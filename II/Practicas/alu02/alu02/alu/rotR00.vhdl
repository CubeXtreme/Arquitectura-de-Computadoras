library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity rotR00 is
  port(
       clkrotR: in std_logic;
	   inFlagrotR: in std_logic;
	   functrotR: in std_logic_vector(5 downto 0);
	   inRSrotR: in std_logic_vector(7 downto 0);
	   inRTrotR: in std_logic_vector(7 downto 0);
	   outRDrotR: out std_logic_vector(7 downto 0);
       outFlagrotR: out std_logic);
end rotR00;

architecture rotR0 of rotR00 is

signal sshift: std_logic_vector(7 downto 0);

begin
  pxora: process(clkrotR)
  variable aux: bit:='0';
  begin
    if (clkrotR'event and clkrotR = '1') then
	  if (functrotR = "001101") then
	    case inFlagrotR is
		  when '0' =>
		    outRDrotR <= (others => '0');
			
			sshift <= inRSrotR;
			outFlagrotR <= '0';
			aux:='0';
		  when '1' =>
		  
			sshift(7) <= sshift(0);
			sshift(6 downto 0) <= sshift (7 downto 1);
			outRDrotR <= sshift;
		  
			outFlagrotR <= '1';
		  when others => null;
		end case;
	  else
	    outRDrotR <= (others => 'Z');
		outFlagrotR <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end rotR0;