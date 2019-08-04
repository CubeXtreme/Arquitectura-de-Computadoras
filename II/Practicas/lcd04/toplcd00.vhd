library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;
use packagelcd00.all;


entity toplcd00 is
  port(
       clk0: inout std_logic;
	   reset0: in std_logic;
	   soutFlagconfig0: inout std_logic;
	   soutFlagContConfig0: inout std_logic;
	   soutFlagContData0: inout std_logic;
	   soutFlagData0: inout std_logic;
	   inWordlcd0: inout std_logic_vector(7 downto 0);
	   soutContConfig0: inout std_logic_vector(4 downto 0);
	   soutContData0: inout std_logic_vector(5 downto 0);
	   outWordlcd0: out std_logic_vector(7 downto 0);
	   RW0: out std_logic;
	   RS0: out std_logic;
       EN0: out std_logic);
end toplcd00;

architecture toplcd0 of toplcd00 is
--signal sinFlagcc, soutFlagcc: std_logic;
--signal sinFlagcd, soutFlagcd: std_logic;
signal sRWc, sRSc, sENc: std_logic;
signal sRWd, sRSd, sENd: std_logic;
signal soutWordConfig, soutWordData: std_logic_vector(7 downto 0);
begin
  
  U01: lcdcontconfig00 port map(clkcc => clk0,
                                resetcc => reset0,
								inFlagcc => soutFlagconfig0,
								outcontcc => soutContConfig0,
                                outFlagcc => soutFlagContConfig0);
  
  U02: lcdconfig00 port map(clkc => clk0,
                            resetc => reset0,
							inFlagc => soutFlagContConfig0,
							incontc => soutContConfig0,
							outWordc => soutWordConfig,
							outFlagc => soutFlagconfig0,
							RWc => sRWc,
							RSc => sRSc,
                            ENc => sENc);
  
  U03: lcdContData00 port map(clkcd => clk0,
                            resetcd => reset0,
							inFlagconfig => soutFlagconfig0,
							inFlagcd => soutFlagData0,
							outcontcd => soutContData0,
							RWcd => sRWd,
							RScd => sRSd,
                            ENcd => sENd,
							outFlagcd => soutFlagContData0);
  
  U04: lcdData00 port map(clkdd => clk0,
                        resetdd => reset0,
						inFlagconfigd => soutFlagconfig0,
						inFlagdd => soutFlagContData0,
						incontdd => soutContData0,
						inWorddd => inWordlcd0,
						outWorddd => soutWordData,
                        outFlagdd => soutFlagData0);
  
  U05: lcdmux00 port map(clkmlcd => clk0,
                         resetmlcd => reset0,
						 inFlagmconfig => soutFlagconfig0,
						 RWcm => sRWc,
						 RScm => sRSc,
						 ENcm => SENc,
						 RWdm => sRWd,
						 RSdm => sRSd,
						 ENdm => SENd,
						 inWordConfig => soutWordConfig,
						 inWordd => soutWordData,
						 outWordm => outWordlcd0,
						 RWm => RW0,
						 RSm => RS0,
                         ENm => EN0);
end toplcd0;