library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coderram00 is
  port(
       clkc: in std_logic;
	   inFlagc: in std_logic;
	   enc: in std_logic;
       inkey: in std_logic_vector(3 downto 0);
	   incont: in std_logic_vector(4 downto 0);
	   outcontc: inout std_logic_vector(4 downto 0); --palabra a segmentos
       outcoder: out std_logic_vector(6 downto 0);
	   outFlagc: out std_logic
	   );	   
end coderram00;

architecture coderram0 of coderram00 is
begin
  pcoder: process(incont, inkey)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  
  begin
  if (clkc'event and clkc = '1') then
  case enc is 
   when '0' => 
    outcoder <= "1111111";
	outcontc <= "00000";
	outFlagc <= '0';
   when '1' =>	
  
  
		case incont is
		  when "00001" =>--incont
			case inkey is
			 when "0000" =>
			   outcontc <= outcontc;
			  when "0001" =>
				if ((aux0 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0110000"; -- 1
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				else
				  outFlagc <= '0';
				end if;
			  when "0010" =>
				if ((aux0 = '0') and (inFlagc ='0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0110011"; -- 4
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0';
				end if;
			  when "0100" =>
				if ((aux0 = '0') and (inFlagc ='0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1110000"; -- 7
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				end if;
			  when "1000" =>
				if ((aux0 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0110001"; -- +
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0';
				end if;
				
			  when others => null;
			end case;
		  when "00010" =>--incont
			case inkey is
			  when "0001" =>
				if ((aux1 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1101101"; -- 2
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0';
			
				end if;
			  when "0010" =>
				if ((aux1 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1011011"; -- 5 
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0';
				end if;
				
			  when "0100" =>
				if ((aux1 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1111111"; -- 8
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "1000" =>
				if ((aux1 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1111110"; -- 0
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when others => null;
			end case;
		  
		  when "00100" =>--incont
			case inkey is

			  when "0001" =>
				if ((aux2 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1111001"; -- 3 
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "0010" =>
				if ((aux2 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1011111"; -- 6
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "0100" =>
				if ((aux2 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1111011"; -- 9  
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "1000" =>
				if ((aux2 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0110111"; --# 
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when others => null;
			end case;
		 
		 when "01000" =>--incont
			case inkey is
			  when "0001" =>
				if ((aux3 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1110111"; -- A 
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "0010" =>
				if ((aux3 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0011111"; -- b 
				 outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "0100" =>
				if ((aux3 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "1001110"; -- C 
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when "1000" =>
				if ((aux3 = '0') and (inFlagc = '0')) then
				  aux0:='1';
				  aux1:='1';
				  aux2:='1';
				  aux3:='1';
				  outcoder <= "0111101"; -- d 
				  outcontc <= outcontc + '1';
				  outFlagc <= '1';
				 else
				  outFlagc <= '0'; 
				end if;
			  when others => null;
			end case;
		  when "10000" =>--incont
			aux0:='0';
			aux1:='0';
			aux2:='0';
			aux3:='0';
		  when others => null;
		end case; --incont
  when others => null; --enc	
 end case; --enc	
  end if;
  end process pcoder;
end coderram0;