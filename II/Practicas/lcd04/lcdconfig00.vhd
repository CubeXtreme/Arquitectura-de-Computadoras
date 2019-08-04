library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdconfig00 is
  port(
       clkc: in std_logic;
	   resetc: in std_logic;
	   inFlagc: in std_logic;
	   incontc: in std_logic_vector(4 downto 0);
	   outWordc: out std_logic_vector(7 downto 0);
	   outFlagc: out std_logic;
	   RWc: out std_logic;
	   RSc: out std_logic;
       ENc: out std_logic);
end lcdconfig00;

architecture lcdconfig0 of lcdconfig00 is
begin
  pconfig: process(clkc, resetc, inFlagc)
  begin
    if (clkc'event and clkc = '1')then
	  case resetc is
	    when '0' =>
		  outWordc <= "00000001";
		  outFlagc <= '0';
		  RWc <= '0';
		  RSc <= '0';
		  ENc <= '1';
		when '1' =>
		  if (inFlagc = '1')then
		    case incontc is
			   when "00000" =>
			      outWordc <= "00111100";-- 0 0 1 D/L  N F X X:  FUNCTION SET
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "00010" =>
			      outWordc <= "00111100";-- 0 0 1 D/L  N F X X:  FUNCTION SET
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "00011" =>
			      outWordc <= "00111100";-- 0 0 1 D/L  N F X X:  FUNCTION SET
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "00100" =>
			      outWordc <= "00000001";-- CLEAR DISPLAY
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "00101" =>
			      outWordc <= "00000001";-- CLEAR DISPLAY
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "00110" =>
			      outWordc <= "00000011";-- RETURN TO HOME
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "00111" =>
			      outWordc <= "00000011";-- RETURN TO HOME
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "01000" =>
			      outWordc <= "00000110";--0 0 0 0 0 1 I/D S: ENTRY MODE SET
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "01001" =>
			      outWordc <= "00000110";--0 0 0 0 0 1 I/D S: ENTRY MODE SET
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "01010" =>
			      outWordc <= "00001111";--0 0 0 0 1 D C B: DISPLAY ON/OFF CONTROL
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "01011" =>
			      outWordc <= "00001111";--0 0 0 0 1 D C B: DISPLAY ON/OFF CONTROL
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "01100" =>
			      outWordc <= "00011100";--0 0 0 1 S/C  R/L X X: CURSOR OR DISPLAY SHIFT
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "01101" =>
			      outWordc <= "00011100";--0 0 0 1 S/C  R/L X X: CURSOR OR DISPLAY SHIFT
				  outFlagc <= '1';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
			   when "01110" =>
			      outWordc <= "11010100";-- 1 X X X X X X X: SET DDRAM ADDRESS
				  outFlagc <= '0';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '1';
			   when "01111" =>
			      outWordc <= "11010100";-- 1 X X X X X X X: SET DDRAM ADDRESS
				  outFlagc <= '1';
				  RWc <= '0';
				  RSc <= '0';
				  ENc <= '0';
              when others => null;
			end case;
		  end if;
		when others => null;
	  end case;
	end if;
  end process pconfig;
end lcdconfig0;