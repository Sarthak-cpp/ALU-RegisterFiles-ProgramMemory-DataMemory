LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;
    USE IEEE.NUMERIC_STD.ALL;

--Data Memory Design
Entity DataMemory IS
	Port(
    	add: IN STD_LOGIC_VECTOR(5 downto 0);
        Wdat: IN STD_LOGIC_VECTOR(31 downto 0);
        Clk: IN STD_LOGIC;
        rdat: OUT STD_LOGIC_VECTOR(31 downto 0);
        wenable: IN STD_LOGIC_VECTOR(3 downto 0)
        );
End Entity;

--DataMemory Architecture
Architecture BEV of DataMemory IS

TYPE MEM IS ARRAY (63 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL MEMORY : MEM;
SIGNAL ADDR1 : INTEGER RANGE 0 TO 63;

Begin
	Process(Clk)
    Begin
    ADDR1<=CONV_INTEGER(add);
    rdat<=MEMORY(ADDR1);
    IF(rising_edge(Clk))Then
    	IF(wenable="0001")THEN
        	MEMORY(ADDR1)(7 downto 0)<=wdat(7 downto 0);
        ELSIF(wenable="0010")THEN
        	MEMORY(ADDR1)(15 downto 8)<=wdat(15 downto 8);
        ELSIF(wenable="0100")THEN
        	MEMORY(ADDR1)(23 downto 16)<=wdat(23 downto 16);
        ELSIF(wenable="1000")THEN
        	MEMORY(ADDR1)(31 downto 24)<=wdat(31 downto 24);
        ELSIF(wenable="0011")THEN
        	MEMORY(ADDR1)(15 downto 0)<=wdat(15 downto 0);
        ELSIF(wenable="0110")THEN
        	MEMORY(ADDR1)(23 downto 8)<=wdat(23 downto 8);
        ELSIF(wenable="1100")THEN
        	MEMORY(ADDR1)(31 downto 16)<=wdat(31 downto 16);
        ELSIF(wenable="0111")THEN
        	MEMORY(ADDR1)(23 downto 0)<=wdat(23 downto 0);
        ELSIF(wenable="1110")THEN
        	MEMORY(ADDR1)(31 downto 8)<=wdat(31 downto 8);
        ELSIF(wenable="1111")THEN
        	MEMORY(ADDR1)<=wdat;
        ELSIF(wenable="0101")THEN
        	MEMORY(ADDR1)(23 downto 16)<=wdat(23 downto 16);
            MEMORY(ADDR1)(7 downto 0)<=wdat(7 downto 0);
        ELSIF(wenable="1001")THEN
        	MEMORY(ADDR1)(31 downto 24)<=wdat(31 downto 24);
            MEMORY(ADDR1)(7 downto 0)<=wdat(7 downto 0);
        ELSIF(wenable="1010")THEN
        	MEMORY(ADDR1)(31 downto 24)<=wdat(31 downto 24);
            MEMORY(ADDR1)(15 downto 8)<=wdat(15 downto 8);
        ELSIF(wenable="1011")THEN
        	MEMORY(ADDR1)(31 downto 24)<=wdat(31 downto 24);
            MEMORY(ADDR1)(15 downto 0)<=wdat(15 downto 0);
        ELSIF(wenable="1101")THEN
        	MEMORY(ADDR1)(31 downto 16)<=wdat(31 downto 16);
            MEMORY(ADDR1)(7 downto 0)<=wdat(7 downto 0);
        END IF;
     End If;
  End Process;
END BEV;
        	