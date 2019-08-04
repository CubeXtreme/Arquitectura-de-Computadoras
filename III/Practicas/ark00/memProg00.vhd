library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--ARK00
entity memProg00 is
  port(
       clkmp: in std_logic;
	   inPCmp: in std_logic_vector(5 downto 0);
	   enmp: in std_logic;
	   inFlagmp: in std_logic;
	   outIRmp: out std_logic_vector(31 downto 0);
       outFlagmp: out std_logic);
end memProg00;
--ES UNA ROM
architecture memProg0 of memProg00 is
type memProg is array(0 to 63) of std_logic_vector(7 downto 0);
constant wordIR: memProg:=("10010100",---empieza load
                           "00000000",
						   "00000000",
						   "00000000",
						   "10010100",---empieza load
                           "00000001",
						   "00000000",
						   "00000100",
						   "00000000",---empieza add
                           "00000001",
						   "00000000",
						   "00000111",
						   "10101000",---empieza store
                           "00000010",
						   "00000000",
						   "00000010",
                            others => "00000000");
begin
  pmemp: process(clkmp)
  variable aux: bit:='0';
  begin
    if (clkmp'event and clkmp = '1') then
	  case inFlagmp is
	    when '1' =>
           if(aux='0') then
		      aux:= '1';
		      outIRmp <= (wordIR(conv_integer(inPCmp)))&(wordIR(conv_integer(inPCmp + 1)))&(wordIR(conv_integer(inPCmp + 2)))&(wordIR(conv_integer(inPCmp + 3)));
		      outFlagmp <='0';
		    end if;
		when '0'=>
		   aux :='0';
		   outFlagmp <='0';
		when others => null;
	  end case;
	end if;
  end process  pmemp;
end memProg0;