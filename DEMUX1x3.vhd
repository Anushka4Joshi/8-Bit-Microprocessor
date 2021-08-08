----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:15:45 04/26/2020 
-- Design Name: 
-- Module Name:    DEMUX1x3 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DEMUX1x3 is
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL3 : out  STD_LOGIC_VECTOR (7 downto 0));
end DEMUX1x3;

architecture Behavioral of DEMUX1x3 is

begin
process(S, inL)
begin
	if S = "00" then outL1 <= inL; outL2 <= "UUUUUUUU";  outL3 <= "UUUUUUUU";
	elsif S = "01" then outL2 <= inL; outL1 <= "UUUUUUUU";  outL3 <= "UUUUUUUU";
	elsif S = "10" then outL3 <= inL; outL2 <= "UUUUUUUU";  outL1 <= "UUUUUUUU";
	else outL2 <= "UUUUUUUU";  outL3 <= "UUUUUUUU"; outL1 <= "UUUUUUUU";  
	end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component DEMUX1x3 
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL3 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;
