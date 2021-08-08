----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:28:37 04/18/2020 
-- Design Name: 
-- Module Name:    orG - Behavioral 
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

entity orG is
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end orG;

architecture Dataflow of orG is

begin

x <= A or B;

end Dataflow;

--architecture Behavioral of orG is
--
--begin
--
--process(A,B)
--begin
--if A='0' and B='0' then X<= '0';
--elsif A='1' and B='0' then X<= '1';  
--elsif A='0' and B='1' then X<= '1';
--elsif A='1' and B='1' then X<= '1';
--else X<='U';
--end if;
--end process;
--end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component orG 
    Port ( A : in  STD_LOGIC_VECTOR(7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           X : out  STD_LOGIC_VECTOR (7 downto 0));
end component;
end Package;

