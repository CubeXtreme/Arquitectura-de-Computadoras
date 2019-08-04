library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageword00.all;

entity topword00 is
	port(
		cdiv00: in std_logic_vector(4 downto 0);
		en: in std_logic;
		outcoder00:out std_logic_vector(7 downto 0);
		clk00:inout std_logic;
		outtransistor00: inout std_logic_vector(5 downto 0)
	);
end entity;

architecture topword0 of topword00 is
signal n:std_logic;
begin
	n<=en;
	WD00:topdiv00 port map
	(
		cdiv0=>Cdiv00,
		clk0=>clk00
	);
	
	WD01: contring00 port map
	(
		enr=>n,
		clkr=>clk00,
		outr=> outtransistor00
	);
	
	WD02: coder00 port map
	(
		incont=>outtransistor00,
		outcoder=>outcoder00
	);
	
end architecture;