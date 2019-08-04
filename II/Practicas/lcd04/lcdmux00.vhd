library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
library machxo2;
use machxo2.all;

entity lcdmux00 is
  port(
       clkmlcd: in std_logic;
	   resetmlcd: in std_logic;
	   inFlagmconfig: in std_logic;
	   RWcm: in std_logic;
	   RScm: in std_logic;
	   ENcm: in std_logic;
	   RWdm: in std_logic;
	   RSdm: in std_logic;
	   ENdm: in std_logic;
	   inWordConfig: in std_logic_vector(7 downto 0);
	   inWordd: in std_logic_vector(7 downto 0);
	   RWm: out std_logic;
	   RSm: out std_logic;
	   ENm: out std_logic;
       outWordm: out std_logic_vector(7 downto 0));
end lcdmux00;

architecture lcdmux0 of lcdmux00 is
begin
  pm: process(clkmlcd, resetmlcd, inFlagmconfig)
  begin
    if (clkmlcd'event and clkmlcd = '1') then
	  case resetmlcd is
	    when '0' => 
		  outWordm <= "00111100";
		  RWm <= '0';
		  RSm <= '0';
		  ENm <= '0';
		when '1' =>
		  case inFlagmconfig is
		    when '0' =>
			  outWordm <= inWordconfig;
			  RWm <= RWcm;
			  RSm <= RScm;
			  ENm <= ENcm;
			when '1' =>
			  outWordm <= inWordd;
			  RWm <= RWdm;
			  RSm <= RSdm;
			  ENm <= ENdm;
			when others => null;
		  end case;
		when others => null;
	  end case;
	end if;
  end process pm;
end lcdmux0;