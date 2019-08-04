library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity stack00 is
  port(
       clkra: in std_logic;
	   enra: in std_logic;
	   rwra: in std_logic;
	   inFlagra: in std_logic;--viene del coderram
	   inwordra: in std_logic_vector(6 downto 0);
	   indirraw: in std_logic_vector(4 downto 0);
	   indirrar: in std_logic_vector(4 downto 0);
	   outwordra: out std_logic_vector(6 downto 0);
       outFlagra: out std_logic);
end stack00;

architecture stack0 of stack00 is
type arraystack is array(0 to 63) of std_logic_vector(6 downto 0);
signal wordstack: arraystack;
begin
  pstack: process(clkra)
  begin
    if (clkra'event and clkra = '1') then
	  case enra is
	    when '0' =>
		  outwordra <= "1111111";
		  outFlagra <= '0';
		when '1' =>
		  case rwra is
		    when '0' =>
			     wordstack(conv_integer(indirraw)) <= inwordra;
				 outFlagra <= '0';
			when '1' =>
			  outwordra <= wordstack(conv_integer(indirrar));
			  outFlagra <= '1';
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pstack;
end stack0;