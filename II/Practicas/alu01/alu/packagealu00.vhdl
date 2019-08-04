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

end packagealu00;