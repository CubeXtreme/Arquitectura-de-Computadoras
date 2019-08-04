library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity subsa00 is 
  port(
       clksb: in std_logic;
	   SLsb: in std_logic;
	   codopsb: in std_logic_vector(5 downto 0);
	   inFlagsb: in std_logic; 
	   outssb: in std_logic_vector(7 downto 0); 
	   LEDssb: in std_logic;
	   outsb: out std_logic_vector(7 downto 0);
	   LEDsb: out std_logic;
       outFlagsb: out std_logic);
end subsa00;

architecture subsa0 of subsa00 is
begin
  psb: process(clksb, inFlagsb)
  variable aux: bit:='0';
    begin
	  if (clksb'event and clksb = '1') then
	    if ((codopsb = "001000")) then
		   case inFlagsb is
				when '0' => 
					outsb <= (others => '0');
					outFlagsb <= '0';
					aux:='0';
				when '1' => 
					aux:='1';
					outsb <= outssb;
					LEDsb <= LEDssb;	
					outFlagsb <= '1';
				when others => null;
			end case;
		else--codop
		   outsb <= (others => 'Z');
		   outFlagsb <= 'Z';
		   LEDsb <= 'Z';
		   aux:='0';
		end if;--codop
	  end if;
    end process psb;
end subsa0;