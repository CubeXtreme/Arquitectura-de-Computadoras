library ieee; 
use ieee.std_logic_1164.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;
use packageram00.all;

entity topram00 is 
	port(
		clk0: inout std_logic;
		enable0: in std_logic;
		rw0: in std_logic;
		cdiv0: in std_logic_vector(3 downto 0);
		inkey0: in std_logic_vector(3 downto 0); 
		soutFlagconfig00: inout std_logic;
		soutFlagContConfig00: inout std_logic;
		soutFlagContData00: inout std_logic;
		soutFlagData00: inout std_logic;
		--soutContKey00: inout std_logic_vector(4 downto 0);
		soutContConfig00: inout std_logic_vector(4 downto 0);
		soutContData00: inout std_logic_vector(5 downto 0);
		outr0: inout std_logic_vector(3 downto 0);
		soutcontwk0: inout std_logic_vector(4 downto 0);
		outLCD0: out std_logic_vector(7 downto 0);
		soutcontrk:inout std_logic_vector(4 downto 0);
		RW00: out std_logic;
		RS00: out std_logic;
		EN00: out std_logic); 
end topram00; 

architecture topram0 of topram00 is 
signal swordkey, swordram, word: std_logic_vector(7 downto 0);
begin

	R00: toposc00 port map(	outosc0 => clk0,
							indiv0 =>cdiv0);
	
	R01: topkey00 port map(  clkk=> clk0, 
							 enablek => enable0, 
							 inkeyk => inkey0,
							 outrk => outr0,
							 outcontk0 => soutcontwk0,
							 outlcdword => swordkey);
	
	
	R03: muxram00 port map( clkmux => clk0,
						    rwmux => rw0,
						    enablemux => enable0,
						    inWordkey => swordkey,
						    inWordRam => swordram,
							outWordMux => word);
	
	R04: contRead00 port map( clkcr => clk0,
							  rwcr => rw0,
							  incontkey => soutcontwk0,
							  outcontRead => soutcontrk);
							
	R05: toplcd00 port map(clk0=> clk0,
						   reset0=> enable0,
						   soutFlagconfig0 => soutFlagconfig00,
						   soutFlagContConfig0 => soutFlagContConfig00, 
						   soutFlagContData0 => soutFlagContData00,
						   soutFlagData0 => soutFlagData00,
						   inWordlcd0 => word, 
						   soutContConfig0 => soutContConfig00,
						   soutContData0 => soutContData00,
						   outWordlcd0 => outLCD0,
						   RW0 => RW00, 
						   RS0 => RS00,
						   EN0 => EN00);
						   
						   
						   
	R07: ram00 port map( clkram => clk0,
						 enableram => enable0,
						 rwram => rw0,
						 indirWriteRam => soutcontwk0,
						 inWordRam => swordkey,
						 outWordRam => swordram,
						 indirReadRam => soutcontrk);
		 
	
end topram0; 