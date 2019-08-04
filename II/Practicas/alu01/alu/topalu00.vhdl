library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;

--||funct || valor
--||or    || 000000
--||and   || 000001
--||not   || 000010
--||nand  || 000011
--||nor   || 000100
--||xor   || 000101
--||xnor  || 000110
--||adder || 000111
--||subs  || 001000
--||mult  || 100000




entity topalu00 is
  port(--------------------ALU 
       clk00: inout std_logic;
	   cdiv00: in std_logic_vector(4 downto 0);
	   enable0: in std_logic;
	   funct0: in std_logic_vector(5 downto 0);
	   inRS0: in std_logic_vector(7 downto 0);
	   inRT0: in std_logic_vector(7 downto 0);
	   SL: in std_logic;----Adder8bit
	   outRD0: out std_logic_vector(15 downto 0);
	   LED: out std_logic;----Adder8bit
	   outFlagInst0: inout std_logic;
       outFlagac0: inout std_logic
	   );
end topalu00;

architecture topalu0 of topalu00 is
-------------signal ALU
signal soutInstMult8bits, mout: std_logic_vector(15 downto 0);
signal soutInst: std_logic_vector(7 downto 0);
signal soutsad, soutssb, sout: std_logic_vector(7 downto 0);
signal sLEDad, sLEDsb, sSLad, sSLsb: std_logic;
begin

-----------------------------------------------------------------------------ALU

   AL00: topdiv00 port map(clk0 => clk00,
                           cdiv0 => cdiv00);
   
   AL01: ora00 port map(clko => clk00,
                        inFlago => outFlagac0,
						functo => funct0,
						inRSo => inRS0,
						inRTo => inRT0,
						outRDo => soutInst,
                        outFlago => outFlagInst0);
						
    AL02: anda00 port map(clka => clk00,
                        inFlaga => outFlagac0,
						functa => funct0,
						inRSa => inRS0,
						inRTa => inRT0,
						outRDa => soutInst,
                        outFlaga => outFlagInst0);
						
   AL03: nota00 port map(clkno => clk00,
                        inFlagno => outFlagac0,
						functno => funct0,
						inRSno => inRS0,
						inRTno => inRT0,
						outRDno => soutInst,
                        outFlagno => outFlagInst0);
						
	AL04: nanda00 port map(clknand => clk00,
                        inFlagnand => outFlagac0,
						functnand => funct0,
						inRSnand => inRS0,
						inRTnand => inRT0,
						outRDnand => soutInst,
                        outFlagnand => outFlagInst0);
						
   AL05: nora00 port map(clknor => clk00,
                        inFlagnor => outFlagac0,
						functnor => funct0,
						inRSnor => inRS0,
						inRTnor => inRT0,
						outRDnor => soutInst,
                        outFlagnor => outFlagInst0);
						
   AL06: xora00 port map(clkxor => clk00,
                        inFlagxor => outFlagac0,
						functxor => funct0,
						inRSxor => inRS0,
						inRTxor => inRT0,
						outRDxor => soutInst,
                        outFlagxor => outFlagInst0);
						
   AL07: xnora00 port map(clkxnor => clk00,
                        inFlagxnor => outFlagac0,
						functxnor => funct0,
						inRSxnor => inRS0,
						inRTxnor => inRT0,
						outRDxnor => soutInst,
                        outFlagxnor => outFlagInst0);
   
   AL08: ac00 port map(clkac => clk00,
                       enableac => enable0,
					   inFlagac => outFlagInst0,
					   functac => funct0,
					   inac => soutInst,
					   inacmult8bits => soutInstMult8bits,
					   outac => outRD0,
                       outFlagac => outFlagac0);
					   
	AL09: adder8bits port map(
						SLadder8bits => SL,
						inRSadder8bits => inRS0,
						inRTadder8bits => inRT0,
						outLED => sLEDad,
						outRDadder8bits => soutsad);
						
	AL10: addera00 port map(clkad => clk00,
						 SLad => SL,
                         codopad => funct0,
					     inFlagad => outFlagac0,
					     outsad => soutsad,--llega desde el circuito sumador
					     LEDsad => sLEDad,-- llega desde el sumador
					     outad => soutInst,--va hacia la unidad de control
					     LEDad => LED,
					     outFlagad => outFlagInst0);
  
	AL11: subsa00 port map(clksb => clk00,
                         SLsb => SL,
                         codopsb => funct0,
					     inFlagsb => outFlagac0,
					     outssb => soutsad,--llega desde el circuito sumador
					     LEDssb => sLEDad,-- llega desde el sumador
					     outsb => soutInst,--va hacia la unidad de control
					     LEDsb => LED,
					     outFlagsb => outFlagInst0);
	
	AL12: mult8bits port map(clkm => clk00,
							 codopm => funct0,
							 inFlagm => outFlagac0,
							 outm => mout,
							 outmult => soutInstMult8bits,
							 outFlagm => outFlagInst0);	

	AL13: topmult00 port map(A => inRS0,
						     B => inRT0,
						     R => mout);

end topalu0;