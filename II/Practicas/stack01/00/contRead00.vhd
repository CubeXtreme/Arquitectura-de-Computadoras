library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library lattice;
use lattice.all;

entity contRead00 is
	port(
			clkrd : in std_logic;
			enrd,rwrd : in std_logic;
			indirWrd: inout std_logic_vector (4 downto 0);
			outcontrd: inout std_logic_vector (4 downto 0);
			decContWrd: out std_logic
			);
			
end contRead00;

architecture contRead0 of contRead00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
scontrol <= (enrd)&(rwrd);
 pcontRead: process(clkrd)
	begin
	  if(clkrd'event and clkrd = '1') then 
	    case scontrol is
		   when "00" =>
				outcontrd <=indirWrd;--"00000";
				decContWrd <='0';
		   when "01" =>
				outcontrd <=indirWrd;--"00000";
				decContWrd <='0';
				
		   when "10" =>
				outcontrd <= indirWrd;--"00000"; --indirWrd;--
				decContWrd <='0';
		   when "11" =>
				if(outcontrd > "00000")then
					
					outcontrd <= outcontrd - '1';
					decContWrd <='1';
					
					
				else
					outcontrd <= outcontrd;
					decContWrd <='0';
				end if;
			when others => null;
		  end case;
		end if;
	end process pcontRead;
	
end contRead0;
