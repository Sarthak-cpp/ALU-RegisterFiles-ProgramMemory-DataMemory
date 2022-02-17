library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity testbench is
end entity;

architecture tb of testbench is

signal op1: STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
signal op2: STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
signal result: STD_LOGIC_VECTOR(31 downto 0);
signal carryin: STD_LOGIC:='1';
Signal carryout: STD_LOGIC;
SIGNAL op: STD_LOGIC_VECTOR(3 downto 0):="0000";

component ALU is
PORT(
    	op1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        op2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        result: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        carryin: IN STD_LOGIC;
        carryout: OUT STD_LOGIC;
    	op: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
end component;

begin
	UUT: ALU port map(op1,op2,result,carryin,carryout,op);
    process
    begin
    	wait for 5 ns;
    	op1<="10000111010111000011011101100110";
        op2<="11010000110111110100010000011000";
        carryin<='1';
        op<="0000";
        wait for 10 ns;
        op<="0001";
        wait for 10 ns;
        op<="0010";
        wait for 10 ns;
        op<="0011";
        wait for 10 ns;
        op<="0100";
        wait for 10 ns;
        op<="0101";
        wait for 10 ns;
        op<="0110";
        wait for 10 ns;
        op<="0111";
        wait for 10 ns;
        op<="1100";
        wait for 10 ns;
        op<="1111";
        wait;
        end process;
        end tb;
        