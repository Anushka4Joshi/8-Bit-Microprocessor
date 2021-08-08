----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:52 02/13/2020 
-- Design Name: 
-- Module Name:    halfAdder - Behavioral 
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

entity halfAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end halfAdder;

--architecture Structural of halfAdder is
--component andGate
--Port ( A : in  STD_LOGIC;
--           B : in  STD_LOGIC;
--           X : out  STD_LOGIC);
--end component;
--
--component xorGate
--Port ( A : in  STD_LOGIC;
--           B : in  STD_LOGIC;
--           X : out  STD_LOGIC);
--end component;
--begin
--G1: andGate port map(A, B, Carry);
--G2: xorGate port map (A, B, Sum); 
--
--end Structural;

architecture Dataflow of halfAdder is
begin
Sum <= A xor B;
Carry <= A and B;
end Dataflow;

--architecture behavioural of halfAdder is
--begin
--process(A,B)
--begin
--if(A='0' and B='0') then 
--sum <= '0';
--carry <= '0';
--elsif(A='1' and B='1') then
--sum <= '0';
--carry <= '1';
--elsif(A='1' and B='0')or(A='0' and B='1') then
--sum <= '1';
--carry <= '0';
--else sum<= 'U';
--carry <= 'U';
--end if;
--end process;
--end behavioural;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component halfAdder 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end component;
end Package;

