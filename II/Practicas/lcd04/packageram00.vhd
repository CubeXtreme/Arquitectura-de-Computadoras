library ieee; 
use ieee.std_logic_1164.all;
library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;

package packageram00 is
	
	component toposc00
	port(
		 indiv0: in std_logic_vector(3 downto 0);
		 outosc0: inout std_logic);
	end component; 
	
	component topkey00
	port(
		 clkk: in std_logic; 
		 enablek: in std_logic; 
		 inkeyk: in std_logic_vector(3 downto 0);
		 outrk: inout std_logic_vector(3 downto 0);
		 outcontk0: inout std_logic_vector(4 downto 0);
		 outlcdword: out std_logic_vector(7 downto 0));
	end component; 
	
	component ram00
	port(
		 clkram: in std_logic;
		 enableram: in std_logic;
		 rwram: in std_logic;
		 indirWriteRam: in std_logic_vector(4 downto 0);
		 inWordRam: in std_logic_vector(7 downto 0); 
		 outWordRam: out std_logic_vector(7 downto 0);
		 indirReadRam: in std_logic_vector(4 downto 0) );
	end component; 
	
	component muxram00
	port(
		 clkmux: in std_logic;
		 rwmux: in std_logic; 
		 enablemux: in std_logic; 
		 inWordkey: in std_logic_vector(7 downto 0);
		 inWordRam: in std_logic_vector(7 downto 0); 
		 outWordMux: out std_logic_vector(7 downto 0)
		 );
	end component; 
	
	component contRead00
	port(
		 clkcr: in std_logic; 
		 rwcr: in std_logic; 
		 incontkey: in std_logic_vector(4 downto 0);
		 outcontRead: inout std_logic_vector(4 downto 0) );
	end component;
	
	component toplcd00 
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
	   end component;


end packageram00;