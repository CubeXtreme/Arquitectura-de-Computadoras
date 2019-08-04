library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

 

entity coder00 is 
port(
	clkc: in std_logic;
	enc: in std_logic;
	rwc: in std_logic;
	outflagc: out std_logic;
	inkeyc: in std_logic_vector(3 downto 0);
	incontc: in std_logic_vector(3 downto 0);
	outcontc: inout std_logic_vector(4 downto 0); --***********
	outcoderc: out std_logic_vector(6 downto 0);
	flagDecCont: in std_logic
	);

end coder00;

architecture coder0 of coder00 is 
	signal scontr: std_logic_vector(1 downto 0);
begin  

scontr <= (enc)&(rwc);
	pcoder: process(clkc)
	variable aux: bit:='0';
	variable dec: bit:='0';
	begin  
	
		if (clkc'event and clkc='1') then   
		
			case scontr is
				when "00"=>
					outcontc <= "00000";
					outcoderc <="1111111";
				when "01"=>
					outcontc <= "00000";
					outcoderc <="1111111";
				when "10" =>
				
					--if(dec='1') then
						--dec := '0';
						--outcontc <= outcontc - '1'; 						
					--end if;
									
					case incontc is --- intcont is not declared
		--------------------------------------------------------------------------
				when "1000" =>--intcont
					case inkeyc is
						when "0000" =>
							aux:='0';
							outcontc <= outcontc;
						when "0001" =>
						
							if(aux='0') then
							aux:='1';
							outcoderc <= "1110111"; --A
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;

							outflagc <= '1'; -- dato está listo para ser leído.
							
							end if;
							
						
						when "0010" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "0011111"; --b
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;

							outflagc <= '1'; 
							end if;
						when "0100" =>
							if(aux='0') then
							aux:='1';
						outcoderc <= "1001110";--C
						if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
						outflagc <= '1'; 
							end if;
						when "1000" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "0111101";--d
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when others => null;
					end case;
-----------------------------------------------------------------				
				when "0100" => --intcont
				case inkeyc is
						when "0000" =>
							aux:='0';
							outcontc <= outcontc;
						when "0001" =>
						
							if(aux='0') then
							aux:='1';
							outcoderc <= "1111001";--3
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
							
						
						when "0010" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1011111";--6
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "0100" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1111011";--9
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "1000" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "0110111";--#
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when others => null;
					end case;
--------------------------------------------------------
				when "0010" =>
				case inkeyc is
						when "0000" =>
							aux:='0';
							outcontc <= outcontc;
						when "0001" =>
						
							if(aux='0') then
							aux:='1';
							outcoderc <= "1101101";--2
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
							
						
						when "0010" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1011011";--5
						if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "0100" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1111111";--8
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "1000" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1111110";--0
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when others => null;
					end case;
-------------------------------------------------------					
				when "0001" =>
				case inkeyc is
						when "0000" =>
							aux:='0';
							outcontc <= outcontc;
						when "0001" =>
						
							if(aux='0') then
							aux:='1';
							outcoderc <= "0110000";--1
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
							
						
						when "0010" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "0110011";--4
						if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "0100" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "1110000";--7
							if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when "1000" =>
							if(aux='0') then
							aux:='1';
							outcoderc <= "0110001";--*
						if(dec='1') then
								dec := '0';
								outcontc <= outcontc; 						
							else							
								outcontc <= outcontc + '1';
							end if;
							outflagc <= '1'; 
							end if;
						when others => null;
					end case;
		-----------------------------------------------------------------------
						when others => null; --intcont
						
					end case; --incont
					
				when "11" =>
				if(flagDecCont='1') then
					outcoderc<= not("1111111");
					outflagc <= '1'; --outcontc <= outcontc - '1';
					outcontc <= outcontc - '1';--outflagc <= '1';
					dec:='1';
				end if;
				
				when others => null;
				
			 end case; --scontr	
			
		end if;--clk (condición de flanco)
	end process pcoder;	
end coder0;