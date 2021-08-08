----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:52:00 05/02/2020 
-- Design Name: 
-- Module Name:    AddSub8bit - Behavioral 
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

entity AddSub8bit is
	 generic(n: integer:= 8);
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cin : in  STD_LOGIC;
           k : in  STD_LOGIC; -- 0 => add | 1 and cin =1 => subtract
           result : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC);
end AddSub8bit;

architecture Behavioral of AddSub8bit is

component fullAdder 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;

component xorGate1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           X : out  STD_LOGIC);
end component;

signal t,c : STD_LOGIC_VECTOR(7 downto 0);
begin
G1 : xorGate1 port map(k, B(0), t(0));
G1n : for i in 1 to n-2 generate
	g : xorGate1 port map(k, B(i), t(i));
end generate;
G1msb : xorGate1 port map(k, B(n-1), t(n-1));

G2 : fullAdder port map(A(0), t(0), Cin, result(0), c(0));
G2n : for i in 1 to n-2 generate
	g : fullAdder port map(A(i), t(i), c(i-1), result(i), c(i));
end generate;
G2msb : fullAdder port map(A(n-1), t(n-1), c(n-2), result(n-1), c(n-1));

Cout <= c(7);

end Behavioral;

