----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:11:06 04/26/2020 
-- Design Name: 
-- Module Name:    DEMUX1x2 - Behavioral 
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

entity DEMUX1x2 is
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0));
end DEMUX1x2;

architecture Behavioral of DEMUX1x2 is

begin
process(S, inL)
begin
	if S = '0' then outL1 <= inL; outL2 <= "UUUUUUUU";
	elsif S = '1' then outL2 <= inL; outL1 <= "UUUUUUUU";
	else outL1 <= "UUUUUUUU"; outL2 <= "UUUUUUUU";
	end if;
end process;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component DEMUX1x2 
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;

