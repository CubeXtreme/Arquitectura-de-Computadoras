library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdcontconfig00 is
	port(
		clkcc: in std_logic;
		resetcc: in std_logic;
		inFlagcc: in std_logic;
		outcc: inout std_logic_vector(4 downto 0);
		outFlagcc: out std_logic
	);
end lcdcontconfig00;

architecture lcdcontconfig0 of lcdcontconfig00 is
begin
	pcc: process(clkcc, inFlagcc)
	begin
		if(clkcc'event and clkcc = '1') then 
			case resetcc is
				when '0' =>
					outcc <= (others => '0');
					outFlagcc <= '0';
				when '1' =>	
					case inFlagcc is
						when '0' =>
							outcc <= outcc + '1';
							outFlagcc <= '1'; 
						when '1' =>
							outcc <= outcc;
							outFlagcc <= '0';
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pcc;	
end lcdcontconfig0;