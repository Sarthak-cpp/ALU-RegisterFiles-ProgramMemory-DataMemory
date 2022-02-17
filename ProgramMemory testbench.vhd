-- TestBench for Program Memory
LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.NUMERIC_STD.ALL;
    
entity testbench is
end testbench;

architecture tb of testbench is
signal add : STD_LOGIC_VECTOR(5 downto 0);
signal RDat : STD_LOGIC_VECTOR(31 downto 0);

       
component ProgramMemory is
port(
	add: IN STD_LOGIC_VECTOR(5 downto 0);
    RDat: OUT STD_LOGIC_VECTOR(31 downto 0)
    );
end component;

begin
	DUT: ProgramMemory port map(add,RDat);
    
    process
    begin
    	add<="000000";
        wait for 10 ns;
        add<="000010";
        wait for 10 ns;
        add<="111111";
        wait;
        end process;
end tb;
    