LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.NUMERIC_STD.ALL;

Entity testbench is
end entity;

architecture tb of testbench is
Signal ADD1: STD_LOGIC_VECTOR(3 downto 0):="0000";
Signal ADD2: STD_LOGIC_VECTOR(3 downto 0):="0000";
Signal WADD: STD_LOGIC_VECTOR(3 downto 0):="0000";
Signal Clk: STD_LOGIC:='0';
Signal WEnable: STD_LOGIC:='0';
Signal DataInput: STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
Signal Rdat1: STD_LOGIC_VECTOR(31 downto 0);
Signal Rdat2: STD_LOGIC_VECTOR(31 downto 0);

Component RegisterFiles is
		PORT(
    	ADD1: IN STD_LOGIC_VECTOR(3 downto 0);
        ADD2: IN STD_LOGIC_VECTOR(3 downto 0);
        WADD: IN STD_LOGIC_VECTOR(3 downto 0);
        Clk: IN STD_LOGIC;
        WEnable: IN STD_LOGIC;
        DataInput: IN STD_LOGIC_VECTOR(31 downto 0);
        Rdat1: OUT STD_LOGIC_VECTOR(31 downto 0);
        Rdat2: OUT STD_LOGIC_VECTOR(31 downto 0)
        );
end component;

begin

UUT: RegisterFiles port map(ADD1,ADD2,WADD,Clk,WEnable,DataInput,Rdat1,Rdat2);
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
	ADD1<="0000";
    ADD2<="0001";
    WADD<="0100";
    WEnable<='1';
    DataInput<="11000101111111001100001110101100";
    wait for 10 ns;
    
    ADD1<="0100";
    ADD2<="0010";
    WADD<="0010";
    wEnable<='1';
    DataInput<="11101111001011001110101111000001";
    wait;
    end process;
    end tb;