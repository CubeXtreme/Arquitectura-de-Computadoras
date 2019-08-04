library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdContData00 is
  port(
       clkcd: in std_logic;
	   resetcd: in std_logic;
	   inFlagconfig: in std_logic;--"lcdConfig"
	   inFlagcd: in std_logic;
	   outcontcd: inout std_logic_vector(5 downto 0);
	   RWcd: out std_logic;
	   RScd: out std_logic;
	   ENcd: out std_logic;
       outFlagcd: out std_logic);
end lcdContData00;

architecture lcdContData0 of lcdContData00 is
begin
  pContData: process(clkcd, resetcd, inFlagconfig, inFlagcd)
  begin
    if (clkcd'event and clkcd = '1') then
	  case resetcd is
	    when '0' =>
		  outcontcd <= "000000";
		  outFlagcd <= '0';
		  RWcd <= '0';
		  RScd <= '1';
		  ENcd <= '1';
		when '1' =>
		  case inFlagconfig is
		    when '0' =>
			  outFlagcd <= '0';
			when '1' =>
			  case inFlagcd is
			    when  '0' =>
			      outcontcd <= outcontcd;
				  outFlagcd <= '1';
				  RWcd <= '0';
				  RScd <= '1';
				  ENcd <= '1';
			    when '1' =>
			      outcontcd <= outcontcd + '1';
				  outFlagcd <= '0';
				  RWcd <= '0';
				  RScd <= '1';
				  ENcd <= '0';
				when others => null;
			  end case;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pContData;
end lcdContData0;