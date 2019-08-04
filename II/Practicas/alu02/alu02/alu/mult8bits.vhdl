library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
library lattice;

entity mult8bits is
  port (clkm: in std_logic;
		 codopm: in std_logic_vector(5 downto 0);			
		 inFlagm: in std_logic;
		 outm: in std_logic_vector(15 downto 0);
		 outmult: out std_logic_vector(15 downto 0);
		 outFlagm: out std_logic);
end mult8bits;

architecture mult8bits0 of mult8bits is

begin
	pmult: process(clkm, inFlagm)
	variable aux: bit := '0';
	begin
		if(clkm'event and clkm = '1')then
			if(codopm = "001001")then
			case inFlagm is
				when '0' => 
					outmult <= (others => '0');
					outFlagm <= '0';
					aux:='0';
				when '1' => 
					aux:='1';
					outmult <= outm;	
					outFlagm <= '1';
				when others => null;
			end case;
				
			else
				aux:='0';
				outFlagm <='Z';
				outmult <= (others =>'Z');
			end if;--codopm
		end if;--clkm
	end process pmult;
	
end mult8bits0;