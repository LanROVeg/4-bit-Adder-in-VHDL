library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_add4 is
end tb_add4; -- no ports need for a testbench

architecture Test of tb_add4 is
    signal X, Y : std_logic_vector(3 downto 0) := "0000";
    signal Cin : std_logic := '0';
    signal S : std_logic_vector(3 downto 0);
    signal Cout : std_logic;
    
    component add4 is -- 4-bit adder component
        Port ( X, Y : in std_logic_vector(3 downto 0);
               Cin : in std_logic;
               sum : out std_logic_vector(3 downto 0);
               Cout : out std_logic );
    end component;
    
begin
    -- connects the test signals to the 4-bit adder
    DUT: add4 port map (X, Y, Cin, S, Cout);

    process
        variable test : unsigned(8 downto 0);
        variable sum : unsigned(4 downto 0);
    begin
        -- 512 tests for 9 inputs (X has 4, Y has 4, Cin has 1)
        for i in 0 to 511 loop
            test := to_unsigned(i, 9);
            X <= std_logic_vector(test(3 downto 0));
            Y <= std_logic_vector(test(7 downto 4));
            Cin <= test(8);
            -- I usually do 10 ns, but for 512 tests, 2 ns is much quicker
            wait for 2 ns;
            -- sum from the input numbers
            sum := to_unsigned(i mod 16 + (i / 16) mod 16 + i / 256, 5);
            -- low 4 bits are sum, bit 4 is Cout
            
            assert S = std_logic_vector(sum(3 downto 0)) report "bad sum";
            assert Cout = sum(4) report "bad carry-out";
        end loop;
        wait;
    end process;
    
end Test;
