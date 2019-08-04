library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity init00 is
port( 
	clkinit: in std_logic;
	opcodeinit: in std_logic_vector ( 3 downto 0 );
	inFlag8init: in std_logic ;
	outAC8init: out std_logic_vector ( 7 downto 0 );
	outAC12init: out std_logic_vector ( 11 downto 0 );
	outFlag12init: out std_logic ;
	outFlag8init: out std_logic  );
end init00;

architecture init0 of init00 is
begin
  initp: process(clkinit, inFlag8init, opcodeinit)
   variable aux0: bit:= '0';
   variable aux1: bit:= '0';
    begin
      if (clkinit'event and clkinit = '1') then
         if (opcodeinit = "0000") then
             if (inFlag8init = '0') then
			    if (aux0 = '0') then
				   aux0:='1';
                   outAC8init <= "00011100";
                   outAC12init <= "000000000000";
				   outFlag8init <= '1';
                   outFlag12init <= '1';
				else
                   outFlag8init <= '0';
                   outFlag12init <= '0';
				end if;
             elsif (inFlag8init = '1') then
                   if (aux1 = '0') then
                       aux1:='1';
                       outAC8init <= "00000011";
                       outAC12init <= "000000000000";
                       outFlag8init <= '1';
                       outFlag12init <= '1';
                   else
                      outFlag8init <= '0';
                      outFlag12init <= '0';
                   end if;
             end if;
         else
             outAC8init <= (others => 'Z');
             outAC12init <= (others => 'Z');
             outFlag8init <= 'Z';
             outFlag12init <= 'Z';
             aux0:='0';
             aux1:='0';
        end if;
      end if;
    end process initp;
end init0;