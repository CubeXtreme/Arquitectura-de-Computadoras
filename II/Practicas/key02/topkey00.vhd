library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packgewordkey00.all;

entity topkey00 is 
 port( 
	cdiv0: in std_logic_vector(4 downto 0);
	en0: in std_logic;
	inkey0: in std_logic_vector(3 downto 0);
	clks: inout std_logic;
	outled0: out std_logic_vector(4 downto 0);
	outring: inout std_logic_vector(4 downto 0);
	outtrans: out std_logic_vector(3 downto 0);
	outdigito: out std_logic_vector (6 downto 0)
 );
end topkey00; 

architecture topkey0 of topkey00 is
signal soutring: std_logic_vector(4 downto 0);
begin
 
Div: topdiv00 port map(indiv0=>cdiv0,oscout0=>clks);
Ring: contring00 port map(en=>en0,clkr=>clks,outc=>soutring,outtransis=>outtrans);
Mux: muxletra port map(clkc=>clks,enc=>en0,inkey=>inkey0,incont=>soutring,outcoder=>outdigito);

outring<=soutring;
outled0<=soutring;

end topkey0;