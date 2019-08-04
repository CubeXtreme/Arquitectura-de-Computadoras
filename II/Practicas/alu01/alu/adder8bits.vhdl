library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packageadder8bit00.all;

entity adder8bits is
  port(SLadder8bits: in std_logic;
	   inRSadder8bits: in std_logic_vector(7 downto 0);
	   inRTadder8bits: in std_logic_vector(7 downto 0);
	   outLED: out std_logic;
	   outRDadder8bits: out std_logic_vector(7 downto 0));
end adder8bits;

architecture adder8bits0 of adder8bits is

	signal SB, SC, SA: std_logic_vector(7 downto 0);
	signal SEN: std_logic;

begin
	  ---------------------------------------------------Inicio de sumador

  A00: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(0),
                      Yx => SB(0));
  
  A01: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(1),
                      Yx => SB(1));
  
  A02: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(2),
                      Yx => SB(2));
  
  A03: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(3),
                      Yx => SB(3));
					  
  A04: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(4),
                      Yx => SB(4));
  
  A05: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(5),
                      Yx => SB(5));
  
  A06: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(6),
                      Yx => SB(6));
  
  A07: xor00 port map(Ax => SLadder8bits,
                      Bx => inRTadder8bits(7),
                      Yx => SB(7));

  A08: fa00 port map(C00 => SLadder8bits,
                     A00 => inRSadder8bits(0),
					 B00 => SB(0),
					 C01 => SC(0),
                     S00 => SA(0));
  
  A09: fa00 port map(C00 => SC(0),
                     A00 => inRSadder8bits(1),
					 B00 => SB(1),
					 C01 => SC(1),
                     S00 => SA(1));
  
  A10: fa00 port map(C00 => SC(1),
                     A00 => inRSadder8bits(2),
					 B00 => SB(2),
					 C01 => SC(2),
                     S00 => SA(2));
  
  A11: fa00 port map(C00 => SC(2),
                     A00 => inRSadder8bits(3),
					 B00 => SB(3),
					 C01 => SC(3),
                     S00 => SA(3));
  
  A12: fa00 port map(C00 => SC(3),
                     A00 => inRSadder8bits(4),
					 B00 => SB(4),
					 C01 => SC(4),
                     S00 => SA(4));
  
  A13: fa00 port map(C00 => SC(4),
                     A00 => inRSadder8bits(5),
					 B00 => SB(5),
					 C01 => SC(5),
                     S00 => SA(5));
  
  A14: fa00 port map(C00 => SC(5),
                     A00 => inRSadder8bits(6),
					 B00 => SB(6),
					 C01 => SC(6),
                     S00 => SA(6));
  
  A15: fa00 port map(C00 => SC(6),
                     A00 => inRSadder8bits(7),
					 B00 => SB(7),
					 C01 => SC(7),
                     S00 => SA(7));

  A16: and00 port map(Aa => SEN,
                      Ba => SA(0),
                      Ya => outRDadder8bits(0));
  
  A17: and00 port map(Aa => SEN,
                      Ba => SA(1),
                      Ya => outRDadder8bits(1));
  
  A18: and00 port map(Aa => SEN,
                      Ba => SA(2),
                      Ya => outRDadder8bits(2));
  
  A19: and00 port map(Aa => SEN,
                      Ba => SA(3),
                      Ya => outRDadder8bits(3));

  A20: and00 port map(Aa => SEN,
                      Ba => SA(4),
                      Ya => outRDadder8bits(4));
  
  A21: and00 port map(Aa => SEN,
                      Ba => SA(5),
                      Ya => outRDadder8bits(5));
  
  A22: and00 port map(Aa => SEN,
                      Ba => SA(6),
                      Ya => outRDadder8bits(6));
 
  A23: and00 port map(Aa => SEN,
                      Ba => SA(7),
                      Ya => outRDadder8bits(7));
  
  A24: xnor00 port map(Axn => SC(6),
                       Bxn => SC(7),
                       Yxn => SEN);
  
  A25: xor00 port map(Ax => SC(6),
                      Bx => SC(7),
                      Yx => outLED);
end adder8bits0;
