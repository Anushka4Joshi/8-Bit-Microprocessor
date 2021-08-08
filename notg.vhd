----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:27 04/18/2020 
-- Design Name: 
-- Module Name:    notg - Behavioral 
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

entity notg is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end notg;

--architecture Behavioral of notg is
--
--begin
--process(A)
--begin
--if A='0' then X<= '1';
--elsif A='1' then X<= '0';
--else X<='U';
--end if;
--end process;
--end Behavioral;

architecture dataflow of notg is

begin
X<= not A;
end dataflow;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component notg is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           X : out  STD_LOGIC_VECTOR(7 downto 0));
end component;
end Package;
