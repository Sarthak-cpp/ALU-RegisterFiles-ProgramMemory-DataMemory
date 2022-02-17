LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.NUMERIC_STD.ALL;

-- Register Design
Entity RegisterFiles IS
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
END ENTITY;

-- Register Architecture
ARCHITECTURE BEV OF RegisterFiles IS

TYPE MEM IS ARRAY (15 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MEMORY : MEM;
SIGNAL ADDR1 : INTEGER RANGE 0 TO 15;
SIGNAL ADDR2 : INTEGER RANGE 0 TO 15;
SIGNAL ADDR3 : INTEGER RANGE 0 TO 15;

Begin
	Process(Clk)
    Begin
    ADDR1<=CONV_INTEGER(ADD1);
    ADDR2<=CONV_INTEGER(ADD2);
    IF(WEnable = '1')THEN
    	IF(rising_edge(Clk))THEN
        	ADDR3<=CONV_INTEGER(WADD);
            MEMORY(ADDR3)<=DataInput;
        End IF;
    End If;
    Rdat1<=MEMORY(ADDR1);
    Rdat2<=MEMORY(ADDR2);
  End Process;
End BEV;
    
    	

        