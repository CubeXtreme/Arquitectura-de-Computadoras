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

	CLK : in  STD_LOGIC
);
end lcdram00;

architecture lcdram0 of lcdram00 is

type state_type is (    S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, 
                            S10, S11, S12, S13, S14, S15, S16, S17,
                            S18, S19, S20, S21, S22, S23, S24, S25,
                            S26, S27, IDLE);
signal current_state: state_type;
signal a : std_logic := '0';
signal b : std_logic := '0';
 
 
 
BEGIN
 
LED1 <= a;
LED2 <= b;
 
PROCESS(CLK)
VARIABLE cnt: INTEGER RANGE 0 TO 1750000;
BEGIN
 
if rising_edge(CLK) then
 
    --Count Clock Ticks
    IF(cnt = 1750000)THEN       
        cnt := 0;
        a <= '0';
        b <= '1';
    ELSE
        cnt := cnt  + 1;
    END IF;
 
    --Slowly Move Into Next States
    IF(cnt = 1500000)THEN       
    --Next State Logic
        a <='1';
        b <='0';
        case current_state is
         
-------------------Function Set-------------------
             when S0 =>
                current_state <= S1;
                 
                LCD_DATA        <= x"38";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '0';
 
             when S1 =>
                current_state <= S2;
 
                LCD_DATA        <= x"38";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '0';
                 
             when S2 =>
                current_state <= S3;
 
                LCD_DATA        <= x"38";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '0';
 
-------------------Reset Display-------------------             
             when S3 =>
                current_state <= S4;
 
                LCD_DATA        <= "00000001";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '0';
                 
             when S4 =>
                current_state <= S5;
 
                LCD_DATA        <= "00000001";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '0';  
                 
             when S5 =>
                current_state <= S6;             
                 
                LCD_DATA        <= "00000001";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '0';
 
-------------------Display On-------------------                
             when S6 =>
                current_state <= S7;                 
 
                LCD_DATA        <= "00001110";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '0';
                 
             when S7 =>
                current_state <= S8;
     
                LCD_DATA        <= "00001110";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '0';
                 
             when S8 =>
                current_state <= S9; 
 
                LCD_DATA        <= "00001110";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';
                 
-------------------Write 'C'-------------------             
             when S9 =>
                current_state <= S10;            
 
                LCD_DATA        <= x"43";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S10 =>
                current_state <= S11;
 
                LCD_DATA        <= x"43";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
                 
-------------------Write 'P'-------------------             
             when S11 =>
                current_state <= S12;            
 
                LCD_DATA        <= x"50";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S12 =>
                current_state <= S13;
 
                LCD_DATA        <= x"50";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write 'L'-------------------             
             when S13 =>
                current_state <= S14;            
 
                LCD_DATA        <= x"4C";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S14 =>
                current_state <= S15;
 
                LCD_DATA        <= x"4C";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write 'D'-------------------             
             when S15 =>
                current_state <= S16;            
 
                LCD_DATA        <= x"44";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S16 =>
                current_state <= S17;
 
                LCD_DATA        <= x"44";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write 's'-------------------             
             when S17 =>
                current_state <= S18;            
 
                LCD_DATA        <= x"73";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S18 =>
                current_state <= S19;
 
                LCD_DATA        <= x"73";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write ' '-------------------             
             when S19 =>
                current_state <= S20;            
 
                LCD_DATA        <= x"20";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S20 =>
                current_state <= S21;
 
                LCD_DATA        <= x"20";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write ':'-------------------             
             when S21 =>
                current_state <= S22;            
 
                LCD_DATA        <= x"3A";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S22 =>
                current_state <= S23;
 
                LCD_DATA        <= x"3A";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';      
-------------------Write 'D'-------------------             
             when S23 =>
                current_state <= S24;            
 
                LCD_DATA        <= x"44";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S24 =>
                current_state <= S25;
 
                LCD_DATA        <= x"44";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';
-------------------Write ' '-------------------             
             when S25 =>
                current_state <= S26;            
 
                LCD_DATA        <= x"20";
                 
                LCD_ENABLE  <= '1';
                 
                LCD_RS      <= '1';      
                 
             when S26 =>
                current_state <= S27;
 
                LCD_DATA        <= x"20";
                 
                LCD_ENABLE  <= '0';
                 
                LCD_RS      <= '1';
                 
             when S27=>
                current_state <= IDLE;               
                 
             when IDLE  =>
                current_state <= IDLE;
                 
            when others =>
                current_state <= IDLE;        
     
        end case;   
 
    END IF;
 
end if;
end process;
end lcdram0;