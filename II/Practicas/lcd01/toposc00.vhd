library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageosc00.all;

entity toposc00 is
	port(
			clk0: inout std_logic;
			cdiv0: in std_logic_vector(4 downto 0)
			);
end toposc00;

architecture toposc0 of toposc00 is 
signal sclk: std_logic;
begin 
	OS00: osc00 port map( osc_int=>sclk );
	
	OS01: div00 port map( clkdiv => sclk,
						  indiv => cdiv0,
						  oscout => clk0	
						  );
end toposc0;