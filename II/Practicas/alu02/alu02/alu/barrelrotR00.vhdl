library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity barrelrotR00 is
  port(
       clkbarrelrotR: in std_logic;
	   inFlagbarrelrotR: in std_logic;
	   functbarrelrotR: in std_logic_vector(5 downto 0);
	   inRSbarrelrotR: in std_logic_vector(7 downto 0);
	   inRTbarrelrotR: in std_logic_vector(7 downto 0);
	   outRDbarrelrotR: out std_logic_vector(7 downto 0);
       outFlagbarrelrotR: out std_logic);
end barrelrotR00;

architecture barrelrotR0 of barrelrotR00 is

signal sshift: std_logic_vector(7 downto 0);
signal cont_saltos: std_logic_vector(7 downto 0);

begin
  pxora: process(clkbarrelrotR)
  variable aux: bit:='0';
  begin
    if (clkbarrelrotR'event and clkbarrelrotR= '1') then
	  if (functbarrelrotR = "100001") then
	    case inFlagbarrelrotR is
		  when '0' =>
		    outRDbarrelrotR <= (others => '0');
			
			sshift <= inRSbarrelrotR;
			cont_saltos<="00000000";
			outFlagbarrelrotR <= '0';
			aux:='0';
		  when '1' =>
			if(inRTbarrelrotR = cont_saltos) then
				outRDbarrelrotR <= sshift;
			else
				sshift(0) <= sshift(7);
				sshift(7 downto 1)<= sshift(6 downto 0);
				outRDbarrelrotR <= sshift;
			  
				case cont_saltos is
					when "00000000" =>
						cont_saltos <= "00000001";
					when "00000001" =>
						cont_saltos <= "00000010";
					when "00000010" =>
						cont_saltos <= "00000011";
					when "00000011"=> 
						cont_saltos <= "00000100";
					when "00000100"=> 
						cont_saltos <= "00000101";
					when "00000101"=> 
						cont_saltos <= "00000110";
					when "00000110"=> 
						cont_saltos <= "00000111";
					when "00000111"=> 
						cont_saltos <= "00000000";
					when others => null;
				end case;
			end if;
			outFlagbarrelrotR <= '1';
		  when others => null;
		end case;
	  else
	    outRDbarrelrotR <= (others => 'Z');
		outFlagbarrelrotR <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end barrelrotR0;