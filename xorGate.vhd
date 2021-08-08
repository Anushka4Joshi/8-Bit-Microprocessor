----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:53 02/13/2020 
-- Design Name: 
-- Module Name:    xorGate - dataFlow 
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

entity xorGate is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end xorGate;

architecture dataFlow of xorGate is
begin
X<= A xor B;
end dataFlow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component xorGate 
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end component;
end Package;

