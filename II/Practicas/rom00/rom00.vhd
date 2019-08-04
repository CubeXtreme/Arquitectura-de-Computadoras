library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity rom00 is
	port(
		 clkro : in std_logic;
		 enro: in std_logic;
		 indirro: in std_logic_vector(4 downto 0);
		 outrom: out std_logic_vector(6 downto 0)
		);
end rom00;

architecture rom0 of rom00 is
type arrayrom is array(0 to 15) of std_logic_vector(6 downto 0);
constant wordrom: arrayrom:=("1111110",--0 0000001
							 "0110000",--1 1001111
							 "1101101",--2 0010010
							 "1111001",--3 0000110
							 "0110011",--4 1001100
							 "1011011",--5 0100100
							 "1011111",--6 0100000
							 "1110000",--7 0001111
							 "1111111",--8 0000000
							 "1111011",--9 0001100
							 "1110111",--A 0001000
							 "0011111",--B 1100000
							 "1001110",--C 0110001
							 "0111101",--D 1000010
							 "1001111",--E 1001110
							 "1000111",--F 1111000
							 others => "0000000");
begin
	prom: process (clkro)
	begin
		if (clkro'event and clkro = '1') then
			case enro is			
				when '0' =>
					outrom <= "0000000";
				when '1' =>
					outrom <= wordrom(conv_integer(indirro));
				when others =>					
			end case ;
		end if ;
	end process prom;
end rom0;