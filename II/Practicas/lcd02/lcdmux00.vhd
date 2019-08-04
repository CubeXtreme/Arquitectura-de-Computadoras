library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdmux00 is
	port(
		clear: inout std_logic;--nuevoLimpiar
		clklcdm: in std_logic;
		resetlcdm: in std_logic;
		inFlagcm: in std_logic;
		inFlagcdm: in std_logic;
		inwordconfigm: in std_logic_vector(7 downto 0);
		inworddatam: in std_logic_vector(7 downto 0);
		RWcm: in std_logic;
		RScm: in std_logic;
		ENcm: in std_logic;
		RWdm: in std_logic;
		RSdm: in std_logic;
		ENddm: in std_logic;
		outwordlcdm: out std_logic_vector(7 downto 0);
		RWm: out std_logic;
		RSm: out std_logic;
		ENm: out std_logic
	);
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
signal aux2: std_logic;
begin
	pmuxlcd: process(clklcdm, inFlagcdm, inwordconfigm, inworddatam)
	variable aux: bit:='0';
	
	begin
		if(clklcdm'event and clklcdm='1') then
			case resetlcdm is
				when '0' =>
					outwordlcdm <= (others=>'0');
					RWm <= '0';
					RSm <= '0';
					ENm <= '0';
					aux2<='0';--
				when '1' =>
					case inFlagcm is
						when '0' =>
							outwordlcdm <= inwordconfigm;
							RWm <= RWcm;
							RSm <= RScm;
							ENm <= ENcm;
						when '1' =>
							aux2<=clear;
							if(aux2='0') then--nuevoclear
								outwordlcdm <= inworddatam;
								RWm <= RWdm;
								RSm <= RSdm;
								ENm <= ENddm;
							else--nuevo clear
								if(aux = '0') then 	--
									outwordlcdm <= "00000001";--
									aux:= '1';----
									RWm <= '0';--
									RSm <= '0';--
									ENm <= '1';--
								elsif(aux = '1') then-- 
									outwordlcdm <= "00000001";--
									RWm <= '0';--
									RSm <= '0';--
									ENm <= '0';--
									aux:= '0';--
									aux2<= '0';--
								end if;--
							end if;--nuevo clear
						when others=>null;
					end case;
				when others =>null;
			end case;
		end if;
	end process pmuxlcd;
	
end lcdmux0;