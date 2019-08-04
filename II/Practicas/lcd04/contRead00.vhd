library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;

entity contRead00 is 
	port(
		 clkcr: in std_logic; 
		 rwcr: in std_logic; 
		 incontkey: in std_logic_vector(4 downto 0);
		 outcontRead: inout std_logic_vector(4 downto 0) ); 
end contRead00; 

architecture contRead0 of contRead00 is 
begin	pcontRead: process(clkcr)
	begin 
		if(clkcr'event and clkcr ='1') then 
			case rwcr is
				when '0' => 
					outcontRead <= "00000";
				when '1' =>
					if(outcontRead <= incontkey) then 
						outcontRead <= outcontRead + '1';
					else
						outcontRead <= outcontRead;
					end if;
				when others => null;
			end case;
		end if; 
	end process pcontRead;	


end contRead0; 