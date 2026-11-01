library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use std.env.all;

entity tb_full is
end tb_full; -- no ports needed for a test bench

architecture Test of tb_full is
    signal X, Y, Cin : std_logic := '0';
    signal Cout, S : std_logic;
    
    component full_add is -- full adder component
        Port ( X, Y, Cin : in std_logic;
               Cout, sum : out std_logic );
    end component;
    
begin
 -- connects the test signals to the adder
    DUT: full_add port map (X, Y, Cin, Cout, S);

    process
        variable test : unsigned(2 downto 0);
        variable sum : unsigned(1 downto 0);
    begin
        for i in 0 to 7 loop -- 8 tests for 3 inputs (X, Y, Cin)
            test := to_unsigned(i, 3);
            X <= test(0);
            Y <= test(1);
            Cin <= test(2);
            wait for 10 ns;
            -- sum from the input numbers
            sum := to_unsigned((i mod 2) + ((i / 2) mod 2) + (i / 4), 2);
            -- stop if either output is wrong
            assert S = sum(0) report "bad sum" severity failure;
            assert Cout = sum(1) report "bad carry-out" severity failure;
        end loop;
        report "PASS: full adder 8 exhaustive binary cases";
        finish;
    end process;
end Test;
