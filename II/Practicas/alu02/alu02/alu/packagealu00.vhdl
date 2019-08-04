library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is

  component topdiv00
    port(
       cdiv0: in std_logic_vector(4 downto 0);
       clk0: inout std_logic);
  end component;
    
  component ora00
    port(
       clko: in std_logic;
	   inFlago: in std_logic;
	   functo: in std_logic_vector(5 downto 0);
	   inRSo: in std_logic_vector(7 downto 0);
	   inRTo: in std_logic_vector(7 downto 0);
	   outRDo: out std_logic_vector(7 downto 0);
       outFlago: out std_logic);
  end component;
  
  component anda00
     port(
       clka: in std_logic;
	   inFlaga: in std_logic;
	   functa: in std_logic_vector(5 downto 0);
	   inRSa: in std_logic_vector(7 downto 0);
	   inRTa: in std_logic_vector(7 downto 0);
	   outRDa: out std_logic_vector(7 downto 0);
       outFlaga: out std_logic);
  end component;
  
  component nota00
		port(
       clkno: in std_logic;
	   inFlagno: in std_logic;
	   functno: in std_logic_vector(5 downto 0);
	   inRSno: in std_logic_vector(7 downto 0);
	   inRTno: in std_logic_vector(7 downto 0);
	   outRDno: out std_logic_vector(7 downto 0);
       outFlagno: out std_logic);
  end component;
  
  component nanda00
		port(
       clknand: in std_logic;
	   inFlagnand: in std_logic;
	   functnand: in std_logic_vector(5 downto 0);
	   inRSnand: in std_logic_vector(7 downto 0);
	   inRTnand: in std_logic_vector(7 downto 0);
	   outRDnand: out std_logic_vector(7 downto 0);
       outFlagnand: out std_logic);
  end component;
  
  component nora00
    port(
       clknor: in std_logic;
	   inFlagnor: in std_logic;
	   functnor: in std_logic_vector(5 downto 0);
	   inRSnor: in std_logic_vector(7 downto 0);
	   inRTnor: in std_logic_vector(7 downto 0);
	   outRDnor: out std_logic_vector(7 downto 0);
       outFlagnor: out std_logic);
  end component;
  
  component xora00
    port(
       clkxor: in std_logic;
	   inFlagxor: in std_logic;
	   functxor: in std_logic_vector(5 downto 0);
	   inRSxor: in std_logic_vector(7 downto 0);
	   inRTxor: in std_logic_vector(7 downto 0);
	   outRDxor: out std_logic_vector(7 downto 0);
       outFlagxor: out std_logic);
  end component;
  
  component xnora00
    port(
	   clkxnor: in std_logic;
	   inFlagxnor: in std_logic;
	   functxnor: in std_logic_vector(5 downto 0);
	   inRSxnor: in std_logic_vector(7 downto 0);
	   inRTxnor: in std_logic_vector(7 downto 0);
	   outRDxnor: out std_logic_vector(7 downto 0);
       outFlagxnor: out std_logic);
  end component;
  
  component ac00
    port(
       clkac: in std_logic;
	   enableac: in std_logic;
	   inFlagac: in std_logic;
	   functac: in std_logic_vector(5 downto 0);
	   inac: in std_logic_vector(7 downto 0);
	   inacmult8bits: in std_logic_vector(15 downto 0);
	   outac: out std_logic_vector(15 downto 0);
       outFlagac: out std_logic);
  end component;
  
	component adder8bits 
		port(SLadder8bits: in std_logic;
		   inRSadder8bits: in std_logic_vector(7 downto 0);
		   inRTadder8bits: in std_logic_vector(7 downto 0);
		   outLED: out std_logic;
		   outRDadder8bits: out std_logic_vector(7 downto 0));
	end component;
	
	component addera00
		port(
		   clkad: in std_logic;
		   SLad: in std_logic;
		   codopad: in std_logic_vector(5 downto 0);
		   inFlagad: in std_logic;
		   outsad: in std_logic_vector(7 downto 0);
		   LEDsad: in std_logic;
		   outad: out std_logic_vector(7 downto 0);
		   LEDad: out std_logic;
		   outFlagad: out std_logic);
	end component;
	
	component subsa00
		port(
		   clksb: in std_logic;
		   SLsb: in std_logic;
		   codopsb: in std_logic_vector(5 downto 0);
		   inFlagsb: in std_logic;
		   outssb: in std_logic_vector(7 downto 0);
		   LEDssb: in std_logic;
		   outsb: out std_logic_vector(7 downto 0);
		   LEDsb: out std_logic;
		   outFlagsb: out std_logic);
	end component;
	
	component mult8bits
		port (clkm: in std_logic;
			 codopm: in std_logic_vector(5 downto 0);			
			 inFlagm: in std_logic;
			 outm: in std_logic_vector(15 downto 0);
			 outmult: out std_logic_vector(15 downto 0);
			 outFlagm: out std_logic);
	end component;
	
	component topmult00
		port(A: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			B: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			R : OUT STD_LOGIC_VECTOR (15 DOWNTO 0));
	end component;
	
	component shiftL00
		port(
		   clkshiftL: in std_logic;
		   inFlagshiftL: in std_logic;
		   functshiftL: in std_logic_vector(5 downto 0);
		   inRSshiftL: in std_logic_vector(7 downto 0);
		   inRTshiftL: in std_logic_vector(7 downto 0);
		   outRDshiftL: out std_logic_vector(7 downto 0);
		   outFlagshiftL: out std_logic);
	end component;
	
	component shiftR00
		port(
		   clkshiftR: in std_logic;
		   inFlagshiftR: in std_logic;
		   functshiftR: in std_logic_vector(5 downto 0);
		   inRSshiftR: in std_logic_vector(7 downto 0);
		   inRTshiftR: in std_logic_vector(7 downto 0);
		   outRDshiftR: out std_logic_vector(7 downto 0);
		   outFlagshiftR: out std_logic);
	end component;
	
	component rotR00
		port(
		   clkrotR: in std_logic;
		   inFlagrotR: in std_logic;
		   functrotR: in std_logic_vector(5 downto 0);
		   inRSrotR: in std_logic_vector(7 downto 0);
		   inRTrotR: in std_logic_vector(7 downto 0);
		   outRDrotR: out std_logic_vector(7 downto 0);
		   outFlagrotR: out std_logic);
	end component;
	
	component rotL00
		port(
		   clkrotL: in std_logic;
		   inFlagrotL: in std_logic;
		   functrotL: in std_logic_vector(5 downto 0);
		   inRSrotL: in std_logic_vector(7 downto 0);
		   inRTrotL: in std_logic_vector(7 downto 0);
		   outRDrotL: out std_logic_vector(7 downto 0);
		   outFlagrotL: out std_logic);
	end component;
	
	component barrelshiftL00
		port(
		   clkbarrelshiftL: in std_logic;
		   inFlagbarrelshiftL: in std_logic;
		   functbarrelshiftL: in std_logic_vector(5 downto 0);
		   inRSbarrelshiftL: in std_logic_vector(7 downto 0);
		   inRTbarrelshiftL: in std_logic_vector(7 downto 0);
		   outRDbarrelshiftL: out std_logic_vector(7 downto 0);
		   outFlagbarrelshiftL: out std_logic);
	end component;
	
	component barrelshiftR00
		port(
		   clkbarrelshiftR: in std_logic;
		   inFlagbarrelshiftR: in std_logic;
		   functbarrelshiftR: in std_logic_vector(5 downto 0);
		   inRSbarrelshiftR: in std_logic_vector(7 downto 0);
		   inRTbarrelshiftR: in std_logic_vector(7 downto 0);
		   outRDbarrelshiftR: out std_logic_vector(7 downto 0);
		   outFlagbarrelshiftR: out std_logic);
	end component;
	
	component barrelrotL00
		port(
		   clkbarrelrotL: in std_logic;
		   inFlagbarrelrotL: in std_logic;
		   functbarrelrotL: in std_logic_vector(5 downto 0);
		   inRSbarrelrotL: in std_logic_vector(7 downto 0);
		   inRTbarrelrotL: in std_logic_vector(7 downto 0);
		   outRDbarrelrotL: out std_logic_vector(7 downto 0);
		   outFlagbarrelrotL: out std_logic);
	end component;
	
	component barrelrotR00
		port(
		   clkbarrelrotR: in std_logic;
		   inFlagbarrelrotR: in std_logic;
		   functbarrelrotR: in std_logic_vector(5 downto 0);
		   inRSbarrelrotR: in std_logic_vector(7 downto 0);
		   inRTbarrelrotR: in std_logic_vector(7 downto 0);
		   outRDbarrelrotR: out std_logic_vector(7 downto 0);
		   outFlagbarrelrotR: out std_logic);
	end component;

end packagealu00;