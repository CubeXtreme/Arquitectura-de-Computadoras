library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ora00 is
	port(
			clko: in std_logic;
			inFlago: in std_logic;
			functo: in std_logic_vector (5 downto 0);
			inrso:  in std_logic_vector (7 downto 0);
			inrto:  in std_logic_vector (7 downto 0);			
			outrdo:  out std_logic_vector (7 downto 0);
			outFlago: out std_logic
		);
end ora00;

architecture ora0 of ora00 is
begin 
	por: process(clko)
	variable aux: bit:='0';
	begin 
		if(clko'event and clko = '1') then
			if (functo ="000001") then
				case inFlago is
					when '0'  =>
						outrdo <=(others => '0');
						outFlago <= '0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdo <= inrso or inrto;
							outFlago <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdo<=(others=>'Z');
				outFlago<='Z';
			end if;
		end if;
	end process por;
end ora0;