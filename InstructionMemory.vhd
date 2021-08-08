----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:43:52 04/22/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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
USE ieee.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory is
port(
 addr: in std_logic_vector(7 downto 0); -- Address to write/read RAM
 --datain: in std_logic_vector(15 downto 0); -- Data to write into RAM
 --WRSig: in std_logic; -- Write enable 
 clk: in std_logic; -- clock input for RAM
 dataout: out std_logic_vector(15 downto 0) -- Data output of RAM
);
end InstructionMemory;

architecture Behavioral of InstructionMemory is
type RAM_ARRAY is array (0 to 256 ) of std_logic_vector (15 downto 0);
signal RAM: RAM_ARRAY;
begin
process(clk)
begin
-- if(rising_edge(clk)) then
-- if(WRSig='1') then  
-- RAM(to_integer(unsigned(addr))) <= datain;
-- end if;
-- end if;
end process; 
 dataout <= RAM(to_integer(unsigned(addr)));
end Behavioral;