library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
	port(
		enr: in std_logic;
		clkr: in std_logic;
		outr: out std_logic_vector(5 downto 0)
	);
end entity;

architecture contring0 of contring00 is
signal scont:std_logic_vector(5 downto 0);
begin
	pring: process(clkr)
	begin
		if(clkr'event  and clkr='1') then
			case enr is
				when '0' =>
					outr<=(others=>'0');
					scont<= "011111";
				when '1'=>
					
					scont(4 downto 0)<=Scont(5 downto 1);
					scont(5)<=scont(0);
					outr<=scont;
				
				when others =>null;
			end case;
		end if;
	end process pring;
end architecture;