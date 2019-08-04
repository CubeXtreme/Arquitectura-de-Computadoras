library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity sust00 is
  port(
       clksu: in std_logic;
	   opcodesu: in std_logic_vector(3 downto 0);
	   inAC8su: in std_logic_vector(7 downto 0);
	   inAC12su: in std_logic_vector(11 downto 0);
	   inFlagsu: in std_logic;
	   outAC12su: out std_logic_vector(11 downto 0);
	   outLED12su: out std_logic_vector(11 downto 0);
	   outFlagAC12su: out std_logic;
       outFlagItersu: out std_logic);
end sust00;

architecture sust0 of sust00 is
begin
  psust: process(clksu, inFlagsu, opcodesu, inAC8su, inAC12su)
  variable aux: bit:='0';
  begin
    if (clksu'event and clksu = '1') then
	  if (opcodesu = "0010")then
	    case inFlagsu is
		  when '1' =>
		    if (aux = '0') then
			  aux:='1';
			  outAC12su <= (inAC12su(11 downto 1))&(inAC8su(7));
			  outLED12su <= (inAC12su(11 downto 1))&(inAC8su(7));
			  outFlagAC12su <= '1';
			  outFlagItersu <= '1';
			else
			  outFlagAC12su <= '0';
			  outFlagItersu <= '0';
			end if;
		  when '0' =>
			outFlagAC12su <= '0';
			outFlagItersu <= '0';
		  when others => null;
		end case;
	  else-- opcode
	    outAC12su <= (others => 'Z');
		outFlagAC12su <= 'Z';
		outFlagItersu <= '0';
		aux:='0';
	  end if;
	end if;--clksi
  end process psust;
end sust0;