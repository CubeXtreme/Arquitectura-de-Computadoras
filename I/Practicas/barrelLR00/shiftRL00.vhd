library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shiftRL00 is
  port(
       clks: in std_logic;
	   enables: in std_logic;
	   ins: in std_logic_vector(7 downto 0);
	   control: in std_logic_vector(3 downto 0);
       outs: out std_logic_vector(7 downto 0));
end shiftRL00;

architecture shiftRL0 of shiftRL00 is
signal sshift:std_logic_vector(7 downto 0);
signal scont: std_logic_vector(3 downto 0);
begin
  pshift: process(clks)
  begin
    if (clks'event and clks = '1') then
	  case enables is
	    when '0' =>
		  sshift <= ins;
		  outs <= (others => '0');
		  scont <= "0000";
		when '1' =>
		if(scont < control) then
		  scont <= scont + '1';
		  sshift(0) <= '0';
		  sshift(7 downto 1) <= sshift(6 downto 0);
		  outs <= sshift;
		end if;
		when others => null;
	  end case;
	end if;
  end process pshift;
end shiftRL0;