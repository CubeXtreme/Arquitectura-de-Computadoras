library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity barrelshiftR00 is
  port(
       clkbarrelshiftR: in std_logic;
	   inFlagbarrelshiftR: in std_logic;
	   functbarrelshiftR: in std_logic_vector(5 downto 0);
	   inRSbarrelshiftR: in std_logic_vector(7 downto 0);
	   inRTbarrelshiftR: in std_logic_vector(7 downto 0);
	   outRDbarrelshiftR: out std_logic_vector(7 downto 0);
       outFlagbarrelshiftR: out std_logic);
end barrelshiftR00;

architecture barrelshiftR0 of barrelshiftR00 is

signal sshift: std_logic_vector(7 downto 0);
signal cont_saltos: std_logic_vector(7 downto 0);

begin
  pxora: process(clkbarrelshiftR)
  variable aux: bit:='0';
  begin
    if (clkbarrelshiftR'event and clkbarrelshiftR= '1') then
	  if (functbarrelshiftR = "001111") then
	    case inFlagbarrelshiftR is
		  when '0' =>
		    outRDbarrelshiftR <= (others => '0');
			
			sshift <= inRSbarrelshiftR;
			cont_saltos<="00000000";
			outFlagbarrelshiftR <= '0';
			aux:='0';
		  when '1' =>
			if(inRTbarrelshiftR = cont_saltos) then
				outRDbarrelshiftR <= sshift;
			else
				sshift(0) <= '0';
				sshift(7 downto 1) <= sshift (6 downto 0);
				outRDbarrelshiftR <= sshift;
			  
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
			outFlagbarrelshiftR <= '1';
		  when others => null;
		end case;
	  else
	    outRDbarrelshiftR <= (others => 'Z');
		outFlagbarrelshiftR <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end barrelshiftR0;