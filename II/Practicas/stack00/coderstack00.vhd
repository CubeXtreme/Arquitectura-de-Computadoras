library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coderstack00 is
  port(
       clkr: in std_logic;
	   enr: in std_logic;
	   inkeyr: in std_logic_vector(3 downto 0);
	   incontr: in std_logic_vector(3 downto 0);
	   outcoderr: out std_logic_vector(6 downto 0);
	   outcontr: inout std_logic_vector(4 downto 0);
       outFlagr: out std_logic);
end coderstack00;

architecture coderstack0 of coderstack00 is
begin
  pcoder: process(clkr)
  variable aux0: bit:='0';
  variable aux1: bit:='0';
  variable aux2: bit:='0';
  variable aux3: bit:='0';
  begin
    if (clkr'event and clkr = '1') then
	  case enr is
	    when '0' =>
		  outcoderr <= (others => '1');
		  outcontr <= "11111";
		  outFlagr <= '0';
		when '1' =>
		  case incontr is
		    when "1000" =>--incontr
			  case inkeyr is
			    when "0000" =>
				  aux0:='0';
                  outcontr <= outcontr;
				  outFlagr <= '0';
				when "0001" =>
				  if (aux0 = '0') then
				    aux0:='1';
					outcoderr <= "1110111";--A
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0010" =>
				  if (aux0 = '0') then
				    aux0:='1';
					outcoderr <= "0011111";--b
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0100" =>
				  if (aux0 = '0') then
				    aux0:='1';
					outcoderr <= "1001110";--C
					outcontr <= outcontr + '1';
					outFlagr <= '1'; 
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "1000" =>
				  if (aux0 = '0') then
				    aux0:='1';
					outcoderr <= "0111101";--d
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when others => null;
			  end case;
			when "0100" =>
			  case inkeyr is
			    when "0000" =>
				  aux1:='0';
				  outcontr <= outcontr;
				  outFlagr <= '0';
				when "0001" =>
				  if (aux1 = '0') then
				    aux1:='1';
					outcoderr <= "1111001";--3
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
					outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0010" =>
				  if (aux1 = '0') then
				    aux1:='1';
					outcoderr <= "1011111";--6
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
					outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0100" =>
				  if (aux1 = '0') then
				    aux1:='1';
					outcoderr <= "1111011";--9
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
					outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "1000" =>
				  if (aux1 = '0') then
				    aux1:='1';
					outcoderr <= "0110111";--#
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
					outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when others => null;
			  end case;
--******
			when "0010" =>
			  case inkeyr is
			    when "0000" =>
				  aux2:='0';
				  outcontr <= outcontr;
				  outFlagr <= '0';
				when "0001" =>
				  if (aux2 = '0') then
				    aux2:='1';
					outcoderr <= "1101101";--2
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0010" =>
				  if (aux2 = '0') then
				    aux2:='1';
					outcoderr <= "1011011";--5
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0100" =>
				  if (aux2 = '0') then
				    aux2:='1';
					outcoderr <= "1111111";--8
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "1000" =>
				  if (aux2 = '0') then
				    aux2:='1';
					outcoderr <= "1111110";--0
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when others => null;
			  end case;
			when "0001" =>
			  case inkeyr is
			    when "0000" =>
				  aux3:='0';
				  outcontr <= outcontr;
				  outFlagr <= '0';
				when "0001" =>
				  if (aux3 = '0') then
				    aux3:='1';
					outcoderr <= "0110000";--1
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0010" =>
				  if (aux3 = '0') then
				    aux3:='1';
					outcoderr <= "0110011";--4
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "0100" =>
				  if (aux3 = '0') then
				    aux3:='1';
					outcoderr <= "1110000";--7
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when "1000" =>
				  if (aux3 = '0') then
				    aux3:='1';
					outcoderr <= "0110001";--*
					outcontr <= outcontr + '1';
					outFlagr <= '1';
				  else
				    outcontr <= outcontr;
					outFlagr <= '0';
				  end if;
				when others => null;
			  end case;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;--clk
  end process pcoder;
end coderstack0;