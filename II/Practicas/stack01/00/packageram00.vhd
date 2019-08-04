library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

package packageram00 is

 component topdiv00
	port(
		cdiv0: in std_logic_vector(4 downto 0);
		clk0: inout std_logic
	);
 end component;
 
 

 component contring00
	port(
		clkr: in std_logic;
		enr: in std_logic;
		outr: out std_logic_vector(3 downto 0)
	); 
 end component;




 component coder00 
	port(
		clkc: in std_logic;
		enc: in std_logic;
		rwc: in std_logic;
		outflagc: out std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcontc: inout std_logic_vector(4 downto 0); --*****
		outcoderc: out std_logic_vector(6 downto 0);
		flagDecCont: in std_logic
	); 
 end component;




 component ram00
	port(
		clkra: in std_logic;
		enra: in std_logic;
		rwra: in std_logic;
		inwordra: in std_logic_vector(6 downto 0 );
		indirWra: inout std_logic_vector(4 downto 0 );
		indirRra: in std_logic_vector(4 downto 0 );
		outwordra: out std_logic_vector(6 downto 0 );
		inFlagra: in std_logic
	); 
 end component;




 component mux00
	port(
		enm: in std_logic;
		rwm: in std_logic;
		inwordWm: in std_logic_vector(6 downto 0);
		inwordRm: in std_logic_vector(6 downto 0);
		outwordm: out std_logic_vector(6 downto 0)
	);
 end component;

 
 

 component contread00
		port(
			clkrd : in std_logic;
			enrd,rwrd : in std_logic;
			indirWrd: inout std_logic_vector(4 downto 0);
			outcontrd:  inout std_logic_vector (4 downto 0);
			decContWrd: out std_logic
		);
 end component;


end packageram00;
