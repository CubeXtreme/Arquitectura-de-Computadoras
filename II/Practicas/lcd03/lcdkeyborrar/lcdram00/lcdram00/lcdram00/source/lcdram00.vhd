library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.components.all;
library machxo2;
use machxo2.all;

entity lcdram00 is
port(
	LCD_DATA : out  STD_LOGIC_VECTOR (7 downto 0);

	LCD_ENABLE : out  STD_LOGIC;
	LCD_RS : out  STD_LOGIC;

	LED1 : out  STD_LOGIC;
	LED2 : out  STD_LOGIC;

	CLK : in  STD_LOGIC;
	CLR : in std_logic;
	
	COLS: inout std_logic_vector(3 downto 0);
	ROWS: in std_logic_vector(3 downto 0);
	
	OP: IN STD_LOGIC
);
end lcdram00;

architecture lcdram0 of lcdram00 is

constant C_A : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000001";
constant C_B : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000010";
constant C_C : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000011";
constant C_D : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000100";
constant C_E : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000101";
constant C_F : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000110";
constant C_G : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01000111";
constant C_H : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001000";
constant C_I : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001001";
constant C_J : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001010";
constant C_K : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001011";
constant C_L : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001100";
constant C_M : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001101";
constant C_N : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001110";
constant C_O : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01001111";
constant C_P : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010000";
constant C_Q : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010001";
constant C_R : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010010";
constant C_S : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010011";
constant C_T : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010100";
constant C_U : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010101";
constant C_V : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010110";
constant C_W : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01010111";
constant C_X : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01011000";
constant C_Y : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01011001";
constant C_Z : STD_LOGIC_VECTOR(7 DOWNTO 0) := "01011010";
constant C_SPACE : STD_LOGIC_VECTOR(7 DOWNTO 0) := "10100000";
constant C_NULL : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";

type ram_mem is array(0 to 32) of std_logic_vector(7 downto 0);
type state_type is (    S0, S1, S2, S3, S4, S5, S6, S7, S8, S9,
                            S10, S11, S12, S13, S14, S15, S16, S17,
                            S18, S19, S20, S21, S22, S23, S24, S25,
                            S26, S27, IDLE);
signal current_state: state_type;
signal addr : integer := 0;
signal del : bit := '0';
signal ram : ram_mem := (
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,	
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	C_SPACE,
	
	others=>C_SPACE
);
SHARED VARIABLE C_KEY: STD_LOGIC_VECTOR(7 DOWNTO 0) := C_NULL;
BEGIN
PROCESS(CLK)
BEGIN
if(clr='1')then
	current_State <= s0;
	LED1 <= '0';
	addr <= 0;
	cols <= "1000";
elsif rising_edge(CLK) then
	if(C_KEY = C_NULL)THEN
		CASE ROWS IS
			WHEN "1000"=>
				CASE COLS IS
					WHEN "1000"=> 
					current_State <= s0;
					LED1 <= '0';
					addr <= 0;
					cols <= "1000";
					WHEN "0100"=> C_KEY := "01010001";--Q--"00101010";-- --*
					WHEN "0010"=> C_KEY := "00100000";--"00110000";--0
					WHEN "0001"=> C_KEY := "01000101";--E
					WHEN OTHERS => C_KEY := C_NULL; 
				END CASE;
			WHEN "0100"=>
				CASE COLS IS
					WHEN "1000"=> C_KEY := "01010100";--T--C
					WHEN "0100"=> C_KEY := "01010110";--VU--9
					WHEN "0010"=> C_KEY := "01010011";--S--8
					WHEN "0001"=> C_KEY := "01001001";--I--7
					WHEN OTHERS => C_KEY := C_NULL; 
				END CASE;
			WHEN "0010"=>
				CASE COLS IS
					WHEN "1000"=> C_KEY := "01000100";--D--B
					WHEN "0100"=> C_KEY := "01001110";--N--6
					WHEN "0010"=> C_KEY := "01010101";--U--5
					WHEN "0001"=> C_KEY := "01001101";--M--4
					WHEN OTHERS => C_KEY := C_NULL; 
				END CASE;
			WHEN "0001"=>
				CASE COLS IS
					WHEN "1000"=> C_KEY := "01000001";--A--A
					WHEN "0100"=> C_KEY := "01001100";--L--3
					WHEN "0010"=> C_KEY := "01001111";--O--2
					WHEN "0001"=> C_KEY := "01001000";--H--1
					WHEN OTHERS => C_KEY := C_NULL; 
				END CASE;
			WHEN OTHERS => C_KEY := C_NULL; 
		END CASE;
		IF(C_KEY = C_NULL)THEN
			cols <= to_stdlogicvector(to_bitvector(cols) ror 1);
		END IF;
	ELSE
		IF(ROWS = "0000")THEN
			C_KEY := C_NULL;
		END IF;
	END IF;
 
	
        case current_state is

