library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xora00 is
  port(
       clkxor: in std_logic;
	   inFlagxor: in std_logic;
	   functxor: in std_logic_vector(5 downto 0);
	   inRSxor: in std_logic_vector(7 downto 0);
	   inRTxor: in std_logic_vector(7 downto 0);
	   outRDxor: out std_logic_vector(7 downto 0);
       outFlagxor: out std_logic);
end xora00;

architecture xora0 of xora00 is
begin
  pxora: process(clkxor)
  variable aux: bit:='0';
  begin
    if (clkxor'event and clkxor = '1') then
	  if (functxor = "000101") then
	    case inFlagxor is
		  when '0' =>
		    outRDxor <= (others => '0');
			outFlagxor <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
			outRDxor <= inRSxor xor inRTxor;
			outFlagxor <= '1';
		  when others => null;
		end case;
	  else
	    outRDxor <= (others => 'Z');
		outFlagxor <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end xora0;

