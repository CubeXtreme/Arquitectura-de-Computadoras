library ieee;
use ieee.std_logic_1164.all;
library lattice ;
use lattice.all;
use packagemult8bit00.all; 


entity mult4bit00 is
	port(
		 Am :in std_logic_vector (7 downto 0);
		 Bm :in std_logic_vector (7 downto 0);
		 Rm :out std_logic_vector (15 downto 0)
		 );
end entity;

architecture mult4bit0 of mult4bit00 is
signal sa00,ss00,ss02,ss03,ss04,ss05: std_logic_vector(6 downto 0);
signal sa01,sc00,sa02,sc01,ss01,sa03,sc02,sa04,sc03,sa05,sa06,sa07,sc04,sc05,sc06: std_logic_vector(7 downto 0);
begin


MU00: and00 port map(
		Aa => Am(0),
		Ba => Bm(0),
		Ya => Rm(0)
);
MU01: and00 port map(
		Aa => Am(1),
		Ba => Bm(0),
		Ya => sa00(0)
);


MU02: and00 port map(
		Aa => Am(2),
		Ba => Bm(0),
		Ya => sa00(1)
);
MU03: and00 port map(
		Aa => Am(3),
		Ba => Bm(0),
		Ya => sa00(2)
);
MU04: and00 port map(
		Aa => Am(4),
		Ba => Bm(0),
		Ya => sa00(3)
);
MU05: and00 port map(
		Aa => Am(5),
		Ba => Bm(0),
		Ya => sa00(4)
);
MU06: and00 port map(
		Aa => Am(6),
		Ba => Bm(0),
		Ya => sa00(5)
);
MU07: and00 port map(
		Aa => Am(7),
		Ba => Bm(0),
		Ya => sa00(6)
);




MU008: and00 port map(
		Aa => Am(0),
		Ba => Bm(1),
		Ya => sa01(0)
);
MU009: and00 port map(
		Aa => Am(1),
		Ba => Bm(1),
		Ya => sa01(1)
);
MU010: and00 port map(
		Aa => Am(2),
		Ba => Bm(1),
		Ya => sa01(2)
);
MU011: and00 port map(
		Aa => Am(3),
		Ba => Bm(1),
		Ya => sa01(3)
);
MU012: and00 port map(
		Aa => Am(4),
		Ba => Bm(1),
		Ya => sa01(4)
);
MU013: and00 port map(
		Aa => Am(5),
		Ba => Bm(1),
		Ya => sa01(5)
);
MU014: and00 port map(
		Aa => Am(6),
		Ba => Bm(1),
		Ya => sa01(6)
);
MU015: and00 port map(
		Aa => Am(7),
		Ba => Bm(1),
		Ya => sa01(7)
);
---------------------------revisado
MU016: fa00 port map(
						C00 => '0',
						A00 => sa00(0),
						B00 => sa01(0),
						C01 => sc00(0),
						S00 => Rm(1));



MU017: fa00 port map(
						C00 => sc00(0),
						A00 => sa00(1),
						B00 => sa01(1),
						C01 => sc00(1),
						S00 => ss00(0)
						);
MU018: fa00 port map(
		C00 => sc00(1),
		A00 => sa00(2),
		B00 => sa01(2),
		C01 => sc00(2),
		S00 => ss00(1)
);

MU019: fa00 port map(
		C00 => sc00(2),
		A00 => sa00(3),
		B00 => sa01(3),
		C01 => sc00(3),
		S00 => ss00(2)
);

MU020: fa00 port map(
		C00 => sc00(3),
		A00 => sa00(4),
		B00 => sa01(4),
		C01 => sc00(4),
		S00 => ss00(3)
);

MU021: fa00 port map(
		C00 => sc00(4),
		A00 => sa00(5),
		B00 => sa01(5),
		C01 => sc00(5),
		S00 => ss00(4)
);

MU022: fa00 port map(
		C00 => sc00(5),
		A00 => sa00(6),
		B00 => sa01(6),
		C01 => sc00(6),
		S00 => ss00(5)
);

MU023: fa00 port map(
		C00 => sc00(6),
		A00 => '0',
		B00 => sa01(7),
		C01 => sc00(7),
		S00 => ss00(6)
);



------------------------------
MU024: and00 port map(
		Aa => Am(0),
		Ba => Bm(2),
		Ya => sa02(0)
);
MU025: and00 port map(
		Aa => Am(1),
		Ba => Bm(2),
		Ya => sa02(1)
);
MU026: and00 port map(
		Aa => Am(2),
		Ba => Bm(2),
		Ya => sa02(2)
);
MU027: and00 port map(
		Aa => Am(3),
		Ba => Bm(2),
		Ya => sa02(3)
);
MU028: and00 port map(
		Aa => Am(4),
		Ba => Bm(2),
		Ya => sa02(4)
);
MU029: and00 port map(
		Aa => Am(5),
		Ba => Bm(2),
		Ya => sa02(5)
);
MU030: and00 port map(
		Aa => Am(6),
		Ba => Bm(2),
		Ya => sa02(6)
);
MU031: and00 port map(
		Aa => Am(7),
		Ba => Bm(2),
		Ya => sa02(7)
);




