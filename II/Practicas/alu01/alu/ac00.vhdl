library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ac00 is
  port(
       clkac: in std_logic;
	   enableac: in std_logic;
	   inFlagac: in std_logic;
	   functac: in std_logic_vector(5 downto 0);
	   inac: in std_logic_vector(7 downto 0);
	   inacmult8bits: in std_logic_vector(15 downto 0);
	   outac: out std_logic_vector(15 downto 0);
       outFlagac: out std_logic);
end ac00;

architecture ac0 of ac00 is
begin
  pac: process(clkac)
  variable aux: bit:='0';
  begin
    if (clkac'event and clkac = '1') then
	  case enableac is
		  when '0' =>
			outac <= (others => '0');
			outFlagac <= '0';
			aux:='0';
		  when '1' =>  -- ***Habilito lectura del acumulador*** 
		    case inFlagac is
			  when '0' =>
			    if (aux = '0') then
				  aux:='1';
				  outac(7 downto 0) <= inac;
				  outac(15 downto 8) <= (others => '0');
				  outFlagac <= '1';  -- *** Dato guardado en acumulador ***
				end if;
			  when '1' =>
				if (functac = "100000") then
					if (aux = '1') then
					  outac <= inacmult8bits;
					  outFlagac <= '1';
					end if;
				else
					if (aux = '1') then
					  outac(7 downto 0) <= inac;
					  outac(15 downto 8) <= (others => '0');
					  outFlagac <= '1';
					end if;
				end if;
			  when others => null;
			end case;
		  when others => null;
      end case;
	end if;
  end process pac;
end ac0;