library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity dec00 is
port( clkro: in std_logic;
	  enro: in std_logic;
	  indirro: in std_logic_vector (5 downto 0);  	  
	   outIRDI: out std_logic_vector(31 downto 0) --************	  
	  );
end dec00;

		  --- || OPCODE ||  rs  ||  rt  ||  rd  || shamt || funct ||
		  --      31-26   25-21   20-16   15-11    10-6      5-0

architecture dec0 of dec00 is
signal inIRDI: std_logic_vector(31 downto 0);
type arrayrom is array(0 to 63) of std_logic_vector(7 downto 0);
constant wordIR: arrayrom :=(  

							   "11111111",  --Opcode
							   "00000000",
							   "00000000",
							   "11111111",  --funct
							   
							   "00000000",
							   "00000000",
							   "00000000",
							   "00000000",
							   
							   
	
							   "10010100",---empieza load
							   "00000000",
							   "00000000",
							   "00000000",
							   
							   "10010100",---empieza load
							   "00000001",
							   "00000000",
							   "00000001",	---7
							   
							   "00000000",---empieza add
							   "00000001",
							   "00000000",
							   "00000111",
							   
							   "10101000",---empieza store
							   "00000010",
							   "00000000",
							   "00000010",	---15
							   
							   "11111111",
							   "00000000",
							   "00000000",
							   "10111101",
							   
							   
							   
                            others => "00000000");
begin
	prom: process(clkro)   --inIRDI
	begin
		if(clkro'event and clkro='1') then
			case enro is
				when '0' =>
					inIRDI <= (others => '0');
					outIRDI <= inIRDI;
				when '1' =>
					inIRDI <= (wordIR(conv_integer(indirro)))&(wordIR(conv_integer(indirro + 1)))&(wordIR(conv_integer(indirro + 2)))&(wordIR(conv_integer(indirro + 3)));
					outIRDI <= inIRDI;
				when others => null;
			end case;
		end if;
	end process prom;

end dec0;