MU032: fa00 port map(
		C00 => '0',
		A00 => ss00(0),
		B00 => sa02(0),
		C01 => sc01(0),
		S00 => Rm(2)
);

MU033: fa00 port map(
		C00 => sc01(0),
		A00 => ss00(1),
		B00 => sa02(1),
		C01 => sc01(1),
		S00 => ss01(0)
);

MU034: fa00 port map(
		C00 => sc01(1),
		A00 => ss00(2),
		B00 => sa02(2),
		C01 => sc01(2),
		S00 => ss01(1)
);
MU035: fa00 port map(
		C00 => sc01(2),
		A00 => ss00(3),
		B00 => sa02(3),
		C01 => sc01(3),
		S00 => ss01(2)
);
MU036: fa00 port map(
		C00 => sc01(3),
		A00 => ss00(4),
		B00 => sa02(4),
		C01 => sc01(4),
		S00 => ss01(3)
);
MU037: fa00 port map(
		C00 => sc01(4),
		A00 => ss00(5),
		B00 => sa02(5),
		C01 => sc01(5),
		S00 => ss01(4)
);
MU038: fa00 port map(
		C00 => sc01(5),
		A00 => ss00(6),
		B00 => sa02(6),
		C01 => sc01(6),
		S00 => ss01(5)
);
MU039: fa00 port map(
		C00 => sc01(6),
		A00 => sc00(7),
		B00 => sa02(7),
		C01 => sc01(7),
		S00 => ss01(6)
);




MU040: and00 port map(
		Aa => Am(0),
		Ba => Bm(3),
		Ya => sa03(0)
);

MU041: and00 port map(
		Aa => Am(1),
		Ba => Bm(3),
		Ya => sa03(1)
);

MU042: and00 port map(
		Aa => Am(2),
		Ba => Bm(3),
		Ya => sa03(2)
);

MU043: and00 port map(
		Aa => Am(3),
		Ba => Bm(3),
		Ya => sa03(3)
);

MU044: and00 port map(
		Aa => Am(4),
		Ba => Bm(3),
		Ya => sa03(4)
);

MU045: and00 port map(
		Aa => Am(5),
		Ba => Bm(3),
		Ya => sa03(5)
);

MU046: and00 port map(
		Aa => Am(6),
		Ba => Bm(3),
		Ya => sa03(6)
);

MU047: and00 port map(
		Aa => Am(7),
		Ba => Bm(3),
		Ya => sa03(7)
);






MU048: fa00 port map(
		C00 => '0',
		A00 => ss01(0),
		B00 => sa03(0),
		C01 => sc02(0),
		S00 => Rm(3)
);

MU049: fa00 port map(
		C00 => sc02(0),
		A00 => ss01(1),
		B00 => sa03(1),
		C01 => sc02(1),
		S00 => ss02(0)
);

MU050: fa00 port map(
		C00 => sc02(1),
		A00 => ss01(2),
		B00 => sa03(2),
		C01 => sc02(2),
		S00 => ss02(1)
);
MU051: fa00 port map(
		C00 => sc02(2),
		A00 => ss01(3),
		B00 => sa03(3),
		C01 => sc02(3),
		S00 => ss02(2)
);
MU052: fa00 port map(
		C00 => sc02(3),
		A00 => ss01(4),
		B00 => sa03(4),
		C01 => sc02(4),
		S00 => ss02(3)
);
MU053: fa00 port map(
		C00 => sc02(4),
		A00 => ss01(5),
		B00 => sa03(5),
		C01 => sc02(5),
		S00 => ss02(4)
);
MU054: fa00 port map(
		C00 => sc02(5),
		A00 => ss01(6),
		B00 => sa03(6),
		C01 => sc02(6),
		S00 => ss02(5)
);
MU055: fa00 port map(
		C00 => sc02(6),
		A00 => sc01(7),
		B00 => sa03(7),
		C01 => sc02(7),
		S00 => ss02(6)
);





MU056: and00 port map(
		Aa => Am(0),
		Ba => Bm(4),
		Ya => sa04(0)
);

MU057: and00 port map(
		Aa => Am(1),
		Ba => Bm(4),
		Ya => sa04(1)
);

MU058: and00 port map(
		Aa => Am(2),
		Ba => Bm(4),
		Ya => sa04(2)
);

MU059: and00 port map(
		Aa => Am(3),
		Ba => Bm(4),
		Ya => sa04(3)
);

