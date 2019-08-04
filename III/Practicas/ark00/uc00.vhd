library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;
library lattice;
use lattice.all; 
 
entity uc00 is
  port(
       opcodeuc: in std_logic_vector(5 downto 0);
	   outFlagucR: out std_logic;
	   outFlagucL: out std_logic;
       outFlagucS: out std_logic);
end uc00;

architecture uc0 of uc00 is
begin
  with opcodeuc select
     outFlagucR <= '1' when "000000",
	             '0' when others;
  with opcodeuc select
	 outFlagucL <= '1' when "100101",
	             '0' when others;
  with opcodeuc select
	 outFlagucL <= '1' when "101010",
	             '0' when others;
end uc0;