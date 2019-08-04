library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;


use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use packagedec00.all;


entity topdec00 is 
port(
	--display: out std_logic;
	clk00: inout std_logic;
	cdiv00: in std_logic_vector(4 downto 0);
	en0: std_logic;
	outcont0: inout std_logic_vector(5 downto 0);
	--outtransist0: out std_logic_vector(3 downto 0);
--	outword0: inout std_logic_vector(7 downto 0);
	
	
    outopcodeDI0: out std_logic_vector(5 downto 0);
	outRSDI0: out std_logic_vector(4 downto 0);
	outRTDI0: out std_logic_vector(4 downto 0);
	outRDDI0: out std_logic_vector(4 downto 0);
	outshamtDI0: out std_logic_vector(4 downto 0);
	outfunctDI0: out std_logic_vector(5 downto 0);
	
	
	inFlagDI0: in std_logic;
	outFlagDI0: out std_logic
	--inIRDI: in std_logic_vector(31 downto 0);
	
	
);
end topdec00;
 
architecture topdec0 of topdec00 is
signal inIRDI0: std_logic_vector(31 downto 0) := (others => '0');
begin

--display <='1';

--outtransist0 <="1110";

	RO00: topdiv00 port map(
		clk0 => clk00,
		cdiv0 => cdiv00
	);
	RO01: contRead00 port map(
		clkrd => clk00,
		enrd => en0,
		outcontrd => outcont0  
	);
	RO02: dec00 port map( 
		clkro => clk00,
		enro => en0,
		indirro => outcont0,
		--outwordro => outword0,
		outIRDI =>  inIRDI0
		
	--   outopcodeDI => outopcodeDI0,--: out std_logic_vector(5 downto 0);
	--   outRSDI => outRSDI0, --out std_logic_vector(4 downto 0);
	--   outRTDI => outRTDI0,--:out std_logic_vector(4 downto 0);
	--   outRDDI => outRDDI0,--out std_logic_vector(4 downto 0);
	--   outshamtDI =>  outshamtDI0,-- out std_logic_vector(4 downto 0);
	--   outfunctDI => outfunctDI0-- out std_logic_vector(5 downto 0)
		
		
	);
	
	RO03: decoderInst00 port map(
	
	   outopcodeDI => outopcodeDI0,--: out std_logic_vector(5 downto 0);
	   outRSDI => outRSDI0, --out std_logic_vector(4 downto 0);
	   outRTDI => outRTDI0,--:out std_logic_vector(4 downto 0);
	   outRDDI => outRDDI0,--out std_logic_vector(4 downto 0);
	   outshamtDI =>  outshamtDI0,-- out std_logic_vector(4 downto 0);
	   outfunctDI => outfunctDI0,-- out std_logic_vector(5 downto 0)
	
	   clkDI => clk00,--- in std_logic;
	   inFlagDI => inFlagDI0, -- in std_logic;
	   outFlagDI => outFlagDI0,-- out std_logic
	   inIRDI => inIRDI0 -- in std_logic_vector(31 downto 0);
	
	
	
	);
 

end topdec0;