library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdData00 is
  port(
       clkdd: in std_logic;
	   resetdd: in std_logic;
	   inFlagconfigd: in std_logic;
	   inFlagdd: in std_logic;
	   incontdd: in std_logic_vector(5 downto 0);
	   inWorddd: inout std_logic_vector(7 downto 0);
	   outWorddd: out std_logic_vector(7 downto 0);
       outFlagdd: out std_logic);
end lcdData00;

architecture lcdData0 of lcdData00 is
begin
 pd: process(clkdd, resetdd, inFlagconfigd, inFlagdd)
 begin
   if (clkdd'event and clkdd = '1') then
     case resetdd is
	   when '0' =>
	     outWorddd <= "00000001";
		 outFlagdd <= '0';
	   when '1' =>
	     case inFlagConfigd is
		   when '0' =>
	         outWorddd <= "00000001";
		     outFlagdd <= '0';
		   when '1' =>
		         case inFlagdd is
				   when '0' =>
				     outWorddd <= inWorddd;
					 outFlagdd <= '1';
				   when '1' =>
					 outFlagdd <= '0';  
				   when others => null;
				 end case;
		   when others => null;
		 end case;
	   when others => null;
	 end case;
   end if;
 end process pd;
end lcdData0;