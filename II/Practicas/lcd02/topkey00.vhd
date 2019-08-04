library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packagekey00.all;

entity topkey00 is 
	port(
		clk01: inout std_logic;
		en01: in std_logic;
		inkey01: in std_logic_vector(3 downto 0);
		outr01: inout std_logic_vector(3 downto 0);
		outcoder01: out std_logic_vector(7 downto 0);
		RWcd: out std_logic;
		RScd: out std_logic;
		ENcd: out std_logic;
		flag01: in std_logic
	);
end topkey00;

architecture topkey0 of topkey00 is

begin
	
	K01: contring00 port map(
		clkr => clk01,
		enable => en01,
		outr => outr01
	);
	
	K02: coder00 port map(
		clkc => clk01,
		inkey => inkey01,
		incont => outr01,
		flag =>flag01,
		RWcdc => RWcd,
		RScdc =>RScd,
		ENcdc=>ENcd, 
		outcoder => outcoder01
	);
	
end topkey0;