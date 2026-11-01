library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add4 is
  -- this adds two 4-bit numbers and a carry in
  Port ( X, Y : in std_logic_vector(3 downto 0);
         Cin : in std_logic;
         sum : out std_logic_vector(3 downto 0);
         Cout : out std_logic );
end add4;

architecture Structural of add4 is
    -- carry bits to connect one adder to the next
    signal c0, c1, c2 : std_logic;
    
    component full_add is -- full adder component
        Port ( X, Y, Cin : in std_logic;
               Cout, sum : out std_logic );
    end component;
    
begin
    -- Carry ripples from the least-significant bit to the final Cout.
    FA0: full_add port map (X(0), Y(0), Cin, c0, sum(0));
    FA1: full_add port map (X(1), Y(1), c0, c1, sum(1));
    FA2: full_add port map (X(2), Y(2), c1, c2, sum(2));
    FA3: full_add port map (X(3), Y(3), c2, Cout, sum(3));

end Structural;
