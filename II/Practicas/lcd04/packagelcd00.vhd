library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

package packagelcd00 is
  
  component lcdcontconfig00
    port(
       clkcc: in std_logic;
	   resetcc: in std_logic;
	   inFlagcc: in std_logic;
	   outcontcc: inout std_logic_vector(4 downto 0);
       outFlagcc: out std_logic);
  end component;
  
  component lcdconfig00
    port(
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   outWordc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
  end component;
  
  component lcdContData00
    port(
       clkcd: in std_logic;
	   resetcd: in std_logic;
	   inFlagconfig: in std_logic;--"lcdConfig"
	   inFlagcd: in std_logic;
	   outcontcd: inout std_logic_vector(5 downto 0);
	   RWcd: out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
       outFlagcd: out std_logic);
  end component;
  
  component lcdData00
    port(
       clkdd: in std_logic;
	   resetdd: in std_logic;
	   inFlagconfigd: in std_logic;
	   inFlagdd: in std_logic;
	   incontdd: in std_logic_vector(5 downto 0);
	   inWorddd: inout std_logic_vector(7 downto 0);
	   outWorddd: out std_logic_vector(7 downto 0);
       outFlagdd: out std_logic);
  end component;
  
  component lcdmux00
    port(
       clkmlcd: in std_logic;
	   resetmlcd: in std_logic;
	   inFlagmconfig: in std_logic;
	   RWcm: in std_logic;
	   RScm: in std_logic;
	   ENcm: in std_logic;
	   RWdm: in std_logic;
	   RSdm: in std_logic;
	   ENdm: in std_logic;
	   inWordConfig: in std_logic_vector(7 downto 0);
	   inWordd: in std_logic_vector(7 downto 0);
	   RWm: out std_logic;
	   RSm: out std_logic;
	   ENm: out std_logic;
       outWordm: out std_logic_vector(7 downto 0));
  end component;

end packagelcd00;