library ieee; 
use ieee.std_logic_1164.all; 
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all; 

entity contring00 is 
	port(
		 clkkr: in std_logic;
		 enablekr: in std_logic;
		 outkr: out std_logic_vector(3 downto 0));
end contring00;

architecture contring0 of contring00 is
signal soutr: std_logic_vector(3 downto 0);
begin
	pring: process(clkkr)
	begin
		if(clkkr'event and clkkr='1')then
			case enablekr is
				when '0' =>
					soutr <= "1000";
					outkr <= "0000";
				when '1' =>
					soutr(3) <= soutr(0);
					soutr(2 downto 0) <= soutr(3 downto 1);
					outkr <= soutr;
				when others => null;
			end case;
		end if;
	end process pring;
end contring0;