library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity pc00 is
  port(
       clkpc: in std_logic;
	   inFlagpc: in std_logic_vector(2 downto 0);
	   outpc: inout std_logic_vector(3 downto 0);
       outFlagpc: out std_logic);
end pc00;

architecture pc0 of pc00 is
begin
  ppc: process(clkpc)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  variable aux4: bit:='0';
  begin
    if (clkpc'event and clkpc = '1') then
	  case inFlagpc is
	    when "000" =>-- inicialización
		  outpc <= "0000";
		  outFlagpc <= '0';
		  aux0:='0';
		  aux1:='0';
		  aux2:='0';
		  aux3:='0';
		  aux4:='0';
		when "001" =>-- fin de las iteraciones
		  aux0:='0';
		  aux1:='0';
		  aux2:='0';
		  aux3:='0';
		  aux4:='0';
		  outpc <= outpc;
		  outFlagpc <= '0';
		when "011" =>-- se detendrá, pero coloca su bandera en 1
		  aux1:='0';
		  aux2:='0';
		  aux3:='0';
		  aux4:='0';
		  if (aux0 = '0') then
		    aux0:='1';
		    outpc <= outpc;
		    outFlagpc <= '1';
          else
		    outFlagpc <= '0';
		  end if;
		when "100" =>
		  aux0:='0';
		  aux2:='0';
		  aux3:='0';
		  aux4:='0';
          if (aux1 = '0') then
		    aux1:='1';
		    outpc <= outpc + '1';
            outFlagpc <= '1';
          else
			outFlagpc <= '0';
			--aux1:='0';
		  end if;
		when "101" =>
		  aux0:='0';
		  aux1:='0';
		  aux2:='0';
		  aux3:='0';
		  aux4:='0';
		  outpc <= outpc;
		  outFlagpc <= '0';
		when "110" =>
		  aux0:='0';
		  aux1:='0';
		  aux2:='0';
		  aux4:='0';
		  if (aux3 = '0') then
		    aux3:='1';
		    outpc <= "0010";
		    outFlagpc <= '1';
		  else
		    outFlagpc <= '0';
		  end if;
		when others => null;
	  end case;
	end if;
  end process ppc;
end pc0;