library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity muxletra is
  port(
       clkc: in std_logic;
	   enc: in std_logic;
       inkey: in std_logic_vector(3 downto 0);
	   incont: in std_logic_vector(4 downto 0);
       outcoder: out std_logic_vector(6 downto 0)
 );
end muxletra;

architecture muxletra0 of muxletra is
signal sinkeyA: std_logic;
signal scontstate: std_logic_vector(3 downto 0);
begin
  pcoder: process(incont, inkey)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  variable auxA: bit:='0';
  variable auxB: bit:='0';
  variable auxC: bit:='0';
  variable auxD: bit:='0';
  begin
  if (clkc'event and clkc = '1') then
---------------------------------------------------------
   case enc is--enc
    when '0' =>
      outcoder <= "1111111";
	  scontstate <= "0000";
	  sinkeyA <= '0';
-------------------------------------------------------
    when '1' =>
    case incont is
	  when "00001" =>--incont
	    scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" =>
		    if ((aux0 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0110000";--1 0110000
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "00100" =>
		    if ((aux0 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0110011";--4 0110011
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "01000" =>
		    if ((aux0 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1110000";--7 1110000
			else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "10000" =>
		    if ((aux0 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "0000001";--* 0000001
		    else
			  auxA:='1';
			  auxB:='0';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when others => null;
		end case;
	  when "00010" =>--incont
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" =>
		    if ((aux1 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1101101";--2 1101101
		    else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "00100" =>
		    if ((aux1 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1011011";--5 1011011
	        else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "01000" =>
		    if ((aux1 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1111111";--8 1111111
			else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when "10000" =>
		    if ((aux1 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			  outcoder <= "1111110";--0 1111110
            else
			  auxA:='0';
			  auxB:='1';
			  auxC:='0';
			  auxD:='0';
			end if;
		  when others => null;
		end case;
	  when "00100" =>--incont
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" =>
		    if ((aux2 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "1111001";--3 1111001
            else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			end if;
		  when "00100" =>
		    if ((aux2 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "1011111";--6 1011011
	        else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			end if;
		  when "01000" =>
		    if ((aux2 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "1111011";--9 1111011
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			end if;
		  when "10000" =>
		    if ((aux2 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			  outcoder <= "0110111";--# 0110111
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='1';
			  auxD:='0';
			end if;
		  when others => null;
		end case;
	  when "01000" =>--incont
	  scontstate <= scontstate + '1';
	    case (inkey)&(sinkeyA) is
		  when "00010" =>
		    if ((aux3 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "1110111";--A 1110111
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			end if;
		  when "00100" =>
		    if ((aux3 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "0011111";--b 0011111
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			end if;
		  when "01000" =>
		    if ((aux3 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "1001110";--c 0001101
		    else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			end if;
		  when "10000" =>
		    if ((aux3 = '0')) then
			  aux0:='1';
			  aux1:='1';
			  aux2:='1';
			  aux3:='1';
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			  outcoder <= "0111101";--d 0111101
			else
			  auxA:='0';
			  auxB:='0';
			  auxC:='0';
			  auxD:='1';
			end if;
		  when others => null;
		end case;
	  when "10000" =>--incont
	    scontstate <= scontstate + '1';
------------------------------------------------sigue A-----------
	    if ((auxA = '1') and (scontstate > "0100")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
           scontstate <= "0000";
		elsif ((auxA = '0') and (scontstate > "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='0';
		   aux1:='0';
		   aux2:='0';
		   aux3:='0';
		   scontstate <= "0000";
-------------------------------------------------------sigue B-----------
		elsif ((auxB = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxB = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='0';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
------------------------------------------------------sigue C------------
		elsif ((auxC = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxC = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='0';
		   aux3:='1';
		   scontstate <= "0000";
----------------------------------------------------sigue D--------------
		elsif ((auxD = '1') and (scontstate < "0101")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='1';
		   scontstate <= "0000";
		elsif ((auxD = '0') and (scontstate > "1001")) then
		   auxA:='0';
		   auxB:='0';
		   auxC:='0';
		   auxD:='0';
		   aux0:='1';
		   aux1:='1';
		   aux2:='1';
		   aux3:='0';
		   scontstate <= "0000";
------------------------------------------------------------------
		end if;
	  when others => null;--incont
	end case;--incont
	when others => null;
   end case;--enc
  end if;
  end process pcoder;
end muxletra0;