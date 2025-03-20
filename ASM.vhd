library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;



entity ASM is

port(
      number1,number2     : in std_logic_vector(4 downto 0);
      
      CLK,Reset,S         : in  bit;
      
      GSD                 : out std_logic_vector(4 downto 0);
);

end ASM;


Architecture ASM_Arch of ASM is

  signal A,B,R,GSD_S : unsigned(4 downto 0):=(others=>'0');
  type state_type is (S0,S1,S2,S3,S4,S5,S6,S7);
  signal current_state,next_state : state_type;

begin


process(Reset, CLK)
    variable A1, B1, R1, GSD1 : integer;
begin
    if Reset = '0' then
        current_state <= S0;
        A1 := 0;
        B1 := 0;
        R1 := 0;
        GSD1 := 0;
    elsif CLK'event and CLK = '1' then
    
    
        if current_state = S2 then
            A1 := to_integer(unsigned(number1));
            B1 := to_integer(unsigned(number2));
            R1 := 0;
            
            
        elsif current_state = S4 then
           -- R1 := (A1 - (A1 / B1)) + 1 * B1;
              R1:= A1 mod B1;
              
              
        elsif current_state = S5 then
            A1 := B1;
            
            
        elsif current_state = S6 then
            B1 := R1;
            
        elsif current_state = S7 then
            GSD1 := A1;
        end if;

        current_state <= next_state;
        A <= (to_unsigned(A1, 5));
        B <= (to_unsigned(B1, 5));
        R <= (to_unsigned(R1, 5));
        GSD_S <=(to_unsigned(GSD1, 5));
    end if;
end process;






--PROCESS CALCULAT THE CURRENT_STATE 

process(current_state,A,B,S)
      

begin

     case current_state is
         
         when S0 =>
              
           next_state<=S1;
           
         
         when S1 =>
          
          if S='0' then next_state<=S1;
          else next_state<=S2;
          end if;
          
        when S2=> next_state<=S3;
        
        
        when S3=> 
             if  B="00000" then next_state<=S7;
              else next_state<=S4;
              end if;
              
        when S4=> next_state<=S5;
        
        when S5=> next_state<=S6;
        
        when S6=> next_state<=S3;
        
        when S7=> next_state<=S1; 
        
        
        
          

end case;


end process;

GSD<=std_logic_vector(GSD_S);


 

end ASM_Arch;
 