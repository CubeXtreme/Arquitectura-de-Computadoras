library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdmux00 is
	port(
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
begin
	pmuxlcd: process(clklcdm, inFlagcdm, inwordconfigm, inworddatam)
	begin
		if(clklcdm'event and clklcdm='1') then
			case resetlcdm is
				when '0' =>
					outwordlcdm <= (others=>'0');
					RWm <= '0';
					RSm <= '0';
					ENm <= '0';
				when '1' =>
					case inFlagcm is
						when '0' =>
							outwordlcdm <= inwordconfigm;
							RWm <= RWcm;
							RSm <= RScm;
							ENm <= ENcm;
						when '1' =>
							--if(inFlagcdm='1') then
								outwordlcdm <= inworddatam;
								RWm <= RWdm;
								RSm <= RSdm;
								ENm <= ENddm;
							--end if;
						when others=>null;
					end case;
				when others =>null;
			end case;
		end if;
	end process pmuxlcd;
	
end lcdmux0;