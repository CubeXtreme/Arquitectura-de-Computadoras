library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnora00 is
  port(
       clkxnor: in std_logic;
	   inFlagxnor: in std_logic;
	   functxnor: in std_logic_vector(5 downto 0);
	   inRSxnor: in std_logic_vector(7 downto 0);
	   inRTxnor: in std_logic_vector(7 downto 0);
	   outRDxnor: out std_logic_vector(7 downto 0);
       outFlagxnor: out std_logic);
end xnora00;

architecture xnora0 of xnora00 is
begin
  pxnora: process(clkxnor)
  variable aux: bit:='0';
  begin
    if (clkxnor'event and clkxnor = '1') then
	  if (functxnor = "000110") then
	    case inFlagxnor is
		  when '0' =>
		    outRDxnor <= (others => '0');
			outFlagxnor <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
			outRDxnor <= inRSxnor xnor inRTxnor;
			outFlagxnor <= '1';
		  when others => null;
		end case;
	  else
	    outRDxnor <= (others => 'Z');
		outFlagxnor <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxnora;
  ------------------------------------------------
end xnora0;

