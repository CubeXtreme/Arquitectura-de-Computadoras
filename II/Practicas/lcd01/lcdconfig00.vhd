library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdconfig00 is
	port(
		clkc: in std_logic;
		resetc: in std_logic;
		inFlagc: in std_logic;
		incontc: in std_logic_vector(4 downto 0);
		comandoc: out std_logic_vector(7 downto 0);
		outFlagc: out std_logic;
		RWc: out std_logic;
		RSc: out std_logic;
		ENc: out std_logic
	);
end lcdconfig00;

architecture lcdconfig0 of lcdconfig00 is
begin
	pconfig: process(clkc, inFlagc)
	begin
		if(clkc'event and clkc = '1') then
			case resetc is
				when '0' =>
					comandoc <= (others => '0');
					outFlagc <= '0';
				when '1' =>
					case incontc is 
						when "00000" => 
							if(inFlagc = '1') then 
								comandoc <= "00111100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "00001" =>
							if(inFlagc = '1') then 
								comandoc <= "00111100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "00010" =>
							if(inFlagc = '1') then 
								comandoc <= "00000001";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "00011" =>
							if(inFlagc = '1') then 
								comandoc <= "00000001";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "00100" =>
							if(inFlagc = '1') then 
								comandoc <= "00000010";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "00101" =>
							if(inFlagc = '1') then 
								comandoc <= "00000010";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "00110" =>
							if(inFlagc = '1') then 
								comandoc <= "00000110";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "00111" =>
							if(inFlagc = '1') then 
								comandoc <= "00000110";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "01000" =>
							if(inFlagc = '1') then 
								comandoc <= "00001111";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "01001" =>
							if(inFlagc = '1') then 
								comandoc <= "00001111";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "01010" =>
							if(inFlagc = '1') then 
								comandoc <= "00011100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "01011" =>
							if(inFlagc = '1') then 
								comandoc <= "00011100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
							
						when "01100" =>
							if(inFlagc = '1') then 
								comandoc <= "00111100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
										
						when "01101" =>
							if(inFlagc = '1') then 
								comandoc <= "00111100";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						when "01110" =>
							if(inFlagc = '1') then 
								comandoc <= "10000000";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '1';
							end if;
						when "01111" =>
							if(inFlagc = '1') then 
								comandoc <= "10000000";
								outFlagc <= '0';
								RWc <= '0';
								RSc <= '0';
								ENc <= '0';
							end if;
						--nuevo	
						when "10000" =>
						if (inFlagc = '1') then
							comandoc <= "10000000";
							outFlagc <= '0';
							RWc <= '0';
							RSc <= '0';
							ENc <= '1';
						end if ;
						when "10001" =>
						if (inFlagc = '1') then
							comandoc <= "10000000";
							outFlagc <= '1';
							RWc <= '0';
							RSc <= '0';
							ENc <= '0';
						end if ;
						--nuevo	
				-------------------------------------
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pconfig;
end lcdconfig0;