MU060: and00 port map(
		Aa => Am(4),
		Ba => Bm(4),
		Ya => sa04(4)
);

MU061: and00 port map(
		Aa => Am(5),
		Ba => Bm(4),
		Ya => sa04(5)
);

MU062: and00 port map(
		Aa => Am(6),
		Ba => Bm(4),
		Ya => sa04(6)
);

MU063: and00 port map(
		Aa => Am(7),
		Ba => Bm(4),
		Ya => sa04(7)
);




MU064: fa00 port map(
		C00 => '0',
		A00 => ss02(0),
		B00 => sa04(0),
		C01 => sc03(0),
		S00 => Rm(4)
);

MU065: fa00 port map(
		C00 => sc03(0),
		A00 => ss02(1),
		B00 => sa04(1),
		C01 => sc03(1),
		S00 => ss03(0)
);

MU066: fa00 port map(
		C00 => sc03(1),
		A00 => ss02(2),
		B00 => sa04(2),
		C01 => sc03(2),
		S00 => ss03(1)
);
MU067: fa00 port map(
		C00 => sc03(2),
		A00 => ss02(3),
		B00 => sa04(3),
		C01 => sc03(3),
		S00 => ss03(2)
);
MU068: fa00 port map(
		C00 => sc03(3),
		A00 => ss02(4),
		B00 => sa04(4),
		C01 => sc03(4),
		S00 => ss03(3)
);
MU069: fa00 port map(
		C00 => sc03(4),
		A00 => ss02(5),
		B00 => sa04(5),
		C01 => sc03(5),
		S00 => ss03(4)
);
MU070: fa00 port map(
		C00 => sc03(5),
		A00 => ss02(6),
		B00 => sa04(6),
		C01 => sc03(6),
		S00 => ss03(5)
);
MU071: fa00 port map(
		C00 => sc03(6),
		A00 => sc02(7),
		B00 => sa04(7),
		C01 => sc03(7),
		S00 => ss03(6)
);

------------------------------------------------------------------------------
MU072: and00 port map(
		Aa => Am(0),
		Ba => Bm(5),
		Ya => sa05(0)
);

MU073: and00 port map(
		Aa => Am(1),
		Ba => Bm(5),
		Ya => sa05(1)
);

MU074: and00 port map(
		Aa => Am(2),
		Ba => Bm(5),
		Ya => sa05(2)
);

MU075: and00 port map(
		Aa => Am(3),
		Ba => Bm(5),
		Ya => sa05(3)
);

MU076: and00 port map(
		Aa => Am(4),
		Ba => Bm(5),
		Ya => sa05(4)
);

MU077: and00 port map(
		Aa => Am(5),
		Ba => Bm(5),
		Ya => sa05(5)
);

MU078: and00 port map(
		Aa => Am(6),
		Ba => Bm(5),
		Ya => sa05(6)
);

MU079: and00 port map(
		Aa => Am(7),
		Ba => Bm(5),
		Ya => sa05(7)
);

------------------------------------------------------------------------------
MU088: and00 port map(
		Aa => Am(0),
		Ba => Bm(6),
		Ya => sa06(0)
);

MU089: and00 port map(
		Aa => Am(1),
		Ba => Bm(6),
		Ya => sa06(1)
);

MU090: and00 port map(
		Aa => Am(2),
		Ba => Bm(6),
		Ya => sa06(2)
);

MU091: and00 port map(
		Aa => Am(3),
		Ba => Bm(6),
		Ya => sa06(3)
);

MU092: and00 port map(
		Aa => Am(4),
		Ba => Bm(6),
		Ya => sa06(4)
);

MU093: and00 port map(
		Aa => Am(5),
		Ba => Bm(6),
		Ya => sa06(5)
);

MU094: and00 port map(
		Aa => Am(6),
		Ba => Bm(6),
		Ya => sa06(6)
);

MU095: and00 port map(
		Aa => Am(7),
		Ba => Bm(6),
		Ya => sa06(7)
);

------------------------------------------------------------------------------
MU104: and00 port map(
		Aa => Am(0),
		Ba => Bm(7),
		Ya => sa07(0)
);

MU105: and00 port map(
		Aa => Am(1),
		Ba => Bm(7),
		Ya => sa07(1)
);

MU106: and00 port map(
		Aa => Am(2),
		Ba => Bm(7),
		Ya => sa07(2)
);

MU107: and00 port map(
		Aa => Am(3),
		Ba => Bm(7),
		Ya => sa07(3)
);

MU108: and00 port map(
		Aa => Am(4),
		Ba => Bm(7),
		Ya => sa07(4)
);

MU109: and00 port map(
		Aa => Am(5),
		Ba => Bm(7),
		Ya => sa07(5)
);

MU110: and00 port map(
		Aa => Am(6),
		Ba => Bm(7),
		Ya => sa07(6)
);

