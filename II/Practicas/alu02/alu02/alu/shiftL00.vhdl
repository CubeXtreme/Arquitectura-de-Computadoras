library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity shiftL00 is
  port(
       clkshiftL: in std_logic;
	   inFlagshiftL: in std_logic;
	   functshiftL: in std_logic_vector(5 downto 0);
	   inRSshiftL: in std_logic_vector(7 downto 0);
	   inRTshiftL: in std_logic_vector(7 downto 0);
	   outRDshiftL: out std_logic_vector(7 downto 0);
       outFlagshiftL: out std_logic);
end shiftL00;

architecture shiftL0 of shiftL00 is

signal sshift: std_logic_vector(7 downto 0);

begin
  pxora: process(clkshiftL)
  variable aux: bit:='0';
  begin
    if (clkshiftL'event and clkshiftL = '1') then
	  if (functshiftL = "001010") then
	    case inFlagshiftL is
		  when '0' =>
		    outRDshiftL <= (others => '0');
			
			sshift <= inRSshiftL;
			outFlagshiftL <= '0';
			aux:='0';
		  when '1' =>		   
			  sshift(0) <= '0';
			  sshift(7 downto 1) <= sshift (6 downto 0);
			  outRDshiftL <= sshift;
			  
			  outFlagshiftL <= '1';
		  when others => null;
		end case;
	  else
	    outRDshiftL <= (others => 'Z');
		outFlagshiftL <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end shiftL0;
