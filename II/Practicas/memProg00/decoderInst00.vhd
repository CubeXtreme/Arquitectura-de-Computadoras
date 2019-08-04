library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity decoderInst00 is
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
end decoderInst00;

architecture decoderInst0 of decoderInst00 is
begin 
	pDI: process(clkDI)
	variable aux: bit:='0';
	begin
		if(clkDI'event and clkDI = '1') then 
		--	case inFlagDI is 
		--		when '1' =>
					--if(aux='0') then
				--		aux:='1';
						outopcodeDI <= inIRDI(31 downto 26);
						outRSDI <= inIRDI(25 downto 21);
						outRTDI <= inIRDI(20 downto 16);
						outRDDI <= inIRDI(15 downto 11);
						outshamtDI <= inIRDI(10 downto 6);
						outfunctDI <= inIRDI(5 downto 0);
						outFlagDI <= '1'; --LA INSTRUCCION HA SIDO SEPARADA EN SUS CAMPOS, LISTA PARA SER LEIDA
					--end if;
			--	when '0' =>
				--	outFlagDI <= '0';
				--	aux:='0';
				
			--	when others => null;
			--end case;
		end if;
	end process pDI;
end decoderInst0;