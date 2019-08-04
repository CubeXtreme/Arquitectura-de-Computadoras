library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity uc00 is
  port(clkuc: in std_logic;
       RSTuc: in std_logic;
	   ENuc: in std_logic;
	   inFlagIteruc: in std_logic;
	   inFlagIterBuc: in std_logic;
	   inFlagAC12uc: in std_logic;
	   inFlagAC8uc: in std_logic;
	   inFlagCodeuc: in std_logic;
	   F1F2F3uc: out std_logic_vector(2 downto 0));
end uc00;

architecture uc0 of uc00 is
signal scontroluc: std_logic_vector(6 downto 0);
begin
scontroluc <= (RSTuc)&(ENuc)&(inFlagIteruc)&(inFlagAC12uc)&(inFlagAC8uc)&(inFlagCodeuc)&(inFlagIterBuc);

with scontroluc select
  F1F2F3uc <= "000" when "0000000",
	          "000" when "0100000",
			  "000" when "1100000",
              "011" when "1100001",
              "110" when "1100011",
			  "100" when "1101101",
			  "100" when "1100101",
              "100" when "1101001",
              "101" when "1000101",
			  "101" when "1001001",
			  "101" when "1000111",
			  "101" when "1001011",
              "001" when "1111001",
			  "100" when "1110001",
			  "100" when others;
end uc0;