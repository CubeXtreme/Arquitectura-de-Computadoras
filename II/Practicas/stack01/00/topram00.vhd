library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageram00.all;

entity topram00 is
	port(
			display: out std_logic;
			clk00 : inout std_logic;
			cdiv00: in std_logic_vector (4 downto 0);
			en0,rw0 : in std_logic;
			inkey0: in std_logic_vector (3 downto 0);
			outFlag0: inout std_logic;
			outr0,outrLED0: out std_logic_vector(3 downto 0);
			outcontW0,outcontR0: inout std_logic_vector(4 downto 0);
			outword0: out std_logic_vector(6 downto 0);
			outtransist0: out std_logic_vector(3 downto 0);
			decFlag: inout std_logic
			);
			
end topram00;

architecture topram0 of topram00 is
signal SoutcontW0: std_logic_vector(4 downto 0);
signal soutr: std_logic_vector(3 downto 0);
signal swordW: std_logic_vector(6 downto 0);--coder00=>outcoderc, 
signal swordR: std_logic_vector(6 downto 0);
--signal decFlag: std_logic;
begin
	display <= '1';
	outtransist0 <= not("1110");
	outr0 <= soutr;--contring00=outr ,coder00=>incontc,ram00=>inwordra, mux00=>inwordWm
	outrLED0 <= soutr;--soutrLED0 <= soutr;
	
	RA00: topdiv00 port map(clk0 => clk00,
							cdiv0 => cdiv00
							);
	
	RA01: contring00 port map(clkr => clk00,
							  enr => en0,
							  outr => soutr);
	
	RA02: coder00 port map(clkc=> clk00,
						   enc => en0,
						   rwc => rw0,
						   outFlagc => outFlag0,
						   inkeyc => inkey0,
						   incontc => soutr,
						   outcontc => outcontW0,
						   outcoderc => swordW,
						   flagDecCont => decFlag
	                       );
	
	RA03: ram00 port map(clkra => clk00,
						 enra => en0,
						 rwra => rw0,
						 inFlagra=> outFlag0,
						 inwordra => swordW,
						 indirWra => outcontW0,
						 indirRra => outcontR0,
						 outwordra => swordR 
						 );
	
	RA04: mux00 port map(enm => en0,
						 rwm => rw0,
						 inwordWm => swordW,
						 inwordRm => swordR,
						 outwordm => outword0
						 );
	
	RA05: contRead00 port map(clkrd => clk00,
							  enrd => en0,
							  rwrd => rw0,
							  indirWrd => outcontW0,--señal 
							  outcontrd => outcontR0,
							  decContWrd => decFlag
							);
	
end topram0;
