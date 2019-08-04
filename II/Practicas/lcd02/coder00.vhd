library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity coder00 is
	port(
		clkc: inout std_logic;
		inkey: in std_logic_vector(3 downto 0);
		incont: in std_logic_vector(3 downto 0);
		flag: in std_logic;
		RWcdc: out std_logic;
		RScdc: out std_logic;
		ENcdc: out std_logic;
		outcoder: out std_logic_vector(7 downto 0)
	);
end coder00;

architecture coder0 of coder00 is
begin
	pcoder: process(clkc, incont)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	variable aux2: bit:='0';
	variable aux3: bit:='0';
	begin
		if(clkc'event and clkc='1') then
			case incont is
				when "1000" =>
					case inkey is
						when "0000" =>
							aux0:='0';
							RWcdc<='0';
							RScdc<='1';
							ENcdc<='0';
							--flag<='0';
						when "0001" =>
							if(aux0 = '0') then
								aux0:='1';
								outcoder <= "01000001"; --A
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0010" =>
							if(aux0 = '0') then
								aux0:='1';
								outcoder <= "01000010"; --C 
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0100" =>
							if(aux0 = '0') then
								aux0:='1';
								outcoder <= "01000011"; --B
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "1000" =>
							if(aux0 = '0') then
								aux0:='1';
								outcoder <= "01000100"; --D
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when others => null;
					end case;	
				
				when "0100" =>
					case inkey is
					when "0000" =>
						RWcdc<='0';
						RScdc<='1';
						ENcdc<='0';
						aux1:='0';
						--flag<='0';
						when "0001" =>
							if(aux1 = '0') then
								aux1:='1';
								outcoder <= "00110011"; --3
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0010" =>
							if(aux1 = '0') then
								aux1:='1';
								outcoder <= "00110110"; --9  00111001
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0100" =>
							if(aux1 = '0') then
								aux1:='1';
								outcoder <= "00111001"; --6
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "1000" =>
							if(aux1 = '0') then
								aux1:='1';
								outcoder <= "00100011"; --#
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when others => null;
					end case;
				
				when "0010" =>
					case inkey is
						when "0000" =>
							aux2:='0';
							RWcdc<='0';
							RScdc<='1';
							ENcdc<='0';
							--flag<='0';
						when "0001" =>
							if(aux2 = '0') then
								aux2:='1';
								outcoder <= "00110010"; --2
								RWcdc <= '0';
								RScdc <= '1';
								ENcdc <= '1';
								--flag<='1';
							end if;
						when "0010" =>
							if(aux2 = '0') then
								aux2:='1';
								outcoder <= "00110101"; --5  
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0100" =>
							if(aux2 = '0') then
								aux2:='1';
								outcoder <= "00111000"; --8
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "1000" =>
							if(aux2 = '0') then
								aux2:='1';
								outcoder <= "00110000"; --0
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when others => null;
					end case;
				
				when "0001" =>
					case inkey is
						when "0000" =>
							aux3:='0';
							RWcdc<='0';
							RScdc<='1';
							ENcdc<='0';
							--flag<='0';
						when "0001" =>
							if(aux3 = '0') then
								aux3:='1';
								outcoder <= "00110001"; --1
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0010" =>
							if(aux3 = '0') then
								aux3:='1';
								outcoder <= "00110100"; --7 
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "0100" =>
							if(aux3 = '0') then
								aux3:='1';
								outcoder <= "00110111"; --4
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when "1000" =>
							if(aux3 = '0') then
								aux3:='1';
								outcoder <= "00101010"; --*
								RWcdc<='0';
								RScdc<='1';
								ENcdc<='1';
								--flag<='1';
							end if;
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcoder;
end coder0;