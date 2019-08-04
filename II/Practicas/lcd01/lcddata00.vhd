library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcddata00 is
	port(
		clkdata: in std_logic;
		resetdata: in std_logic;
		inFlagcfdata: in std_logic;
		inFlagcontdata: in std_logic;
		outworddata: out std_logic_vector(7 downto 0);
		indirread: in std_logic_vector(5 downto 0);
		outFlagdata: out std_logic
	);
end lcddata00;

architecture lcddata0 of lcddata00 is
type arraydata is array(0 to 64) of std_logic_vector(7 downto 0);
constant worddata: arraydata:= (
"00100000", --espacio
"00100001",--!
"01001000",--H
"01001111",--O	
"01001100",--L
"01000001",--A
"00100000",--ESPACIO
"00100000",--ESPACIO
"00100000",--ESPACIO
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"01001101", --M
"01010101", --U
"01001110", --N
"01000100", --D
"01001111", --O
"00100001", --!
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
"00100000", --espacio
others => "10100101"
);
begin
	pdata: process (indirread, inFlagcontdata)
	begin
			case resetdata is
				when '0' =>
					outworddata <= (others => '0');
					outFlagdata <= '0';
				when '1' =>
					case inFlagcfdata is
						when '0' =>
							outworddata <= (others => '0');
							outFlagdata <= '0';
						when '1' =>
							if (inFlagcontdata = '1') then
								outworddata <= worddata(conv_integer(indirread));
								outFlagdata <= '1';
							end if;
						when others => null; 
					end case;
				when others => null;				
			end case;
	end process pdata;
end lcddata0;