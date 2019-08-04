library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageadder_and_mult.all;

entity adder8bits00 is
  port(
       clkadder8bits: in std_logic;
	   SL: in std_logic;----Adder8bit
	   LED: out std_logic;----Adder8bit
	   So: out std_logic_vector(7 downto 0);----Adder8bit
	   inFlagadder8bits: in std_logic;
	   functadder8bits: in std_logic_vector(5 downto 0);
	   inRSadder8bits: in std_logic_vector(7 downto 0);
	   inRTadder8bits: in std_logic_vector(7 downto 0);
	   outRDadder8bits: out std_logic_vector(7 downto 0);
       outFlagadder8bits: out std_logic);
end adder8bits00;

architecture adder8bits0 of adder8bits00 is
begin
  padder8bits: process(clkadder8bits)
  variable aux: bit:='0';
  begin
    if (clkadder8bits'event and clkadder8bits = '1') then
	  if (functadder8bits = "010000") then
	    case inFlagadder8bits is
		  when '0' =>
		    outRDadder8bits <= (others => '0');
			outFlagadder8bits <= '0';
			aux:='0';
		  when '1' =>
		    if (aux = '0') then
			  aux:='1';
			  
			  outRDadder8bits <= inRSadder8bits xor inRTadder8bits;
			  outFlagadder8bits <= '1';
			end if;
		  when others => null;
		end case;
	  else
	    outRDadder8bits <= (others => 'Z');
		outFlagadder8bits <= 'Z';
		aux:='0';
	  end if;-- end if de Functo
	end if;-- end if flanco
  end process padder8bits;
  ------------------------------------------------
end adder8bits0;
