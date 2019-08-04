library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity mux00 is
port(
	enm: in std_logic;
	rwm: in std_logic;
	inwordWm: in std_logic_vector(6 downto 0);
	inwordRm: in std_logic_vector(6 downto 0);
	outwordm: out std_logic_vector(6 downto 0)
);
end mux00;

architecture mux0 of mux00 is
signal scontrol: std_logic_vector(1 downto 0);
begin

scontrol <= (enm)&(rwm); --concatena

	with scontrol select
		outwordm <= inwordWm when "10",
					inwordRm when "11",
					"1111111" when others;


end mux0;