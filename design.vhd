
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
 

entity Main_Diesign is

  port( number1 , number2:in std_logic_vector(4 downto 0);
        CLK              :in bit ;
        Reset            :in bit ;
        S                :in bit ;
        Digit0,Digit1    :out  std_logic_vector(3 downto 0);             
        );
        
        END Main_Diesign;
        


Architecture  MainDiesign  of  Main_Diesign is

signal GSD_w  :  std_logic_vector(4 downto 0);


component ASM
 port( number1 , number2:in std_logic_vector(4 downto 0);
        CLK              :in bit ;
        Reset            :in bit ;
        S                :in bit ;
        GSD              :out std_logic_vector(4 downto 0);
        );
        end component;
        
        
        
  component BineryTOBCD 
  
  port(   
          Data     : in  std_logic_vector(4 downto 0);
          Digit0   :out  std_logic_vector(3 downto 0);
          Digit1   :out  std_logic_vector(3 downto 0);
      );
end component;

begin


MODULE1: ASM

        port map(number1,number2,CLK,Reset,S,GSD_w);
        
        
MODULE2: BineryTOBCD

        port map(GSD_w,Digit0,Digit1);


  END MainDiesign;