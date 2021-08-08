----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:35 04/27/2020 
-- Design Name: 
-- Module Name:    ControlUnit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity ControlUnit is
    Port ( opcode : in  STD_LOGIC_VECTOR (1 downto 0);
           InsType : in  STD_LOGIC_VECTOR (1 downto 0);
			  clk, reset : in STD_LOGIC := '1';
           S0 : out  STD_LOGIC;
           S1 : out  STD_LOGIC_VECTOR(1 downto 0);
           S2 : out  STD_LOGIC;
           S3 : out  STD_LOGIC;
           S4 : out  STD_LOGIC;
           S5 : out  STD_LOGIC;
           S6 : out  STD_LOGIC_VECTOR(1 downto 0);
           memWrite : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end ControlUnit;

architecture Behavioral of ControlUnit is

begin
process(opcode, InsType, clk)
begin
	if opcode = "00" then
		S5 <= '0';
		memWrite <= InsType(0);
		WR <= not InsType(0);
		if InsType = "00" then
			S6 <= "10";
			
			S0 <= 'U';
		   S1 <= "UU";
		   S2 <= 'U';
		   S3 <= 'U';
		   S4 <= 'U';
		elsif InsType = "01" then
			S0 <= '0';
			S1 <= "10";
			S2 <= '0';
			S3 <= '0';
			
			S4 <= 'U';
			S6 <= "UU";
		elsif InsType = "10" then
			S6 <= "01";
			
			S0 <= 'U';
			S1 <= "UU";
			S2 <= 'U';
			S3 <= 'U';
			S4 <= 'U';
		elsif InsType = "11" then
			S0 <= '0';
			S1 <= "01";
			S2 <= '1';
			S3 <= '1';
			
			S4 <= 'U';
			S6 <= "UU";
		else NULL;
		end if;
	elsif opcode = "01" then
		S0 <= '1';
		S5 <= '1';
		S1 <= "00";
		S6 <= "00";
		S4 <= InsType(1);
		WR <= '1';
		
	   S2 <= 'U';
	   S3 <= 'U';
	   memWrite <= 'U';
	elsif opcode = "10" then
		--HLT
	else NULL;
	end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component ControlUnit 
    Port ( opcode : in  STD_LOGIC_VECTOR (1 downto 0);
           InsType : in  STD_LOGIC_VECTOR (1 downto 0);
           S0 : out  STD_LOGIC;
           S1 : out  STD_LOGIC_VECTOR(1 downto 0);
           S2 : out  STD_LOGIC;
           S3 : out  STD_LOGIC;
           S4 : out  STD_LOGIC;
           S5 : out  STD_LOGIC;
           S6 : out  STD_LOGIC_VECTOR(1 downto 0);
           S7 : out  STD_LOGIC;
           memWrite : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end component;
end Package;

