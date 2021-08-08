----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:24:30 04/25/2020 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
	Port(
			D: in STD_LOGIC_VECTOR(7 downto 0);
			clk: in STD_LOGIC;
			reset: in STD_LOGIC := '1';
			Q: out STD_LOGIC_VECTOR(7 downto 0));
end PC;

architecture Behavioral of PC is

begin

process(clk, reset)
begin
if reset = '1' then Q <= x"00";
elsif rising_edge(clk) then
	Q<=D;
end if;
end process;
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component PC 
	Port(
			D: in STD_LOGIC_VECTOR(7 downto 0);
			clk: in STD_LOGIC;
			Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;
end Package;

