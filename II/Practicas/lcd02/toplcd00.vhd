library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagelcd00.all;

entity toplcd00 is
	port(
		clear0: inout std_logic;--nuevo clear
		clk0: inout std_logic;
		cdiv0: in std_logic_vector(4 downto 0);
		reset0: in std_logic;
		outworlcd0: out std_logic_vector(7 downto 0);
		outwordled0: out std_logic_vector(7 downto 0);
		RW0: out std_logic;
		RS0: out std_logic;
		EN0: out std_logic;
		outcc0: inout std_logic_vector(4 downto 0);
		outFlagc0: inout std_logic;
		outFlagcc0: inout std_logic;
		outFlagcd0: inout std_logic;
		outcontcd0: inout std_logic_vector(5 downto 0);
		inkey0: in std_logic_vector(3 downto 0);
		outr0: inout std_logic_vector(3 downto 0);
		outFlagdata0: out std_logic				
	);
end toplcd00;

architecture toplcd0 of toplcd00 is
signal swordconfig: std_logic_vector(7 downto 0);
signal sworddata: std_logic_vector(7 downto 0);
signal sword: std_logic_vector(7 downto 0);
signal sRWc, sRSc, sENc, sRWd, sRSd, sENd: std_logic;
begin
outworlcd0<= sword;
outwordled0 <=sword;
	L00: toposc00 port map(
		clk0 => clk0,
		cdiv0 => cdiv0
	);
	
	L01: lcdcontconfig00 port map(
		clkcc => clk0,
		resetcc => reset0,
		inFlagcc => outFlagc0,
		outcc => outcc0,
		outFlagcc => outFlagcc0
	);
	
	L02: lcdconfig00 port map(
		clkc => clk0,
		resetc => reset0,
		inFlagc => outFlagcc0,
		incontc => outcc0,
		comandoc => swordconfig,
		outFlagc => outFlagc0,
		RWc => sRWc,
		RSc => sRSc,
		ENc => sENc
	);
	
	
	L15: topkey00 port map(
		clk01 => clk0,
		en01 => reset0,
		flag01=> outFlagc0,
		inkey01 => inkey0,
		outr01 => outr0,
		outcoder01 => sworddata,
		RWcd=>sRWd,
		RScd=>sRSd,
		ENcd=>sENd
		
	);
	
	L05: lcdmux00 port map(
		clear => clear0,
		clklcdm => clk0,
		resetlcdm => reset0,
		inFlagcm => outFlagc0,
		inFlagcdm => outFlagcd0,
		inwordconfigm => swordconfig,
		inworddatam => sworddata,
		RWcm => sRWc, 
		RScm => sRSc,
		ENcm => sENc,
		RWdm => sRWd,
		RSdm => sRSd,
		ENddm => sENd, 
		outwordlcdm => sword,
		RWm => RW0,
		RSm => RS0,
		ENm => EN0
	);
end toplcd0;