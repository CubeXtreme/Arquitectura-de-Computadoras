library ieee;
use ieee.std_logic_1164.all;
 
entity signo00 is
   port(vector_entrada: in std_logic_vector(7 downto 0);
        vector_salida:  out std_logic_vector(15 downto 0));
end signo00;

architecture signo0 of signo00 is
signal vector_auxiliar: std_logic_vector(15 downto 0);

begin

   vector_auxiliar <= "00000000"&vector_entrada when vector_entrada(7) = '0' else "11111111"&vector_entrada;
   vector_salida <= vector_auxiliar; 

end signo0;  