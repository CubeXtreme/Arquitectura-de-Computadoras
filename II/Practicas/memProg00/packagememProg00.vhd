library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

package packagedec00 is

	component topdiv00
	port(
		cdiv0: in std_logic_vector(4 downto 0);
		clk0: inout std_logic);
	end component;
	 
	
	component contRead00 
	
port( clkrd: in std_logic;
	  enrd: in std_logic;
	  outcontrd: inout std_logic_vector (5 downto 0));

	
	end component; 
	
	
	component dec00
	
port( clkro: in std_logic;
	  enro: in std_logic;
	  indirro: in std_logic_vector (5 downto 0);
	 -- outwordro: out std_logic_vector (7 downto 0);
	  outIRDI: out std_logic_vector(31 downto 0)
	  ); --************
	
	  -- outopcodeDI: out std_logic_vector(5 downto 0);
	  -- outRSDI: out std_logic_vector(4 downto 0);
	  -- outRTDI: out std_logic_vector(4 downto 0);
	  -- outRDDI: out std_logic_vector(4 downto 0);
	  -- outshamtDI: out std_logic_vector(4 downto 0);
	  -- outfunctDI: out std_logic_vector(5 downto 0));

	
	end component;
	
	
	component decoderInst00
	port(
	clkDI: in std_logic;
	inFlagDI: in std_logic;
	outFlagDI: out std_logic;
	inIRDI: in std_logic_vector(31 downto 0);
	
	outopcodeDI: out std_logic_vector(5 downto 0); --OPCODE: OPERACION BASICA DE LA INSTRUCCION, DENOTA LA OPERACION Y EL FORMATO DE LA INSTRUCCION.
	outRSDI: out std_logic_vector(4 downto 0);     --RS: PRIMER OPERANDO DE FUENTE DE REGISTRO 
	outRTDI: out std_logic_vector(4 downto 0);	   --RT: SEGUNDO OPERANDO DE FUENTE DE REGISTRO
	outRDDI: out std_logic_vector(4 downto 0);	   --RD: OPERANDO DE DIRECCION DE REGISTRO, OBTIENE EL RESULTADO DE LA OPERACION
	outshamTDI: out std_logic_vector(4 downto 0);  --SHAMT: SHIFT AMOUNT
	outfunctDI: out std_logic_vector(5 downto 0)  --FUNCT: FUNCTION CODE, SELECCIONA LA VARIANTE DE OPERACION
	
	
	
	
	);
	end component;
	

end packagedec00;
