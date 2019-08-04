library ieee; 
use ieee.std_logic_1164.all; 
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;

entity muxram00 is 
	port(
		 clkmux: in std_logic;
		 rwmux: in std_logic; 
		 enablemux: in std_logic; 
		 inWordkey: in std_logic_vector(7 downto 0);
		 inWordRam: in std_logic_vector(7 downto 0); 
		 outWordMux: out std_logic_vector(7 downto 0)
		 );
end muxram00;
	
architecture muxram0 of muxram00 is
begin
	pmux: process(clkmux)
	begin
		if(clkmux'event and clkmux ='1') then
			if(enablemux='0') then 
				outWordMux <= "11111111";
			elsif(enablemux='1') then 
				case rwmux is
					when '0' => 
						outWordMux <= inWordkey;
					when '1' => 
						outWordMux <= inWordRam;
					when others => null;
				end case;
			end if;
		end if;
	end process pmux;

end muxram0; 
