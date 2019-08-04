library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;

entity topalu00 is
port(
		clk00: inout std_logic;
		enable0:in std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		funct0: in std_logic_vector(5 downto 0);
		inregRS0: in std_logic_vector(7 downto 0);
		inregRT0: in std_logic_vector(7 downto 0);
		outalu0: out std_logic_vector(7 downto 0);
		outFlagInst0: inout std_logic;
		outFlagac0: inout std_logic		
	);
end topalu00;

architecture topalu0 of topalu00 is
signal sdata: std_logic_vector(7 downto 0);
begin

	AL00: topdiv00 port map(clk0 => clk00,
							cdiv0 => cdiv00
							);
	
	AL01: anda00 port map(clka => clk00,
							inFlaga => outFlagac0,
							functa => funct0,
							inrsa =>  inregRS0,
							inrta  => inregRT0,
							outrda => sdata,
							outFlaga => outFlagInst0
						);

	AL02: ora00 port map(clko => clk00,
							inFlago => outFlagac0,
							functo => funct0,
							inrso =>  inregRS0,
							inrto  => inregRT0, 
							outrdo => sdata,
							outFlago => outFlagInst0
							);
	
	AL03: ac00 port map(clkac => clk00,
							enableac => enable0,
							inFlagac => outFlagInst0,
							inac => sdata,
							outac => outalu0,
							outFlagac => outFlagac0
						);

end topalu0;