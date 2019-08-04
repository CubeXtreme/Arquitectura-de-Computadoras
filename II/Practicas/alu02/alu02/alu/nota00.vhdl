library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nota00 is
  port(
       clkno: in std_logic;
	   inFlagno: in std_logic;
	   functno: in std_logic_vector(5 downto 0);
	   inRSno: in std_logic_vector(7 downto 0);
	   inRTno: in std_logic_vector(7 downto 0);
	   outRDno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
end nota00;

architecture nota0 of nota00 is
begin
  ------------------------------------------------------
  pnot: process(clkno)
  variable aux: bit:='0';
  begin
    if (clkno'event and clkno = '1') then
	  if (functno = "000010") then
	    case inFlagno is
		  when '0' =>
		    outRDno <= (others => '0');
			outFlagno <= '0';
			aux:='0';
		  when '1' =>
			aux:='1';
			outRDno <= not(inRSno);
			outFlagno <= '1';
		  when others => null;
		end case;
	  else
	    outRDno <= (others => 'Z');
		outFlagno <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pnot;
  ------------------------------------------------
end nota0;




