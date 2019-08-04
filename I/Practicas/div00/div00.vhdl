library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity div00 is
	port
	(
		clkdiv:in std_logic;
		indiv: in std_logic_vector(4 downto 0);
		outdiv:inout std_logic
	);
end entity;

architecture div0 of div00 is
--signal sclk:std_logic;
signal sdiv:std_logic_vector(20 downto 0);
begin
	pdiv: process(clkdiv)
	begin
		if(clkdiv'event and clkdiv='1') then
			case indiv is
				when  "00000"=>
					if(sdiv>"100000000000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "00001"=>
					if(sdiv>"010000000000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "00011"=>
					if(sdiv>"001000000000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "00111"=>
					if(sdiv>"00010000000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "01111"=>
					if(sdiv>"0000100000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "11111"=>
					if(sdiv>"00000100000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "11110"=>
					if(sdiv>"00000001000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when  "11100"=>
					if(sdiv>"00000000010000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
				when others =>
					null;
			end case;
		end if;
	end process pdiv;
 
end architecture;