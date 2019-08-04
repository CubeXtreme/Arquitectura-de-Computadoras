library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use packageadder00.all;
use packagefa00.all;
use ha00.all;

entity topadder00 is
	port(
	SL: in std_logic ;
	Ai: in std_logic_vector ( 7 downto 0 );
	Bi: in std_logic_vector ( 7 downto 0 );
	LED: out std_logic ;
	So: out std_logic_vector ( 7 downto 0 ) );
end;

architecture topadder0 of topadder00 is
signal SB, CS, SA: std_logic_vector(7 downto 0);
signal SYnx: std_logic;
begin
	UA00: xor00 port map(Ax => SL,
	Bx => Bi(0),
	Yx => SB(0));
	
	UA01: xor00 port map(Ax => SL,
	Bx => Bi(1),
	Yx => SB(1));
	
	UA02: xor00 port map(Ax => SL,
	Bx => Bi(2),
	Yx => SB(2));
	
	UA03: xor00 port map(Ax => SL,
	Bx => Bi(3),
	Yx => SB(3));
	
	UA04: xor00 port map(Ax => SL,
	Bx => Bi(4),
	Yx => SB(4));
	
	UA05: xor00 port map(Ax => SL,
	Bx => Bi(5),
	Yx => SB(5));
	
	UA06: xor00 port map(Ax => SL,
	Bx => Bi(6),
	Yx => SB(6));
	
	UA07: xor00 port map(Ax => SL,
	Bx => Bi(7),
	Yx => SB(7));
	
	UA08: topfa00 port map(C00 => SL,
	A00 => Ai(0),
	B00 => SB(0),
	C01 => CS(0),
	S00 => SA(0));
	
	UA09: topfa00 port map(C00 => CS(0),
	A00 => Ai(1),
	B00 => SB(1),
	C01 => CS(1),
	S00 => SA(1));
	
	UA10: topfa00 port map(C00 => CS(1),
	A00 => Ai(2),
	B00 => SB(2),
	C01 => CS(2),
	S00 => SA(2));
	
	UA11: topfa00 port map(C00 => CS(2),
	A00 => Ai(3),
	B00 => SB(3),
	C01 => CS(3),
	S00 => SA(3));
	
	UA12: topfa00 port map(C00 => CS(3),
	A00 => Ai(4),
	B00 => SB(4),
	C01 => CS(4),
	S00 => SA(4));
	
	UA13: topfa00 port map(C00 => CS(4),
	A00 => Ai(5),
	B00 => SB(5),
	C01 => CS(5),
	S00 => SA(5));
	
	UA14: topfa00 port map(C00 => CS(5),
	A00 => Ai(6),
	B00 => SB(6),
	C01 => CS(6),
	S00 => SA(6));
	
	UA15: topfa00 port map(C00 => CS(6),
	A00 => Ai(7),
	B00 => SB(7),
	C01 => CS(7),
	S00 => SA(7));
	
	UA16: and00 port map(Ba => SA(0),
	Aa => SYnx,
	Ya => So(0));
	
	UA17: and00 port map(Ba => SA(1),
	Aa => SYnx,
	Ya => So(1));
	
	UA18: and00 port map(Ba => SA(2),
	Aa => SYnx,
	Ya => So(2));
	
	UA19: and00 port map(Ba => SA(3),
	Aa => SYnx,
	Ya => So(3));
	
	UA20: and00 port map(Ba => SA(4),
	Aa => SYnx,
	Ya => So(4));
	
	UA21: and00 port map(Ba => SA(5),
	Aa => SYnx,
	Ya => So(5));
	
	UA22: and00 port map(Ba => SA(6),
	Aa => SYnx,
	Ya => So(6));
	
	UA23: and00 port map(Ba => SA(7),
	Aa => SYnx,
	Ya => So(7));
	
	UA24: nxor00 port map(Anx => CS(7),
	Bnx => CS(6),
	Ynx => SYnx);
	
	UA25: xor00 port map(Bx => CS(7),
	Ax => CS(6),
	Yx => LED);
end topadder0;