library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity barrelshiftL00 is
  port(
       clkbarrelshiftL: in std_logic;
	   inFlagbarrelshiftL: in std_logic;
	   functbarrelshiftL: in std_logic_vector(5 downto 0);
	   inRSbarrelshiftL: in std_logic_vector(7 downto 0);
	   inRTbarrelshiftL: in std_logic_vector(7 downto 0);
	   outRDbarrelshiftL: out std_logic_vector(7 downto 0);
       outFlagbarrelshiftL: out std_logic);
end barrelshiftL00;

architecture barrelshiftL0 of barrelshiftL00 is

signal sshift: std_logic_vector(7 downto 0);
signal cont_saltos: std_logic_vector(7 downto 0);

begin
  pxora: process(clkbarrelshiftL)
  variable aux: bit:='0';
  begin
    if (clkbarrelshiftL'event and clkbarrelshiftL= '1') then
	  if (functbarrelshiftL = "001110") then
	    case inFlagbarrelshiftL is
		  when '0' =>
		    outRDbarrelshiftL <= (others => '0');
			
			sshift <= inRSbarrelshiftL;
			cont_saltos<="00000000";
			outFlagbarrelshiftL <= '0';
			aux:='0';
		  when '1' =>
			if(inRTbarrelshiftL = cont_saltos) then
				outRDbarrelshiftL <= sshift;
			else
				sshift(7) <= '0';
				sshift(6 downto 0)<= sshift(7 downto 1);
				outRDbarrelshiftL <= sshift;
			  
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
			outFlagbarrelshiftL <= '1';
		  when others => null;
		end case;
	  else
	    outRDbarrelshiftL <= (others => 'Z');
		outFlagbarrelshiftL <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process pxora;
  ------------------------------------------------
end barrelshiftL0;