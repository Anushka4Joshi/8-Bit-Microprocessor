----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:41 04/21/2020 
-- Design Name: 
-- Module Name:    rippleCarry8bit - Behavioral 
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

entity rippleCarry8bit is
    generic(n: integer:= 8);
    Port ( A : in  STD_LOGIC_VECTOR(n-1 downto 0);
           B : in  STD_LOGIC_VECTOR(n-1 downto 0);
           Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR(n-1 downto 0);
           carry : out  STD_LOGIC);
end rippleCarry8bit;

architecture structural of rippleCarry8bit is

component fullAdder 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;
			  
signal c : std_logic_vector(n-2 downto 0);
begin
-- ripple carry 8 bit adder
G1 : fullAdder port map(A(0), B(0), Cin, sum(0), c(0));
Gn : for i in 1 to n-2 generate
	g : fullAdder port map(A(i), B(i), c(i-1), sum(i), c(i));
end generate;
Gmsb : fullAdder port map(A(n-1), B(n-1), c(n-2), sum(n-1), carry);

end structural;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component rippleCarry8bit 
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Sum  : out  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC);
end component;
end Package;

