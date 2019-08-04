library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity anda00 is
	port(
			clka: in std_logic;
			inFlaga: in std_logic;
			functa: in std_logic_vector (5 downto 0);
			inrsa:  in std_logic_vector (7 downto 0);
			inrta:  in std_logic_vector (7 downto 0);			
			outrda:  out std_logic_vector (7 downto 0);
			outFlaga: out std_logic
		);
end anda00;

architecture anda0 of anda00 is
begin 
	pand: process(clka)
	variable aux: bit:='0';
	begin 
		if(clka'event and clka = '1') then
			if (functa ="000000") then
				case inFlaga is
					when '0'  =>
						outrda <=(others => '0');
						outFlaga <= '0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrda <= inrsa and inrta;
							outFlaga <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrda<=(others=>'Z');
				outFlaga<='Z';
			end if;
		end if;
	end process pand;
end anda0;