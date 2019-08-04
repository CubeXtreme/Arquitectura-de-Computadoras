library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity contIter00 is
  port(
       clkIter: in std_logic;
	   inFlagIter: in std_logic;
	   resetIter: in std_logic;
	   enableIter: in std_logic;
	   outContIter: inout std_logic_vector(3 downto 0);
       outFlagIterA: out std_logic;
	   outFlagIterB: out std_logic);
end contIter00;

architecture contIter0 of contIter00 is
signal RSEN: std_logic_vector(1 downto 0);
begin
RSEN <= (resetIter)&(enableIter);
  pcontIter: process(clkIter, RSEN, inFlagIter)
  variable aux0: bit:='0';
  begin
    if (clkIter'event and clkIter = '1') then
       case RSEN is
	     when "00" =>
		   outContIter <= "0000";
		   outFlagIterA <= '0';
		   outFlagIterB <= '0';
		   aux0:='0';
		 when "01" =>
		   outContIter <= "0000";
		   outFlagIterA <= '0';
		   outFlagIterB <= '0';
		   aux0:='0';
		 when "10" =>
           if ((outContIter < "1001") and (inFlagIter = '0') and (aux0 = '1')) then
		     outContIter <= outContIter;
		     outFlagIterA <= '0';
		     outFlagIterB <= '1';
		   else
		     outFlagIterA <= '0';
		     outFlagIterB <= '1';
		   end if;
		 when "11" =>
           if ((outContIter < "1001") and (inFlagIter = '0') and (aux0 = '0')) then
		     aux0:='1';
		     outContIter <= outContIter + '1';
		     outFlagIterA <= '0';
		     outFlagIterB <= '1';
		   elsif ((outContIter < "1001") and (inFlagIter = '1') and (aux0 = '1')) then
		   	 aux0:='1';
		     outContIter <= outContIter + '1';
		     outFlagIterA <= '0';
		     outFlagIterB <= '1';

		   elsif ((outContIter < "1001") and (inFlagIter = '0') and (aux0 = '1')) then
		   	 aux0:='1';
		     outContIter <= outContIter;
		     outFlagIterA <= '0';
		     outFlagIterB <= '1';

		   elsif ((outContIter > "1001") and (inFlagIter = '1') and (aux0 = '1')) then
		   	 aux0:='1';
		     outContIter <= outContIter;
		     outFlagIterA <= '1';
		     outFlagIterB <= '1';


		   elsif ((outContIter > "1001") and (inFlagIter = '0') and (aux0 = '1')) then
		   	 aux0:='1';
		     outContIter <= outContIter;
		     outFlagIterA <= '1';
		     outFlagIterB <= '1';

		   else
		     aux0:='0';
		     outFlagIterA <= '1';
		     outFlagIterB <= '1';
		   end if;
		 when others => null;
	   end case;
	end if;
  end process pcontIter;
end contIter0;