Greatest Common Divisor (GCD) in VHDL  

##  Overview  
This project implements the **Greatest Common Divisor (GCD)** algorithm in **VHDL**. The design can be used in FPGA or ASIC applications and follows **BDD (Behavior-Driven Development)** and **TDD (Test-Driven Development)** methodologies.  

##  Features  
- Implements the **Euclidean Algorithm** to compute the GCD  
- Designed using **VHDL** for FPGA/ASIC implementation  
- Includes testbenches for **functional verification**  
- Can be synthesized using **Xilinx Vivado, Quartus, or ModelSim**  

##  Technologies Used  
- **VHDL** (for hardware description)  
- **Testbenches** for verification  
- **Simulation tools**: ModelSim, GHDL, Vivado, or Quartus  
- **BDD and TDD** methodologies  

##  Installation & Setup  
1. Clone the repository:  
   ```bash
   git clone https://github.com/BASILBARAKAT15/Greatest-Common-Divisor.git
   cd Greatest-Common-Divisor
   ```  
2. Open the project in your preferred **VHDL development environment** (ModelSim, Vivado, Quartus, etc.).  
3. Compile the VHDL files.  
4. Run simulations using the provided testbenches.  

## Usage  
The core VHDL module calculates the GCD of two numbers. Below is a basic implementation:  

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity GCD is
    Port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        a    : in  integer;
        b    : in  integer;
        gcd  : out integer
    );
end GCD;

architecture Behavioral of GCD is
begin
    process(clk, rst)
        variable x, y : integer;
    begin
        if rst = '1' then
            gcd <= 0;
        elsif rising_edge(clk) then
            x := a;
            y := b;
            while y /= 0 loop
                x := x mod y;
                x := x xor y;
                y := x xor y;
                x := x xor y;
            end loop;
            gcd <= x;
        end if;
    end process;
end Behavioral;
```

##  Testing  
To run the testbench:  
1. Compile the testbench file in **ModelSim, GHDL, or Vivado**.  
2. Run the simulation and verify the output waveform.  

Example testbench snippet:  
```vhdl
entity GCD_Test is;
end GCD_Test;

architecture Test of GCD_Test is
    signal clk, rst : std_logic := '0';
    signal a, b, result : integer;
begin
    UUT: entity work.GCD port map(clk, rst, a, b, result);
    
    process
    begin
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        
        a <= 56;
        b <= 98;
        wait for 100 ns;
        
        assert (result = 14) report "Test failed!" severity error;
        wait;
    end process;
end Test;
```

## License  
This project is open-source and available under the **MIT License**.
