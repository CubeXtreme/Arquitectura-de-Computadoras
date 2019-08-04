library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagemult4bit00.all;

entity mult4bit00 is
	port(
		Am:in std_logic_vector(3 downto 0);
		Bm:in std_logic_vector(3 downto 0);
		Rm:out std_logic_vector(7 downto 0)
	);
end entity;

architecture mult4bit0 of mult4bit00 is
signal s0,s2,s5,s8: std_logic_vector(2 downto 0);
signal s1,s3,s4,s6,s7: std_logic_vector(3 downto 0);
begin
	MU00:and00 port map
	(
		Aa=>Am(0),
		Ba=>Bm(0),
		Ya=>Rm(0)
	);
	MU01:and00 port map
	(
		Aa=>Am(1),
		Ba=>Bm(0),
		Ya=>s0(0)
	);
	MU02:and00 port map
	(
		Aa=>Am(2),
		Ba=>Bm(0),
		Ya=>s0(1)
	);
	
	
	MU03:and00 port map
	(
		Aa=>Am(3),
		Ba=>Bm(0),
		Ya=>s0(2)
	);
	
	
	
	
	MU04:and00 port map
	(
		Aa=>Am(0),
		Ba=>Bm(1),
		Ya=>s1(0)
	);
	MU005:and00 port map
	(
		Aa=>Am(1),
		Ba=>Bm(1),
		Ya=>s1(1)
	);
	MU06:and00 port map
	(
		Aa=>Am(2),
		Ba=>Bm(1),
		Ya=>s1(2)
	);
	MU07:and00 port map
	(
		Aa=>Am(3),
		Ba=>Bm(1),
		Ya=>s1(3)
	);
	
	
	
	
	
	MU08:fa00 port map
	(
		C00=>'0',
		A00=>s0(0),
		B00=>s1(0),
		C01=>s2(0),
		S00=>Rm(1)
		
	);
	MU09:fa00 port map
	(
		C00=>s2(0),
		A00=>s0(1),
		B00=>s1(1),
		C01=>s2(1),
		S00=>s3(0)
	);
	MU010:fa00 port map
	(
		C00=>s2(1),
		A00=>s0(2),
		B00=>s1(2),
		C01=>s2(2),
		S00=>s3(1)
	);
	MU11:fa00 port map
	(
		C00=>s2(2),
		A00=>'0',
		B00=>s1(3),
		C01=>s3(3),
		S00=>s3(2)
	);
	
	
	
	
	
	
	MU12:and00 port map
	(
		Aa=>Am(0),
		Ba=>Bm(2),
		Ya=>s4(0)
	);
	MU13:and00 port map
	(
		Aa=>Am(1),
		Ba=>Bm(2),
		Ya=>s4(1)
	);
	MU14:and00 port map
	(
		Aa=>Am(2),
		Ba=>Bm(2),
		Ya=>s4(2)
	);
	MU15:and00 port map
	(
		Aa=>Am(3),
		Ba=>Bm(2),
		Ya=>s4(3)
	);
	
	
	
	
	MU16:fa00 port map
	(
		C00=>'0',
		A00=>s3(0),
		B00=>s4(0),
		C01=>s5(0),
		S00=>Rm(2)
		
	);
	MU17:fa00 port map
	(
		C00=>s5(0),
		A00=>s3(1),
		B00=>s4(1),
		C01=>s5(1),
		S00=>s6(0)
	);
	MU18:fa00 port map
	(
		C00=>s5(1),
		A00=>s3(2),
		B00=>s4(2),
		C01=>s5(2),
		S00=>s6(1)
	);
	MU19:fa00 port map
	(
		C00=>s5(2),
		A00=>s3(3),
		B00=>s4(3),
		C01=>s6(3),
		S00=>s6(2)
	);
	
	
	
	MU20:and00 port map
	(
		Aa=>Am(0),
		Ba=>Bm(3),
		Ya=>s7(0)
	);
	MU21:and00 port map
	(
		Aa=>Am(1),
		Ba=>Bm(3),
		Ya=>s7(1)
	);
	MU22:and00 port map
	(
		Aa=>Am(2),
		Ba=>Bm(3),
		Ya=>s7(2)
	);
	MU23:and00 port map
	(
		Aa=>Am(3),
		Ba=>Bm(3),
		Ya=>s7(3)
	);
	
	
	
	
	MU24:fa00 port map
	(
		C00=>'0',
		A00=>s6(0),
		B00=>s7(0),
		C01=>s8(0),
		S00=>Rm(3)
	);
	MU25:fa00 port map
	(
		C00=>s8(0),
		A00=>s6(1),
		B00=>s7(1),
		C01=>s8(1),
		S00=>Rm(4)
	);
	MU26:fa00 port map
	(
		C00=>s8(1),
		A00=>s6(2),
		B00=>s7(2),
		C01=>s8(2),
		S00=>Rm(5)
	);
	MU27:fa00 port map
	(
		C00=>s8(2),
		A00=>s6(3),
		B00=>s7(3),
		C01=>Rm(7),
		S00=>Rm(6)
	);
end architecture;