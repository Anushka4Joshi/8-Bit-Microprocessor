----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:56 04/25/2020 
-- Design Name: 
-- Module Name:    InstructionMem - Behavioral 
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

entity InstructionMem is
	port(
		 InstructionAddr: in std_logic_vector(7 downto 0); -- Address to read from
		 Instruction: out std_logic_vector(15 downto 0) -- Data output 
		);
end InstructionMem;

architecture Behavioral of InstructionMem is
type RAM_ARRAY is array (0 to 8) of std_logic_vector (15 downto 0); -- Size has been minimised for current execution to check the working
signal RAM: RAM_ARRAY := (
x"0170", --immediate to R0
x"1010", --immediate to memory pointed by R0
x"2470", -- memory to R1
x"3071", -- R0 to memory
x"4040", -- immediate Add
x"7170", -- memory and
x"4402", -- immediate subtract
x"7571", -- memory or
x"7c70"); -- memory xor 
--"UUUUUUUUUUUUUUUU",
--"UUUUUUUUUUUUUUUU"); 
begin
 Instruction <= RAM(to_integer(unsigned(InstructionAddr)));
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component InstructionMem 
	port(
		 InstructionAddr: in std_logic_vector(7 downto 0); -- Address to write/read RAM
--		 datain: in std_logic_vector(7 downto 0); -- Data to write into RAM
--		 WRSig: in std_logic; -- Write enable 
--		 clk: in std_logic; -- clock input for RAM
		 Instruction: out std_logic_vector(15 downto 0) -- Data output of RAM
		);
end component;
end Package;