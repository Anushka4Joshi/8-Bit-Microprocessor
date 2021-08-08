----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:32 04/26/2020 
-- Design Name: 
-- Module Name:    MUX2x1 - Behavioral 
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

entity MUX2x1_8bit is
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX2x1_8bit;

architecture Behavioral of MUX2x1_8bit is

begin
process(S, inL1, inL2)
begin
	if S = '0' then 
		outL <= inL1;
	elsif S = '1' then
		outL <= inL2;
	else outL <= "UUUUUUUU";
	end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component MUX2x1_8bit 
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;


