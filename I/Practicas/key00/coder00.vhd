library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
  port(
       clkc: in std_logic;
	   enc: in std_logic;
	   inkeyc: in std_logic_vector(3 downto 0);
	   incontc: in std_logic_vector(3 downto 0);
       outcoderc: out std_logic_vector(6 downto 0));
end coder00;

architecture coder0 of coder00 is
begin
  pcoder: process(clkc)
  variable aux0: bit:='0';
  begin
  if (clkc'event and clkc = '1') then
    case enc is
	  when '0' =>
	    outcoderc <= (others => '1');
	  when '1' =>
	     case incontc is
		   when "1000" =>--incontc
		     case inkeyc is
			   when "0000" =>
			     aux0:='0';
			   when "0001" =>
			     if (aux0 = '0' ) then
				   aux0:='1';
				   outcoderc <= "0110000";--1
				 end if;
			   when "0010" =>
			     if (aux0 = '0' ) then
				   aux0:='1';
				   outcoderc <= "1101101";--2 1101101
				 end if;
			   when "0100" =>
			     if (aux0 = '0' ) then
				   aux0:='1';
				   outcoderc <= "1111001";--3 1111001
				 end if;
			   when "1000" =>
			     if (aux0 = '0' ) then
				   aux0:='1';
				   outcoderc <= "1110111";--A 1110111
				 end if;
			   when others => null;
			 end case;
		   when "0100" =>--incontc
		     case inkeyc is
			   when "0000" =>
			     aux0:='0';
			   when "0001" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "0110011";--4 0110011
				 end if;
			   when "0010" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1011011";--5 1011011
				 end if;
			   when "0100" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1011111";--6 1011111
				 end if;
			   when "1000" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "0011111";--b 0011111
				 end if;
			   when others => null;
			 end case; 
		   when "0010" =>--incontc
		     case inkeyc is
			   when "0000" =>
                  aux0:= '0';
			   when "0001" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1110000";--7 1110000
				 end if;
			   when "0010" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1111111";--8 1111111
				 end if;
			   when "0100" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1111011";--9 1111011
				 end if;
			   when "1000" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1001110";--C 1001110
				 end if;
			   when others => null;
			 end case;
		   when "0001" =>--incontc
		     case inkeyc is
			   when "0000" =>
                 aux0:='0';
			   when "0001" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1111110";--0 1111110
				 end if;
			   when "0010" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "1100011";--* 1100011
				 end if;
			   when "0100" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "0011101";--+ 0011101
				 end if;
			   when "1000" =>
			     if (aux0 = '0') then
				   aux0:= '1';
				   outcoderc <= "0000001";--- 0000001
				 end if;
			   when others => null;
			 end case;
		   when others => null;
		 end case;
	  when others => null;
	end case;
  end if;
  end process pcoder;
end coder0;