MU111: and00 port map(
		Aa => Am(7),
		Ba => Bm(7),
		Ya => sa07(7)
);

------------------------------------------------------------------------


-------------------------------------------------------------------------
-------------------------------------------------------------------------

MU080: fa00 port map(
		C00 => '0',
		A00 => ss03(0),
		B00 => sa05(0),
		C01 => sc04(0),
		S00 => Rm(5)
);

MU081: fa00 port map(
		C00 => sc04(0),
		A00 => ss03(1),
		B00 => sa05(1),
		C01 => sc04(1),
		S00 => ss04(0)
);

MU082: fa00 port map(
		C00 => sc04(1),
		A00 => ss03(2),
		B00 => sa05(2),
		C01 => sc04(2),
		S00 => ss04(1)
);
MU083: fa00 port map(
		C00 => sc04(2),
		A00 => ss03(3),
		B00 => sa05(3),
		C01 => sc04(3),
		S00 => ss04(2)
);
MU084: fa00 port map(
		C00 => sc04(3),
		A00 => ss03(4),
		B00 => sa05(4),
		C01 => sc04(4),
		S00 => ss04(3)
);
MU085: fa00 port map(
		C00 => sc04(4),
		A00 => ss03(5),
		B00 => sa05(5),
		C01 => sc04(5),
		S00 => ss04(4)
);
MU086: fa00 port map(
		C00 => sc04(5),
		A00 => ss03(6),
		B00 => sa05(6),
		C01 => sc04(6),
		S00 => ss04(5)
);
MU087: fa00 port map(
		C00 => sc04(6),
		A00 => sc03(7),
		B00 => sa05(7),
		C01 => sc04(7),
		S00 => ss04(6)
);
------------------------------------------------------------------------------------------------------

MU096: fa00 port map(
		C00 => '0',
		A00 => ss04(0),
		B00 => sa06(0),
		C01 => sc05(0),
		S00 => Rm(6)
);

MU097: fa00 port map(
		C00 => sc05(0),
		A00 => ss04(1),
		B00 => sa06(1),
		C01 => sc05(1),
		S00 => ss05(0)
);

MU098: fa00 port map(
		C00 => sc05(1),
		A00 => ss04(2),
		B00 => sa06(2),
		C01 => sc05(2),
		S00 => ss05(1)
);
MU099: fa00 port map(
		C00 => sc05(2),
		A00 => ss04(3),
		B00 => sa06(3),
		C01 => sc05(3),
		S00 => ss05(2)
);
MU100: fa00 port map(
		C00 => sc05(3),
		A00 => ss04(4),
		B00 => sa06(4),
		C01 => sc05(4),
		S00 => ss05(3)
);
MU101: fa00 port map(
		C00 => sc05(4),
		A00 => ss04(5),
		B00 => sa06(5),
		C01 => sc05(5),
		S00 => ss05(4)
);
MU102: fa00 port map(
		C00 => sc05(5),
		A00 => ss04(6),
		B00 => sa06(6),
		C01 => sc05(6),
		S00 => ss05(5)
);
MU103: fa00 port map(
		C00 => sc05(6),
		A00 => sc04(7),
		B00 => sa06(7),
		C01 => sc05(7),
		S00 => ss05(6)
);
------------------------------------------------------------------------------------------------------------

MU112: fa00 port map(
		C00 => '0',
		A00 => ss05(0),
		B00 => sa07(0),
		C01 => sc06(0),
		S00 => Rm(7)
);

MU113: fa00 port map(
		C00 => sc06(0),
		A00 => ss05(1),
		B00 => sa07(1),
		C01 => sc06(1),
		S00 => Rm(8)
);

MU114: fa00 port map(
		C00 => sc06(1),
		A00 => ss05(2),
		B00 => sa07(2),
		C01 => sc06(2),
		S00 => Rm(9)
);
MU115: fa00 port map(
		C00 => sc06(2),
		A00 => ss05(3),
		B00 => sa07(3),
		C01 => sc06(3),
		S00 => Rm(10)
);
MU116: fa00 port map(
		C00 => sc06(3),
		A00 => ss05(4),
		B00 => sa07(4),
		C01 => sc06(4),
		S00 =>Rm(11)
);
MU117: fa00 port map(
		C00 => sc06(4),
		A00 => ss05(5),
		B00 => sa07(5),
		C01 => sc06(5),
		S00 => Rm(12)
);
MU118: fa00 port map(
		C00 => sc06(5),
		A00 => ss05(6),
		B00 => sa07(6),
		C01 => sc06(6),
		S00 => Rm(13)
);
MU119: fa00 port map(
		C00 => sc06(6),
		A00 => sc05(7),
		B00 => sa07(7),
		C01 => Rm(15),
		S00 => Rm(14)
);

end architecture;