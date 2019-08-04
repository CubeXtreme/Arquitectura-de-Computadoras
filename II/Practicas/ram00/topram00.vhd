library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packageram00.all;

entity topram00 is
 port(
		clk00: inout std_logic; 
		cdiv00: in std_logic_vector(4 downto 0); -- Cableado (4 downto 0)
		en0: in std_logic; 
		rw0: in std_logic;
		inkey0: in std_logic_vector(3 downto 0); -- Cableado (3 downto 0)
		inFlag0: inout std_logic;
		outFlag0: inout std_logic;
		outring0: out std_logic_vector(4 downto 0); -- Cableado (3 downto 0)
		outringled0: out std_logic_vector(4 downto 0); -- Cableado (3 downto 0)
		outcontW0: inout std_logic_vector(4 downto 0); -- Cableado (3 downto 0)
		outcontR0: inout std_logic_vector(4 downto 0); -- Cableado (3 downto 0)
		outWord0: out std_logic_vector(6 downto 0); -- Cableado (6 downto 0)
		outtransist0: out std_logic_vector(3 downto 0) -- Cableado (3 downto 0)
	  );
end topram00;

architecture topram0 of topram00 is
	signal soutring: std_logic_vector(4 downto 0); --4
	signal soutwordkey: std_logic_vector(6 downto 0);
	signal soutwordram: std_logic_vector(6 downto 0);
begin
	outtransist0 <= "0001";
	outring0 <= soutring;
	outringled0 <= soutring;
	
	MRA00: toposc00 port map( clk0 => clk00,
							cdiv0 => cdiv00
							);
	
	MRA01: contring00 port map( clks => clk00,
							en => en0,
							outr => soutring
							);
	
	MRA02: coderram00 port map( clkc => clk00,
								enc => en0,
								inFlagc => inFlag0,
								inkey => inkey0,
								incont => soutring,
								outcontc => outcontW0,
								outcoder => soutwordkey,
								outFlagc => outFlag0					
							);

	MRA03: ram00 port map( clkra => clk00,
							inFlagra => outFlag0,
							enra => en0,
							rwra => rw0,
							indirWra => outcontW0,
							indirRra => outcontR0,
							inWordra => soutwordkey,
							outWordra => soutwordram,
							outFlagra => inFlag0
						);
	
	MRA04: muxram00 port map(	enm => en0,
							rwm => rw0,
							inWordkeym => soutwordkey,
							inwordramm => soutwordram,
							outWordm => outword0
							);
	
	MRA05: contRead00 port map(	clkcr => clk00,
								encr => en0,
								rwcr => rw0,
								incontkeycr => outcontW0,
								outcontRcr => outcontR0
								);
	
end topram0;