library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity barrelrotL00 is
  port(
       clkbarrelrotL: in std_logic;
	   inFlagbarrelrotL: in std_logic;
	   functbarrelrotL: in std_logic_vector(5 downto 0);
	   inRSbarrelrotL: in std_logic_vector(7 downto 0);
	   inRTbarrelrotL: in std_logic_vector(7 downto 0);
	   outRDbarrelrotL: out std_logic_vector(7 downto 0);
       outFlagbarrelrotL: out std_logic);
end barrelrotL00;

architecture barrelrotL0 of barrelrotL00 is

signal sshift: std_logic_vector(7 downto 0);
signal cont_saltos: std_logic_vector(7 downto 0);

begin
  pxora: process(clkbarrelrotL)
  variable aux: bit:='0';
  begin
    if (clkbarrelrotL'event and clkbarrelrotL= '1') then
	  if (functbarrelrotL = "100000") then
	    case inFlagbarrelrotL is
		  when '0' =>
		    outRDbarrelrotL <= (others => '0');
			
			sshift <= inRSbarrelrotL;
			cont_saltos<="00000000";
			outFlagbarrelrotL <= '0';
			aux:='0';
		  when '1' =>
			if(inRTbarrelrotL = cont_saltos) then
				outRDbarrelrotL <= sshift;
			else
				sshift(7) <= sshift(0);
				sshift(6 downto 0)<= sshift(7 downto 1);
				outRDbarrelrotL <= sshift;
			  
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
			outFlagbarrelrotL <= '1';
		  when others => null;
		end case;
	  else
	    outRDbarrelrotL <= (others => 'Z');
		outFlagbarrelrotL <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end barrelrotL0;