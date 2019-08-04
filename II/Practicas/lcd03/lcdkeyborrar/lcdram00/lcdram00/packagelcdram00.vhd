library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

package packagelcdram00 is

	component toposc00
	port(
	   cdiv0: in std_logic_vector(3 downto 0);
	   outdiv0: inout std_logic);
	end component;
	  
	component lcdram00
	port(
		LCD_DATA : out  STD_LOGIC_VECTOR (7 downto 0);
		
		LCD_ENABLE : out  STD_LOGIC;
		LCD_RS : out  STD_LOGIC;

		LED1 : out  STD_LOGIC;
		LED2 : out  STD_LOGIC;

		CLK : in  STD_LOGIC
	);
	end component;

end packagelcdram00;