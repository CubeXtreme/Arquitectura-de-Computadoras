library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity rotL00 is
  port(
       clkrotL: in std_logic;
	   inFlagrotL: in std_logic;
	   functrotL: in std_logic_vector(5 downto 0);
	   inRSrotL: in std_logic_vector(7 downto 0);
	   inRTrotL: in std_logic_vector(7 downto 0);
	   outRDrotL: out std_logic_vector(7 downto 0);
       outFlagrotL: out std_logic);
end rotL00;

architecture rotL0 of rotL00 is

signal sshift: std_logic_vector(7 downto 0);

begin
  pxora: process(clkrotL)
  variable aux: bit:='0';
  begin
    if (clkrotL'event and clkrotL = '1') then
	  if (functrotL = "001100") then
	    case inFlagrotL is
		  when '0' =>
		    outRDrotL <= (others => '0');
			
			sshift <= inRSrotL;
			outFlagrotL <= '0';
			aux:='0';
		  when '1' =>
			sshift(0) <= sshift(7);
			sshift(7 downto 1) <= sshift (6 downto 0);
			outRDrotL <= sshift;
		  
			outFlagrotL <= '1';
		  when others => null;
		end case;
	  else
	    outRDrotL <= (others => 'Z');
		outFlagrotL <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end rotL0;