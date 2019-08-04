library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity muxram00 is 
 port(
		enm: in std_logic;
		rwm: in std_logic;
		inWordkeym: in std_logic_vector(6 downto 0);
		inWordramm: in std_logic_vector(6 downto 0);
		outWordm: out std_logic_vector(6 downto 0)
	 );
end muxram00;
architecture muxram0 of muxram00 is 
begin 
	pmux: process(inWordkeym, inWordramm)
	begin
	case enm is 
		when '0' =>
			outWordm <= "1111111";
		when '1' =>
			case rwm is
				when '0' =>
					outWordm <= inWordkeym;
				when '1' =>
					outWordm <= inWordramm;
				when others => null;
			end case;
		when others => null;
	end case;
	end process pmux;
end muxram0;
