library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_add is
  Port ( X, Y, Cin : in std_logic; -- for the X, Y, and carry coming in
         Cout, sum : out std_logic );
end full_add;

architecture Behavioral of full_add is

begin
    sum <= X xor Y xor Cin; -- xor for the sum bit
    
    -- carry when at least two inputs are 1
    Cout <= (X and Y) or (X and Cin) or (Y and Cin);
    
end Behavioral;
