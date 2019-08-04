library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packagelcdram00.all;

entity toplcdram00 is
port(
		LCD_DATA0 : out  STD_LOGIC_VECTOR (7 downto 0);
		
		LCD_ENABLE0 : out  STD_LOGIC;
		LCD_RS0 : out  STD_LOGIC;
		cdiv00: in std_logic_vector(3 downto 0)
);
end toplcdram00;

architecture toplcdram0 of toplcdram00 is
signal clks: std_logic;
begin
	U0 : toposc00 port map(
		cdiv0 => cdiv00,
		outdiv0 => clks
	);
	U1 : lcdram00 port map(
		LCD_DATA=>LCD_DATA0,
		LCD_ENABLE => LCD_ENABLE0,
		LCD_RS => LCD_RS0,
		clk => clks
	);
end architecture;