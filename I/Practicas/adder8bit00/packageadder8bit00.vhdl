library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageadder8bit00 is
	component and00
		port
		(
			Aa:in std_logic;
			Ba:in std_logic;
			Ya:out std_logic
		);
	end component;
	component xor00
		port
		(
			Ax:in std_logic;
			Bx:in std_logic;
			Yx:out std_logic
		);
	end component;
	component or00 is
		port(
			Ao: in std_logic;
			Bo: in std_logic;
			Yo: out std_logic
		);	
	end component;
	component xnor00 is
		port(
			Anx: in std_logic;
			Bnx: in std_logic;
			Ynx: out std_logic
		);
	end component;
	component fa00 is
		port(
			A00: in std_logic;
			B00: in std_logic;
			C00: in std_logic;
			S00: out std_logic;
			C01: out std_logic
		);
	end component;
end package;