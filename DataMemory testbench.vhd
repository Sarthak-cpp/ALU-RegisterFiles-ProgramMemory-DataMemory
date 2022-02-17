LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.NUMERIC_STD.ALL;
    
Entity testbench is
end testbench;

architecture tb of testbench is
Signal add: STD_LOGIC_VECTOR(5 downto 0):="000000";
Signal Wdat: STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
Signal Clk: STD_LOGIC:='0';
SIGNAL rdat: STD_LOGIC_VECTOR(31 downto 0);
Signal wenable: STD_LOGIC_VECTOR(3 downto 0):="0000";

Component DataMemory is
	Port(
    	add: IN STD_LOGIC_VECTOR(5 downto 0);
        Wdat: IN STD_LOGIC_VECTOR(31 downto 0);
        Clk: IN STD_LOGIC;
        rdat: OUT STD_LOGIC_VECTOR(31 downto 0);
        wenable: IN STD_LOGIC_VECTOR(3 downto 0)
        );
end component;

begin

UUT: DataMemory PORT MAP(add,Wdat,Clk,rdat,wenable);

Clock: Process
begin
	Clk<='0';
    wait for 5 ns;
    Clk<='1';
    wait for 5 ns;
end process;

Process
begin
wait for 15 ns;
	add<="001001";
    wenable<="1111";
    Wdat<="11000101111111001100001110101100";
    wait for 10 ns;
    
    add<="010101";
    wenable<="1010";
    Wdat<="11101111001011001110101111000001";
    wait;
    end process;
    end tb;