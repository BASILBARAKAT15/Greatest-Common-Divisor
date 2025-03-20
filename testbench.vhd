library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity TB_MainDesign is
end TB_MainDesign;




Architecture TB_Main_Design of TB_MainDesign is


 component Main_Diesign 
  
  port(   
         number1 , number2:in std_logic_vector(4 downto 0);
        CLK              :in bit ;
        Reset            :in bit ;
        S                :in bit ;
        Digit0,Digit1    :out  std_logic_vector(3 downto 0);             
        
      );
end component;

signal number1,number2 :std_logic_vector(4 downto 0):=(others=>'0');
signal CLK,Reset,S : bit:='0';
signal  Digit0,Digit1 : std_logic_vector(3 downto 0):=(others=>'0');
constant CLK_period:time:=5 ns;

begin

UUT :

Main_Diesign port map(
          
               number1=>number1,                                             
               number2=>number2,
               CLK=>CLK,
               Reset=>Reset,
               S=>S,
               Digit0=>Digit0,
               Digit1=>Digit1
               
              ); 
              
CLK_Geneation:process
begin
  CLK<='0';
  wait for CLK_period;
  CLK<='1';
  wait for CLK_period;
  end process;
  



stim_process:process
begin
   
   Reset<='0';
   wait for CLK_period*5;
   Reset<='1';
   
   S<='1';
   number1<="01000";
   number2<="00100";
   
   
   
   
   wait for CLK_period*5;
     Reset<='0';
      wait for CLK_period*5;
   Reset<='1';
   wait for CLK_period*5;
   S<='1';
   number1<="10000";
   number2<="01000";
   
   
   
   
    wait for CLK_period*5;
     Reset<='0';
      wait for CLK_period*5;
   Reset<='1';
   wait for CLK_period*5;
   S<='1';
   number1<="01111";
   number2<="00101";
 
   
   
   
     wait for CLK_period*5;
     Reset<='0';
      wait for CLK_period*5;
   Reset<='1';
   wait for CLK_period*5;
   S<='1';
   number1<="01110";
   number2<="00100";
   
   
   
   
   
   
   
   
   wait ;
   
   
   
   
   
   
   end process;
   




end TB_Main_Design;