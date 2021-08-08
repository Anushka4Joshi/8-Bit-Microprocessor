----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:48 04/26/2020 
-- Design Name: 
-- Module Name:    MUX3x1 - Behavioral 
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

entity MUX3x1 is
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL3 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX3x1;

architecture Behavioral of MUX3x1 is

begin
process(S, inL1, inL2, inL3)
begin
	if S = "00" then outL <= inL1;
	elsif S = "01" then outL <= inL2;
	elsif S = "10" then outL <= inL3;
	else outL <= "UUUUUUUU";
	end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component MUX3x1 
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL3 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;


