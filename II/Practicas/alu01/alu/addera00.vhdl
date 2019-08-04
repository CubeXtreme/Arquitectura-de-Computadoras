library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity addera00 is
  port(
       clkad: in std_logic;
	   SLad: in std_logic;
	   codopad: in std_logic_vector(5 downto 0);
	   inFlagad: in std_logic;
	   outsad: in std_logic_vector(7 downto 0);
	   LEDsad: in std_logic;
	   outad: out std_logic_vector(7 downto 0);
	   LEDad: out std_logic;
       outFlagad: out std_logic);
end addera00;

architecture addera0 of addera00 is
begin
  pas: process(clkad, inFlagad)
  variable aux: bit:='0';
    begin
	  if (clkad'event and clkad = '1') then
	    if ((codopad = "000111")) then
			case inFlagad is
				when '0' => 
					outad <= (others => '0');
					outFlagad <= '0';
					aux:='0';
				when '1' => 
					aux:='1';
					outad <= outsad;
					LEDad <= LEDsad;	
					outFlagad <= '1';
				when others => null;
			end case;
		else--codop
		   outad <= (others => 'Z');
		   outFlagad <= 'Z';
		   LEDad <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process pas;
end addera0;