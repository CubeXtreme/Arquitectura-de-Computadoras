library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagestack00 is

  component topdiv00
    port(
       indiv0: in std_logic_vector(4 downto 0);
       oscout0: inout std_logic);
  end component;
  
  component contring00
    port(
       clkri: in std_logic;
	   enri: in std_logic;
	   outri: out std_logic_vector(3 downto 0));
  end component;
  
  component  coderstack00
    port(
       clkr: in std_logic;
	   enr: in std_logic;
	   inkeyr: in std_logic_vector(3 downto 0);
	   incontr: in std_logic_vector(3 downto 0);
	   outcoderr: out std_logic_vector(6 downto 0);
	   outcontr: inout std_logic_vector(4 downto 0);
       outFlagr: out std_logic);
  end component;
 
  component stack00
    port(
       clkra: in std_logic;
	   enra: in std_logic;
	   rwra: in std_logic;
	   inFlagra: in std_logic;--viene del coderram
	   inwordra: in std_logic_vector(6 downto 0);
	   indirraw: in std_logic_vector(4 downto 0);
	   indirrar: in std_logic_vector(4 downto 0);
	   outwordra: out std_logic_vector(6 downto 0);
       outFlagra: out std_logic);
  end component;

  component muxstack00
    port(
       enm: in std_logic;
	   rwm: in std_logic;
	   inwordkeym: in std_logic_vector(6 downto 0);
	   inwordramm: in std_logic_vector(6 downto 0);
       outwordm: out std_logic_vector(6 downto 0));
  end component;
 
 
  component contread00
    port( 
       clkre: in std_logic;
	   enre: in std_logic;
	   rwre: in std_logic;
	   inFlagre: in std_logic;
	   incontkeyre: in std_logic_vector(4 downto 0);
       outcontre: inout std_logic_vector(4 downto 0));
  end component;

end packagestack00;