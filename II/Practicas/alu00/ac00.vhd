library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ac00 is
	port(
			clkac: in std_logic;
			enableac: in std_logic;
			inFlagac: in std_logic;
			inac: in std_logic_vector(7 downto 0);
			outac: out std_logic_vector(7 downto 0);
			outFlagac: out std_logic
		);
end ac00;

architecture ac0 of ac00 is
begin
	pac: process (clkac)
	begin
		if(clkac'event and clkac ='1') then
			case enableac is
				when '0' =>
					outac <=(others => '0');
					outFlagac <= '0';
				when '1' =>
					case inFlagac is
						when '0' =>
							outac <=(others => '0');
							outFlagac <= '1';
						when '1' =>
							outac <= inac;
							outFlagac <= '1';
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pac;
end ac0;