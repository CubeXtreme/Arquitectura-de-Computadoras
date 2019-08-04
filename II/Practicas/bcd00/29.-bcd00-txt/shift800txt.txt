library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity shift800 is
  port(
       clks8: in std_logic;
	   opcodes8: in std_logic_vector(3 downto 0);
	   inACs8: in std_logic_vector(7 downto 0);
	   inFlags8: in std_Logic;
	   outACs8: out std_logic_vector(7 downto 0);
       outFlags8: out std_logic);
end shift800;

architecture shift80 of shift800 is
begin
  pshift8: process(clks8, inFlags8, inACs8, opcodes8)
  variable aux: bit:='0';
  begin
    if (clks8'event and clks8 = '1') then
	  if (opcodes8 = "0100") then
	    case inFlags8 is
		  when '1' =>
		    if (aux = '0') then
			  aux:='1';
			  outACs8(0) <= '0';
			  outACs8(7 downto 1) <= inACs8(6 downto 0);
			  outFlags8 <= '1';
			else
			  outFlags8 <= '0';
			end if;-- aux
		  when '0' =>
		    outFlags8 <= '0';
		  when others => null;
		end case;
	  else--opcode
	    outACs8 <= (others => 'Z');
		outFlags8 <= 'Z';
		aux:='0';
	  end if;
	end if;--clks8
  end process pshift8;
end shift80;