library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
library lattice;
use lattice.all;

entity romData00 is
  port(
       clkrom: in std_logic;
	   enablerom: in std_logic;
	   inFlagrom: in std_logic;
	   indirrom: in std_logic_vector(4 downto 0);
	   outrom: out std_logic_vector(31 downto 0);
	   outFlagrom: out std_logic);
end romData00;

architecture romData0 of romData00 is
type arrayrom is array(0 to 64) of std_logic_vector(7 downto 0);
constant wordrom: arrayrom:=("00000000",-- empieza la primera palabra
                             "00000000",
							 "00000000",
                             "01111100",--byte0, valor de E
							 "00000000",--empieza la segunda palabra
							 "00000000",
							 "00000000",
                             "01011010",-- valor de U
							 "00000000",--empieza la tercera palabra
							 "00000000",
							 "00000000",
							 "00000001",
							 "00000000",
							 "00000000",
							 "00000000",
                             others => "00000110");
signal contRead: std_logic_vector(5 downto 0);
begin
  prom: process(clkrom)
  variable aux: bit:='0';
  begin
    if (clkrom'event and clkrom = '1') then
	  case enablerom is
	    when '0' =>
		  outFlagrom <= '0';
		  outrom <= (others => '0');
		when '1' =>
		  case inFlagrom is
		    when '1' =>
			 if (aux = '0') then
			   aux:='1';
			   outrom <= (wordrom(conv_integer(indirrom)))&(wordrom(conv_integer(indirrom + 1)))&(wordrom(conv_integer(indirrom + 2)))&(wordrom(conv_integer(indirrom + 3)));
			   outFlagrom <= '1';
			 end if;
			when '0' =>
			  outFlagrom <= '0';
			  aux:='0';
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process prom;
end romData0;