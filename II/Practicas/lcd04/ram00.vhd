library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice; 
use lattice.all; 
library machxo2; 
use machxo2.all;

entity ram00 is 
	port(
		 clkram: in std_logic;
		 enableram: in std_logic;
		 rwram: in std_logic;
		 indirWriteRam: in std_logic_vector(4 downto 0);
		 inWordRam: in std_logic_vector(7 downto 0); 
		 outWordRam: out std_logic_vector(7 downto 0);
		 indirReadRam: in std_logic_vector(4 downto 0) );
end ram00; 

architecture ram0 of ram00 is
type arrayRam is array(0 to 31) of std_logic_vector(7 downto 0);
signal wordRam: arrayRam:=(others => (others => '0'));
begin
	pram: process(clkram)
	begin 
		if(clkram'event and clkram ='1') then
			if((enableram = '1') and (rwram = '0')) then
				wordRam(conv_integer(indirWriteRam)) <= inWordRam;	---- Escritura
			elsif((enableram = '1') and (rwram = '1')) then
				outWordRam <= wordRam(conv_integer(indirReadRam));	---- Lectura
			end if;
		end if;
	end process pram;

end ram0;