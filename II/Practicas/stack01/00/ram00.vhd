library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;



entity ram00 is
port(
	clkra: in std_logic;
	enra: in std_logic;
	rwra: in std_logic;
	inwordra: in std_logic_vector(6 downto 0 );
	indirWra: in std_logic_vector(4 downto 0 );
	indirRra: in std_logic_vector(4 downto 0 );
	outwordra: out std_logic_vector(6 downto 0 );
	inFlagra: in std_logic
);
end ram00;

architecture ram0 of ram00 is 

type arrayram is array(0 to 63) of std_logic_vector(6 downto 0 );
signal swordram: arrayram;
signal scontr: std_logic_vector(1 downto 0 );

begin
	scontr <= (enra)&(rwra); 
	pram: process(clkra)
	begin
	if(clkra'event and clkra ='1')then
	case scontr is
	when "00"=>
		outwordra <="1111111";
		
	when "01"=>
		outwordra <="1111111";
		
	when "10"=>
	if(inFlagra = '1') then
		swordram(conv_integer(indirWra)) <= inwordra;
		
	end if;
	
	when "11"=>
		outwordra <= swordram(conv_integer(indirRra));
	when others => null;
	
	end case;
	end if;

	end process pram;

end ram0;