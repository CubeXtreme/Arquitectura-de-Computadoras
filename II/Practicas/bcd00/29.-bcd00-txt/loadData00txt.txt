library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity loadData00 is
port( 
	clkLD: in std_logic ;
	opcodeLD: in std_logic_vector ( 3 downto 0 );
	inDataLD: in std_logic_vector ( 7 downto 0 );
	outDataLD: out std_logic_vector ( 7 downto 0 );
	inFlagLD: in std_logic ;
	outFlagLD: out std_logic  );
end loadData00;

architecture loadData0 of loadData00 is
begin
  pdata: process(clkLD, inFlagLD, opcodeLD, inDataLD)
  variable aux: bit:='0';
    begin
      if (clkLD'event and clkLD = '1') then
         if (opcodeLD = "0001") then
              if (inFlagLD = '1') then
			    if (aux = '0') then
				   aux:='1';
                   outDataLD <= inDataLD;
                   outFlagLD <= '1';
				else
				   outFlagLD <= '0';
				end if;
              elsif (inFlagLD = '0') then
                 outFlagLD <= '0';
              end if;
          else
             outDataLD <= (others => 'Z');
             outFlagLD <= 'Z';
			 aux:='0';
        end if;
      end if;
    end process pdata;
end loadData0;