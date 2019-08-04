library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;
use packagelcdram00.all;

entity toplcdram00 is
port(
		cdiv00: in std_logic_vector(3 downto 0);
		LCD_DATA0 : out  STD_LOGIC_VECTOR (7 downto 0);
		LCD_ENABLE0 : out  STD_LOGIC;
		LCD_RS0 : out  STD_LOGIC;
		LCD_RW0 : out  STD_LOGIC;
		LED_1 : out  STD_LOGIC;
		clk0 : inout std_logic;
		clr0 : in std_logic;
		COLS: inout std_logic_vector(3 downto 0);
		ROWS: in std_logic_vector(3 downto 0);
		COLSLED: out std_logic_vector(3 downto 0);
		ROWSLED: out std_logic_vector(3 downto 0);
		OP: IN STD_LOGIC
);
end toplcdram00;

architecture toplcdram0 of toplcdram00 is
begin
	U0 : toposc00 port map(
		cdiv0 => cdiv00,
		outdiv0 => clk0
	);
	U1 : lcdram00 port map(
		LCD_DATA=>LCD_DATA0,
		LCD_ENABLE => LCD_ENABLE0,
		LCD_RS => LCD_RS0,
		clk => clk0,
		clr => clr0,
		LED1 => LED_1,
		COLS=>COLS,
		ROWS=>ROWS,
		op=>op
		);
	LCD_RW0 <= '0';
	ROWSLED <= ROWS;
	COLSLED <= COLS;
end architecture;