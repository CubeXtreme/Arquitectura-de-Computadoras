library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
USE PACKAGEMUL00.ALL;

entity topmult00 is
  port(	A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		B: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		R : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
end topmult00;

architecture topmult0 of topmult00 is

signal S0, P0, P1, P2, P3, P4, P5, C6: std_logic_vector (6 DOWNTO 0);
	signal S1, S2, S3, S4, S5, S6, S7, C0, C1, C2, C3, C4, C5: std_logic_vector (7 DOWNTO 0);

begin

	A00 : and0 port map(
				AI00 => A(0),
				BI00 => B(0), 
				AO00 => R(0));
	
	A01 : and0 port map(
				AI00 => A(0),
				BI00 => B(1), 
				AO00 => S0(0));
			
	A02 : and0 port map(
				AI00 => A(0),
				BI00 => B(2), 
				AO00 => S0(1));
			
	A03 : and0 port map(
				AI00 => A(0),
				BI00 => B(3), 
				AO00 => S0(2));
			
	A04 : and0 port map(
				AI00 => A(0),
				BI00 => B(4), 
				AO00 => S0(3));
			
	A05 : and0 port map(
				AI00 => A(0),
				BI00 => B(5), 
				AO00 => S0(4));
			
	A06 : and0 port map(
				AI00 => A(0),
				BI00 => B(6), 
				AO00 => S0(5));
			
	A07 : and0 port map(
				AI00 => A(0),
				BI00 => B(7), 
				AO00 => S0(6));
	
	A10 : and0 port map(
				AI00 => A(1),
				BI00 => B(0), 
				AO00 => S1(0));
	
	A11 : and0 port map(
				AI00 => A(1),
				BI00 => B(1), 
				AO00 => S1(1));
			
	A12 : and0 port map(
				AI00 => A(1),
				BI00 => B(2), 
				AO00 => S1(2));
			
	A13 : and0 port map(
				AI00 => A(1),
				BI00 => B(3), 
				AO00 => S1(3));
			
	A14 : and0 port map(
				AI00 => A(1),
				BI00 => B(4), 
				AO00 => S1(4));
			
	A15 : and0 port map(
				AI00 => A(1),
				BI00 => B(5), 
				AO00 => S1(5));
			
	A16 : and0 port map(
				AI00 => A(1),
				BI00 => B(6), 
				AO00 => S1(6));
			
	A17 : and0 port map(
				AI00 => A(1),
				BI00 => B(7), 
				AO00 => S1(7));

	A20 : and0 port map(
				AI00 => A(2),
				BI00 => B(0), 
				AO00 => S2(0));
	
	A21 : and0 port map(
				AI00 => A(2),
				BI00 => B(1), 
				AO00 => S2(1));
			
	A22 : and0 port map(
				AI00 => A(2),
				BI00 => B(2), 
				AO00 => S2(2));
			
	A23 : and0 port map(
				AI00 => A(2),
				BI00 => B(3), 
				AO00 => S2(3));
			
	A24 : and0 port map(
				AI00 => A(2),
				BI00 => B(4), 
				AO00 => S2(4));
			
	A25 : and0 port map(
				AI00 => A(2),
				BI00 => B(5), 
				AO00 => S2(5));
			
	A26 : and0 port map(
				AI00 => A(2),
				BI00 => B(6), 
				AO00 => S2(6));
			
	A27 : and0 port map(
				AI00 => A(2),
				BI00 => B(7), 
				AO00 => S2(7));

	A30 : and0 port map(
				AI00 => A(3),
				BI00 => B(0), 
				AO00 => S3(0));
	
	A31 : and0 port map(
				AI00 => A(3),
				BI00 => B(1), 
				AO00 => S3(1));
			
	A32 : and0 port map(
				AI00 => A(3),
				BI00 => B(2), 
				AO00 => S3(2));
			
	A33 : and0 port map(
				AI00 => A(3),
				BI00 => B(3), 
				AO00 => S3(3));
			
	A34 : and0 port map(
				AI00 => A(3),
				BI00 => B(4), 
				AO00 => S3(4));
			
	A35 : and0 port map(
				AI00 => A(3),
				BI00 => B(5), 
				AO00 => S3(5));
			
	A36 : and0 port map(
				AI00 => A(3),
				BI00 => B(6), 
				AO00 => S3(6));
			
	A37 : and0 port map(
				AI00 => A(3),
				BI00 => B(7), 
				AO00 => S3(7));

	A40 : and0 port map(
				AI00 => A(4),
				BI00 => B(0), 
				AO00 => S4(0));
	
	A41 : and0 port map(
				AI00 => A(4),
				BI00 => B(1), 
				AO00 => S4(1));
			
	A42 : and0 port map(
				AI00 => A(4),
				BI00 => B(2), 
				AO00 => S4(2));
			
	A43 : and0 port map(
				AI00 => A(4),
				BI00 => B(3), 
				AO00 => S4(3));
			
	A44 : and0 port map(
				AI00 => A(4),
				BI00 => B(4), 
				AO00 => S4(4));
			
	A45 : and0 port map(
				AI00 => A(4),
				BI00 => B(5), 
				AO00 => S4(5));
			
	A46 : and0 port map(
				AI00 => A(4),
				BI00 => B(6), 
				AO00 => S4(6));
			
	A47 : and0 port map(
				AI00 => A(4),
				BI00 => B(7), 
				AO00 => S4(7));

	A50 : and0 port map(
				AI00 => A(5),
				BI00 => B(0), 
				AO00 => S5(0));
	
	A51 : and0 port map(
				AI00 => A(5),
				BI00 => B(1), 
				AO00 => S5(1));
			
	A52 : and0 port map(
				AI00 => A(5),
				BI00 => B(2), 
				AO00 => S5(2));
			
	A53 : and0 port map(
				AI00 => A(5),
				BI00 => B(3), 
				AO00 => S5(3));
			
	A54 : and0 port map(
				AI00 => A(5),
				BI00 => B(4), 
				AO00 => S5(4));
			
	A55 : and0 port map(
				AI00 => A(5),
				BI00 => B(5), 
				AO00 => S5(5));
			
	A56 : and0 port map(
				AI00 => A(5),
				BI00 => B(6), 
				AO00 => S5(6));
			
	A57 : and0 port map(
				AI00 => A(5),
				BI00 => B(7), 
				AO00 => S5(7));

	A60 : and0 port map(
				AI00 => A(6),
				BI00 => B(0), 
				AO00 => S6(0));
	
	A61 : and0 port map(
				AI00 => A(6),
				BI00 => B(1), 
				AO00 => S6(1));
			
	A62 : and0 port map(
				AI00 => A(6),
				BI00 => B(2), 
				AO00 => S6(2));
			
	A63 : and0 port map(
				AI00 => A(6),
				BI00 => B(3), 
				AO00 => S6(3));
			
	A64 : and0 port map(
				AI00 => A(6),
				BI00 => B(4), 
				AO00 => S6(4));
			
	A65 : and0 port map(
				AI00 => A(6),
				BI00 => B(5), 
				AO00 => S6(5));
			
	A66 : and0 port map(
				AI00 => A(6),
				BI00 => B(6), 
				AO00 => S6(6));
			
	A67 : and0 port map(
				AI00 => A(6),
				BI00 => B(7), 
				AO00 => S6(7));

	A70 : and0 port map(
				AI00 => A(7),
				BI00 => B(0), 
				AO00 => S7(0));
	
	A71 : and0 port map(
				AI00 => A(7),
				BI00 => B(1), 
				AO00 => S7(1));
			
	A72 : and0 port map(
				AI00 => A(7),
				BI00 => B(2), 
				AO00 => S7(2));
			
	A73 : and0 port map(
				AI00 => A(7),
				BI00 => B(3), 
				AO00 => S7(3));
			
	A74 : and0 port map(
				AI00 => A(7),
				BI00 => B(4), 
				AO00 => S7(4));
			
	A75 : and0 port map(
				AI00 => A(7),
				BI00 => B(5), 
				AO00 => S7(5));
			
	A76 : and0 port map(
				AI00 => A(7),
				BI00 => B(6), 
				AO00 => S7(6));
			
	A77 : and0 port map(
				AI00 => A(7),
				BI00 => B(7), 
				AO00 => S7(7));
		
	S00S01 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>S0(0), 
			B00=>S1(0),
			S00=>R(1), 
			C01=>C0(0) 
			);
	
	S01S11 : TOPADDER1 PORT MAP (
			C00=>C0(0), 
			A00=>S0(1), 
			B00=>S1(1),
			S00=>P0(0), 
			C01=>C0(1) 
			);
			
	S02S12 : TOPADDER1 PORT MAP (
			C00=>C0(1), 
			A00=>S0(2), 
			B00=>S1(2),
			S00=>P0(1), 
			C01=>C0(2) 
			);
			
	S03S13 : TOPADDER1 PORT MAP (
			C00=>C0(2), 
			A00=>S0(3), 
			B00=>S1(3),
			S00=>P0(2), 
			C01=>C0(3) 
			);
			
	S04S14 : TOPADDER1 PORT MAP (
			C00=>C0(3), 
			A00=>S0(4), 
			B00=>S1(4),
			S00=>P0(3), 
			C01=>C0(4) 
			);
	
	S05S15 : TOPADDER1 PORT MAP (
			C00=>C0(4), 
			A00=>S0(5), 
			B00=>S1(5),
			S00=>P0(4), 
			C01=>C0(5) 
			);
			
	S06S16 : TOPADDER1 PORT MAP (
			C00=>C0(5), 
			A00=>S0(6), 
			B00=>S1(6),
			S00=>P0(5), 
			C01=>C0(6) 
			);
			
	S07S17 : TOPADDER1 PORT MAP (
			C00=>C0(6), 
			A00=>'0', 
			B00=>S1(7),
			S00=>P0(6), 
			C01=>C0(7) 
			);
		
	P00S20 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P0(0), 
			B00=>S2(0),
			S00=>R(2), 
			C01=>C1(0) 
			);
			
	P01S21 : TOPADDER1 PORT MAP (
			C00=>C1(0), 
			A00=>P0(1), 
			B00=>S2(1),
			S00=>P1(0), 
			C01=>C1(1) 
			);
			
	P02S22 : TOPADDER1 PORT MAP (
			C00=>C1(1), 
			A00=>P0(2), 
			B00=>S2(2),
			S00=>P1(1), 
			C01=>C1(2) 
			);
		
	P03S23 : TOPADDER1 PORT MAP (
			C00=>C1(2), 
			A00=>P0(3), 
			B00=>S2(3),
			S00=>P1(2), 
			C01=>C1(3) 
			);
	
	P04S24 : TOPADDER1 PORT MAP (
			C00=>C1(3), 
			A00=>P0(4), 
			B00=>S2(4),
			S00=>P1(3), 
			C01=>C1(4) 
			);
			
	P05S25 : TOPADDER1 PORT MAP (
			C00=>C1(4), 
			A00=>P0(5), 
			B00=>S2(5),
			S00=>P1(4), 
			C01=>C1(5) 
			);
			
	P06S26 : TOPADDER1 PORT MAP (
			C00=>C1(5), 
			A00=>P0(6), 
			B00=>S2(6),
			S00=>P1(5), 
			C01=>C1(6) 
			);
			
	C07S27 : TOPADDER1 PORT MAP (
			C00=>C1(6), 
			A00=>C0(7), 
			B00=>S2(7),
			S00=>P1(6), 
			C01=>C1(7) 
			);
			
	P10S30 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P1(0), 
			B00=>S3(0),
			S00=>R(3), 
			C01=>C2(0) 
			);
			
	P11S31 : TOPADDER1 PORT MAP (
			C00=>C2(0), 
			A00=>P1(1), 
			B00=>S3(1),
			S00=>P2(0), 
			C01=>C2(1) 
			);
			
	P12S32 : TOPADDER1 PORT MAP (
			C00=>C2(1), 
			A00=>P1(2), 
			B00=>S3(2),
			S00=>P2(1), 
			C01=>C2(2) 
			);
			
	P13S33 : TOPADDER1 PORT MAP (
			C00=>C2(2), 
			A00=>P1(3), 
			B00=>S3(3),
			S00=>P2(2), 
			C01=>C2(3) 
			);
			
	P14S34 : TOPADDER1 PORT MAP (
			C00=>C2(3), 
			A00=>P1(4), 
			B00=>S3(4),
			S00=>P2(3), 
			C01=>C2(4) 
			);
			
	P15S35 : TOPADDER1 PORT MAP (
			C00=>C2(4), 
			A00=>P1(5), 
			B00=>S3(5),
			S00=>P2(4), 
			C01=>C2(5) 
			);
			
	P16S36 : TOPADDER1 PORT MAP (
			C00=>C2(5), 
			A00=>P1(6), 
			B00=>S3(6),
			S00=>P2(5), 
			C01=>C2(6) 
			);
			
	C17S37 : TOPADDER1 PORT MAP (
			C00=>C2(6), 
			A00=>C1(7), 
			B00=>S3(7),
			S00=>P2(6), 
			C01=>C2(7) 
			);
			
	P20S40 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P2(0), 
			B00=>S4(0),
			S00=>R(4), 
			C01=>C3(0) 
			);
			
	P21S41 : TOPADDER1 PORT MAP (
			C00=>C3(0), 
			A00=>P2(1), 
			B00=>S4(1),
			S00=>P3(0), 
			C01=>C3(1) 
			);
			
	P22S42 : TOPADDER1 PORT MAP (
			C00=>C3(1), 
			A00=>P2(2), 
			B00=>S4(2),
			S00=>P3(1), 
			C01=>C3(2) 
			);
			
	P23S43 : TOPADDER1 PORT MAP (
			C00=>C3(2), 
			A00=>P2(3), 
			B00=>S4(3),
			S00=>P3(2), 
			C01=>C3(3) 
			);
			
	P24S44 : TOPADDER1 PORT MAP (
			C00=>C3(3), 
			A00=>P2(4), 
			B00=>S4(4),
			S00=>P3(3), 
			C01=>C3(4) 
			);
			
	P25S45 : TOPADDER1 PORT MAP (
			C00=>C3(4), 
			A00=>P2(5), 
			B00=>S4(5),
			S00=>P3(4), 
			C01=>C3(5) 
			);
			
	P26S46 : TOPADDER1 PORT MAP (
			C00=>C3(5), 
			A00=>P2(6), 
			B00=>S4(6),
			S00=>P3(5), 
			C01=>C3(6) 
			);
			
	C27S47 : TOPADDER1 PORT MAP (
			C00=>C3(6), 
			A00=>C2(7), 
			B00=>S4(7),
			S00=>P3(6), 
			C01=>C3(7) 
			);
			
	P30S50 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P3(0), 
			B00=>S5(0),
			S00=>R(5), 
			C01=>C4(0) 
			);
			
	P31S51 : TOPADDER1 PORT MAP (
			C00=>C4(0), 
			A00=>P3(1), 
			B00=>S5(1),
			S00=>P4(0), 
			C01=>C4(1) 
			);
			
	P32S52 : TOPADDER1 PORT MAP (
			C00=>C4(1), 
			A00=>P3(2), 
			B00=>S5(2),
			S00=>P4(1), 
			C01=>C4(2) 
			);
			
	P33S53 : TOPADDER1 PORT MAP (
			C00=>C4(2), 
			A00=>P3(3), 
			B00=>S5(3),
			S00=>P4(2), 
			C01=>C4(3) 
			);
			
	P34S54 : TOPADDER1 PORT MAP (
			C00=>C4(3), 
			A00=>P3(4), 
			B00=>S5(4),
			S00=>P4(3), 
			C01=>C4(4) 
			);
			
	P35S55 : TOPADDER1 PORT MAP (
			C00=>C4(4), 
			A00=>P3(5), 
			B00=>S5(5),
			S00=>P4(4), 
			C01=>C4(5) 
			);
			
	P36S56 : TOPADDER1 PORT MAP (
			C00=>C4(5), 
			A00=>P3(6), 
			B00=>S5(6),
			S00=>P4(5), 
			C01=>C4(6) 
			);
			
	C37S57 : TOPADDER1 PORT MAP (
			C00=>C4(6), 
			A00=>C3(7), 
			B00=>S5(7),
			S00=>P4(6), 
			C01=>C4(7) 
			);
			
	 P40S60 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P4(0), 
			B00=>S6(0),
			S00=>R(6), 
			C01=>C5(0) 
			);
	
	P41S61 : TOPADDER1 PORT MAP (
			C00=>C5(0), 
			A00=>P4(1), 
			B00=>S6(1),
			S00=>P5(0), 
			C01=>C5(1) 
			);
			
	P42S62 : TOPADDER1 PORT MAP (
			C00=>C5(1), 
			A00=>P4(2), 
			B00=>S6(2),
			S00=>P5(1), 
			C01=>C5(2) 
			);
			
	P43S63 : TOPADDER1 PORT MAP (
			C00=>C5(2), 
			A00=>P4(3), 
			B00=>S6(3),
			S00=>P5(2), 
			C01=>C5(3) 
			);
			
	P44S64 : TOPADDER1 PORT MAP (
			C00=>C5(3), 
			A00=>P4(4), 
			B00=>S6(4),
			S00=>P5(3), 
			C01=>C5(4) 
			);
			
	P45S65 : TOPADDER1 PORT MAP (
			C00=>C5(4), 
			A00=>P4(5), 
			B00=>S6(5),
			S00=>P5(4), 
			C01=>C5(5) 
			);
			
	P46S66 : TOPADDER1 PORT MAP (
			C00=>C5(5), 
			A00=>P4(6), 
			B00=>S6(6),
			S00=>P5(5), 
			C01=>C5(6) 
			);
			
	C47S67 : TOPADDER1 PORT MAP (
			C00=>C5(6), 
			A00=>C4(7), 
			B00=>S6(7),
			S00=>P5(6), 
			C01=>C5(7) 
			);
			
	P50S70 : TOPADDER1 PORT MAP (
			C00=>'0', 
			A00=>P5(0), 
			B00=>S7(0),
			S00=>R(7), 
			C01=>C6(0) 
			);
		
	P51S71 : TOPADDER1 PORT MAP (
			C00=>C6(0), 
			A00=>P5(1), 
			B00=>S7(1),
			S00=>R(8), 
			C01=>C6(1) 
			);
			
	P52S72 : TOPADDER1 PORT MAP (
			C00=>C6(1), 
			A00=>P5(2), 
			B00=>S7(2),
			S00=>R(9), 
			C01=>C6(2) 
			);
			
	P53S73 : TOPADDER1 PORT MAP (
			C00=>C6(2), 
			A00=>P5(3), 
			B00=>S7(3),
			S00=>R(10), 
			C01=>C6(3) 
			);
			
	P54S74 : TOPADDER1 PORT MAP (
			C00=>C6(3), 
			A00=>P5(4), 
			B00=>S7(4),
			S00=>R(11), 
			C01=>C6(4) 
			);
			
	P55S75 : TOPADDER1 PORT MAP (
			C00=>C6(4), 
			A00=>P5(5), 
			B00=>S7(5),
			S00=>R(12), 
			C01=>C6(5) 
			);
			
	P56S76 : TOPADDER1 PORT MAP (
			C00=>C6(5), 
			A00=>P5(6), 
			B00=>S7(6),
			S00=>R(13), 
			C01=>C6(6) 
			);
			
	C57S77 : TOPADDER1 PORT MAP (
			C00=>C6(6), 
			A00=>C5(7), 
			B00=>S7(7),
			S00=>R(14), 
			C01=>R(15) 
			);
			
end topmult0;