library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
 
 
 entity BineryTOBCD is

port(     Data            : in  std_logic_vector(4 downto 0);

          Digit0,Digit1   :out  std_logic_vector(3 downto 0);
      );


end BineryTOBCD;


Architecture  Binery_TO_BCD  of  BineryTOBCD is

begin


process(Data)

        variable temp: integer;
 
begin


  temp:= conv_integer(Data);
  
  
  if (temp >= 0 and temp<= 31) then
  
    Digit0<=conv_std_logic_vector((temp mod 10),4);
    Digit1<=conv_std_logic_vector((temp / 10),4);
    
    else 
         Digit0<="0000";
         Digit1<="0000";  
  end if;

end process;

end Binery_TO_BCD ;



