library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;


--||funct || valor  ||
--||or    || 000000 ||
--||and   || 000001 ||
--||not   || 000010 ||
--||nand  || 000011 ||
--||nor   || 000100 ||
--||xor   || 000101 ||
--||xnor  || 000110 ||
--||adder || 000111 ||
--||subs  || 001000 ||
--||mult  || 001001 ||
--||shiftL|| 001010 ||
--||shiftR|| 001011 ||
--||rotL  || 001100 ||
--||rotR  || 001101 ||
--||barrlR|| 001110 ||
--||barrlL|| 001111 ||
--||barrl3|| 010000 ||
--||barrl4|| 010001 ||





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
					     outsad => soutsad,--from adder 
					     LEDsad => sLEDad,-- from adder
					     outad => soutInst,--goes to cu
					     LEDad => LED,
					     outFlagad => outFlagInst0);
  
	AL11: subsa00 port map(clksb => clk00,  --checar
                         SLsb => SL,
                         codopsb => funct0,
					     inFlagsb => outFlagac0,
					     outssb => soutsad,--from adder 
					     LEDssb => sLEDad,--from adder 
					     outsb => soutInst,--goes to cu
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
							 
	AL14: shiftL00 port map(clkshiftL => clk00,
							inFlagshiftL => outFlagac0,
							functshiftL => funct0,
							inRSshiftL => inRS0,
							inRTshiftL => inRT0,
							outRDshiftL => soutInst,
							outFlagshiftL => outFlagInst0);
	
	AL15: shiftR00 port map(clkshiftR => clk00,
							inFlagshiftR => outFlagac0,
							functshiftR => funct0,
							inRSshiftR => inRS0,
							inRTshiftR => inRT0,
							outRDshiftR => soutInst,
							outFlagshiftR => outFlagInst0);
							 
	AL16: rotR00 port map(clkrotR => clk00,
							inFlagrotR => outFlagac0,
							functrotR => funct0,
							inRSrotR => inRS0,
							inRTrotR => inRT0,
							outRDrotR => soutInst,
							outFlagrotR => outFlagInst0);
							 
	AL17: rotL00 port map(clkrotL => clk00,
							inFlagrotL => outFlagac0,
							functrotL => funct0,
							inRSrotL => inRS0,
							inRTrotL => inRT0,
							outRDrotL => soutInst,
							outFlagrotL => outFlagInst0);
							
	AL18: barrelshiftL00 port map(clkbarrelshiftL => clk00,
							inFlagbarrelshiftL => outFlagac0,
							functbarrelshiftL => funct0,
							inRSbarrelshiftL => inRS0,
							inRTbarrelshiftL => inRT0,
							outRDbarrelshiftL => soutInst,
							outFlagbarrelshiftL => outFlagInst0);
							
	AL19: barrelshiftR00 port map(clkbarrelshiftR => clk00,
							inFlagbarrelshiftR => outFlagac0,
							functbarrelshiftR => funct0,
							inRSbarrelshiftR => inRS0,
							inRTbarrelshiftR => inRT0,
							outRDbarrelshiftR => soutInst,
							outFlagbarrelshiftR => outFlagInst0);
							
	AL20: barrelrotL00 port map(clkbarrelrotL => clk00,
							inFlagbarrelrotL => outFlagac0,
							functbarrelrotL => funct0,
							inRSbarrelrotL => inRS0,
							inRTbarrelrotL => inRT0,
							outRDbarrelrotL => soutInst,
							outFlagbarrelrotL => outFlagInst0);
							
	AL21: barrelrotR00 port map(clkbarrelrotR => clk00,
							inFlagbarrelrotR => outFlagac0,
							functbarrelrotR => funct0,
							inRSbarrelrotR => inRS0,
							inRTbarrelrotR => inRT0,
							outRDbarrelrotR => soutInst,
							outFlagbarrelrotR => outFlagInst0);

end topalu0;