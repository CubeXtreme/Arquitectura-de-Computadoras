library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contRead00 is port(
		clkcr: in std_logic;
		encr: in std_logic;
		rwcr: in std_logic;
		incontkeycr: in std_logic_vector(4 downto 0);
		outcontRcr: inout std_logic_vector(4 downto 0)
	 );
end contRead00;

architecture contRead0 of contRead00 is 
begin 
 pcr: process(clkcr)
 begin
	if (clkcr'event and clkcr = '1') then 
		case encr is
			when '0' =>
				outcontRcr <= "00000";
			when '1' =>
				case rwcr is
					when '0' =>
						outcontRcr <= "00001";
					when '1' =>
						if (outcontRcr < incontkeycr) then
							outcontRcr <= outcontRcr + '1';
						end if;
					when others => null;
				end case;
			when others => null;
		end case;
	end if; 
 end process pcr;
end contRead0;