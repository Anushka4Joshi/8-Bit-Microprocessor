----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:51:37 02/18/2020 
-- Design Name: 
-- Module Name:    fullAdder - Structural 
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

entity fullAdder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end fullAdder;

architecture dataflow of fullAdder is
begin
sum <= A xor B xor C;
carry <= (A and B) or (B and C) or (C and A);
end dataflow;

--architecture Structural of fullAdder is
--component halfAdder
--Port ( A : in  STD_LOGIC;
--           B : in  STD_LOGIC;
--           Sum : out  STD_LOGIC;
--           Carry : out  STD_LOGIC);
--end component;
--signal t1, c1, c2: STD_LOGIC;
--begin
--G1 : halfAdder port map(A, B, t1, c1);
--G2 : halfAdder port map(t1, C, sum, c2);
--carry <= c1 or c2;
--end Structural;
--
--architecture behavioural of fullAdder is
--begin
--process(A, B, C)
--begin
--if A='0' and B='0' and C='0' then 
--sum <= '0';
--carry <= '0';
--elsif (A='0' and B='0' and C='1') or (A='0' and B='1' and C='0') or (A='1' and B='0' and C='0') then 
--sum <= '1';
--carry <= '0';
--elsif (A='0' and B='1' and C='1') or (A='1' and B='0' and C='1') or (A='1' and B='1' and C='0') then 
--sum <= '0';
--carry <= '1';
--elsif A='1' and B='1' and C='1' then 
--sum <= '1';
--carry <= '1';
--else 
--sum <= 'U';
--carry <= 'U';
--end if;
--end process;
--end behavioural;





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component fullAdder
Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;
end Package;


