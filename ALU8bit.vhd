----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:57:16 04/19/2020 
-- Design Name: 
-- Module Name:    ALU8bit - Behavioral 
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
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU8bit is
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end ALU8bit;

architecture Behavioral of ALU8bit is

-- components used for calculation
component AddSub8bit is
     Port ( A : in  STD_LOGIC_VECTOR (7 downto 0); 
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           k : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC);
end component;

component orG is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component xorGate is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component andg is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

signal s1, s2, d, a, b, s, x, y, z, n1, n2, x1, x2, x3, a1, a2, a3 : STD_LOGIC_VECTOR(7 downto 0);
signal bout, bin, c, cin : STD_LOGIC; 
begin

-- component initialisation
Adder: AddSub8bit port map (a, b, '0', '0', s, c);
Subtractor: AddSub8bit port map (s1, s2, '1', '1',  d, bout);
OrGate: orG port map (x, y, z);
exor: xorGate port map (x1, x2, x3);
ander: andg port map (a1, a2, a3);

process(sel, in1, in2, s, d, z, x3, a3)
begin

-- giving input to signals according to sel signal
case sel is
 when "000" =>
-- result<= in1 + in2; 
	a <= in1;
	b <= in2;
	result <= s;
 when "001" =>
-- result<= in1 - in2;
	s1 <= in1;
	s2 <= in2;
	result <= d;
 when "100" =>
-- result<= in1 and in2; 
	a1 <= in1;
	a2 <= in2;
	result <= a3;
 when "101" =>
-- result<= in1 or in2; 
	x <= in1;
	y <= in2;
	result <= z;
 when "111" =>
-- result<= in1 xor in2; 
	x1 <= in1;
	x2 <= in2;
	result <= x3;
 when others =>
 result <= "UUUUUUUU";
end case;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component ALU8bit 
Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
--			  clk : in STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;
