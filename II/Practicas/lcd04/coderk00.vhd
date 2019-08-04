library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all; 

entity coderk00 is
	port(clkc: in std_logic;
		 enablec: in std_logic;
		 inkey: in std_logic_vector(3 downto 0); 
		 incontk: in std_logic_vector(3 downto 0);
		 outcontk: inout std_logic_vector(4 downto 0);
		 outcoderk: out std_logic_vector(7 downto 0)); 
end coderk00; 

architecture coderk0 of coderk00 is
begin
	pcoderk: process(clkc, incontk, inkey, enablec)
	variable aux0: bit := '0' ;
	variable aux1: bit := '0' ;
	variable aux2: bit := '0' ;
	variable aux3: bit := '0' ;
	begin
	if(clkc'event and clkc ='1') then
		if(enablec = '0') then
			outcontk <= "11111";
			outcoderk <= "11111111";
		elsif(enablec ='1') then
			case incontk is
				when "1000" =>
					case inkey is
						when "0000" =>
							outcontk <= outcontk;
							aux0 :='0';
						when "0001" =>
							if ( aux0 = '0') then
								aux0 := '1';
								outcoderk <= "00110001";		--1
								outcontk <= outcontk +'1';
							end if;
						when "0010" =>
							if ( aux0 = '0') then
								aux0 := '1';
								outcoderk <= "00110010";		--2
								outcontk <= outcontk +'1';
							end if;
						when "0100" =>
							if ( aux0 = '0') then
								aux0 := '1';
								outcoderk <= "00110011";		--3
								outcontk <= outcontk +'1';
							end if;
						when "1000" =>
							if ( aux0 = '0') then
								aux0 := '1';
								outcoderk <= "01000001";		--A
								outcontk <= outcontk +'1';
							end if;
						when others => null;
					end case;
				when "0100" =>
					case inkey is
						when "0000" =>
							outcontk <= outcontk;
							aux1 :='0';
						when "0001" =>
							if ( aux1 = '0') then
								aux1 := '1';
								outcoderk <= "00110100";		--4
								outcontk <= outcontk +'1';
							end if;
						when "0010" =>
							if ( aux1 = '0') then
								aux1 := '1';
								outcoderk <= "00110101";		--5
								outcontk <= outcontk +'1';
							end if;
						when "0100" =>
							if ( aux1 = '0') then
								aux1 := '1';
								outcoderk <= "00110110";		--6
								outcontk <= outcontk +'1';
							end if;
						when "1000" =>
							if ( aux1 = '0') then
								aux1 := '1';
								outcoderk <= "01000010";		--B
								outcontk <= outcontk +'1';
							end if;
						when others => null;
					end case;
				when "0010" =>
					case inkey is
						when "0000" =>
							outcontk <= outcontk;
							aux2 :='0';
						when "0001" =>
							if ( aux2 = '0') then
								aux2 := '1';
								outcoderk <= "00110111";		--7
								outcontk <= outcontk +'1'; 
							end if;
						when "0010" =>
							if ( aux2 = '0') then
								aux2 := '1';
								outcoderk <= "00111000";		--8
								outcontk <= outcontk +'1';
							end if;
						when "0100" =>
							if ( aux2 = '0') then
								aux2 := '1';
								outcoderk <= "00111001";		--9
								outcontk <= outcontk +'1';
							end if;
						when "1000" =>
							if ( aux2 = '0') then
								aux2 := '1';
								outcoderk <= "01000011";		--C
								outcontk <= outcontk +'1';
							end if;
						when others => null;
					end case;
				when "0001" =>
					case inkey is
						when "0000" =>
							outcontk <= outcontk;
							aux3 :='0';
						when "0001" =>
							if ( aux3 = '0') then
								aux3 := '1';
								outcoderk <= "00110000";		-- 0
								outcontk <= outcontk +'1';
							end if;
						when "0010" =>
							if ( aux3 = '0') then
								aux3 := '1';
								outcoderk <= "00101010";		-- * (Cuadro de abajo)
								outcontk <= outcontk +'1';
							end if;
						when "0100" =>
							if ( aux3 = '0') then
								aux3 := '1';
								outcoderk <= "00101011";		-- + (Cuadro de arriba)
								outcontk <= outcontk +'1';
							end if;
						when "1000" =>
							if ( aux3 = '0') then
								aux3 := '1';
								outcoderk <= "00101101";		-- -
								outcontk <= outcontk +'1';
							end if;
						when others => null;
					end case;
				when others => null;
			end case;
		end if; --enable
	end if; --clk
	end process pcoderk; 

end coderk0;