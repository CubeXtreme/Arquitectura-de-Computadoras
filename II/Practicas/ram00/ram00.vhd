library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity ram00 is	port(
		  clkra: in std_logic;
		  inFlagra: in std_logic;
		  enra: in std_logic;
		  rwra: in std_logic;
		  indirWra: in std_logic_vector(4 downto 0);
		  indirRra: in std_logic_vector(4 downto 0);
		  inWordra: in std_logic_vector(6 downto 0);
		  outWordra: out std_logic_vector(6 downto 0);
		  outFlagra: out std_logic
			);
end ram00;

architecture ram0  of ram00 is 
 type arrayram is array(0 to 64) of std_logic_vector(6 downto 0);
 signal wordram: arrayram;
begin 
	pram: process(clkra)
	begin
	 if(clkra'event and clkra='1') then
		case enra is 
			when '0' =>
				outWordra <= "1111111";
				outFlagra <= '1'; --0

			when '1' =>
				case rwra is
					when '0' =>
						wordram(conv_integer(indirWra)) <= inWordra; 
						outFlagra <= '0'; --1
					when '1' =>
						outWordra <= wordram(conv_integer(indirRra));
					when others => null;
					
				end case;
			when others => null;
		end case; --fin enra
	 end if;
	end process pram;
end ram0; 