------------------- FUNCTION SET -------------------
             when S0 =>
                current_state <= S1;
                LCD_DATA        <= "00111100";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S1 =>
                current_state <= S2;
                LCD_DATA        <= "00111100";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';

------------------- CLEAR DISPLAY -------------------
             when S2 =>
                current_state <= S3;
                LCD_DATA        <= "00000001";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S3 =>
                current_state <= S4;
                LCD_DATA        <= "00000001";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';

------------------- RETURN HOME -------------------
             when S4 =>
                current_state <= S5;
                LCD_DATA        <= "00000011";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S5 =>
                current_state <= S6;
                LCD_DATA        <= "00000011";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';

------------------- ENTRY MODE SET -------------------
             when S6 =>
                current_state <= S7;
                LCD_DATA        <= "00000110";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S7 =>
                current_state <= S8;
                LCD_DATA        <= "00000110";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';

------------------- DISPLAY ON/OFF -------------------
             when S8 =>
                current_state <= S9;
                LCD_DATA        <= "00001111";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S9 =>
                LCD_DATA        <= "00001111";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';
				if(op = '0')then
					current_state <= S10;
				else
				if(del ='1') then
					del<='0';
					current_state <= S10;
				else
					ram(0) <= C_SPACE;
					ram(1) <= C_SPACE;
					ram(2) <= C_SPACE;
					ram(3) <= C_SPACE;
					ram(4) <= C_SPACE;
					ram(5) <= C_SPACE;
					ram(6) <= C_SPACE;
					ram(7) <= C_SPACE;
					ram(8) <= C_SPACE;
					ram(9) <= C_SPACE;
					ram(10) <= C_SPACE;
					ram(11) <= C_SPACE;
					ram(12) <= C_SPACE;
					ram(13) <= C_SPACE;
					ram(14) <= C_SPACE;
					ram(15) <= C_SPACE;
					ram(16) <= C_SPACE;
					ram(17) <= C_SPACE;
					ram(18) <= C_SPACE;
					ram(19) <= C_SPACE;
					ram(20) <= C_SPACE;
					ram(21) <= C_SPACE;
					ram(22) <= C_SPACE;
					ram(23) <= C_SPACE;
					ram(24) <= C_SPACE;
					ram(25) <= C_SPACE;
					ram(26) <= C_SPACE;
					ram(27) <= C_SPACE;
					ram(28) <= C_SPACE;
					ram(29) <= C_SPACE;
					ram(30) <= C_SPACE;
					ram(31) <= C_SPACE;
					current_state <= S14;
					end if;
				end if;

-------------------SHOW RAM -------------------
             when S10 =>

                current_state <= S11;
                LCD_DATA        <= ram(addr);
                LCD_ENABLE  <= '1';
                LCD_RS      <= '1';

             when S11 =>
                LCD_DATA        <= ram(addr);
                LCD_ENABLE  <= '0';
                LCD_RS      <= '1';
				if(addr<31)then
					addr <= addr+1;
					if(addr=15)then
						current_state <= S12;
					else
						current_state <= S10;
					end if;
				else
					current_state <= IDLE;
					addr <= 0;
				end if;

------------------- SEGUNDA LINEA -------------------
             when S12 =>
                current_state <= S13;
                LCD_DATA        <= x"C0";
                LCD_ENABLE  <= '1';
                LCD_RS      <= '0';

             when S13 =>
				if(op='0')THEN
					current_state <= S10;
                else
					current_state <= S14;
				end if;
				LCD_DATA        <= x"C0";
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';

------------------- WRITE RAM -------------------
             when S14 =>
				if(op='0')then
					current_state <= idle;
				else
					if(NOT(C_KEY = C_NULL) and addr <32) then
						ram(addr) <= C_KEY;
						current_state <= S15;
						
					END IF;
				end if;

             when S15 =>
                current_state <= S16;
                LCD_DATA        <= ram(addr);
                LCD_ENABLE  <= '1';
                LCD_RS      <= '1';

             when S16 =>
                LCD_DATA        <= ram(addr);
                LCD_ENABLE  <= '0';
                LCD_RS      <= '1';
				if(C_KEY = C_NULL)then
					if(addr=15)then
						current_state <= S12;
					else
						current_state <= S14;
					end if;
					addr <= addr + 1;
				end if;

------------------- REPOSO -------------------
				
             when IDLE  =>
                LCD_ENABLE  <= '0';
                LCD_RS      <= '0';
				LED1		<= '1';
				if(op = '1')then
					addr <= 0;
					current_state <= S0;
				else
					current_state <= IDLE;
				end if;
            when others =>
                current_state <= IDLE;
        end case;
	end if;
end process;


end lcdram0;
