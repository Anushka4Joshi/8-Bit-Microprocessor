----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:37 04/25/2020 
-- Design Name: 
-- Module Name:    DataMem - Behavioral 
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

entity DataMem is
port(
 Raddr: in std_logic_vector(7 downto 0); -- Address to read 
 Waddr: in std_logic_vector(7 downto 0); -- Address to write
 datain: in std_logic_vector(7 downto 0); -- Data to write into 
 WRSig: in std_logic; -- Write enable 
 clk: in std_logic; -- clock input 
 dataout: out std_logic_vector(7 downto 0) -- Data output 
);
end DataMem;

architecture Behavioral of DataMem is

type RAM_ARRAY is array (0 to 255 ) of std_logic_vector (7 downto 0); 

signal RAM: RAM_ARRAY;

begin
process(clk)
begin
 if(falling_edge(clk)and WRSig='1') then -- condition for writing to memory
 
	if Waddr /= "UUUUUUUU" then -- write only when Write address is availible
	 RAM(to_integer(unsigned(Waddr))) <= datain;
	end if;
	
 end if;
end process; 

dataout <= "UUUUUUUU" when Raddr = "UUUUUUUU" else RAM(to_integer(unsigned(Raddr))); -- read anytime

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component DataMem
port(
 Raddr, Waddr: in std_logic_vector(7 downto 0); -- Address to write/read RAM
 datain: in std_logic_vector(7 downto 0); -- Data to write into RAM
 WRSig: in std_logic; -- Write enable 
 clk: in std_logic; -- clock input for RAM
 dataout: out std_logic_vector(7 downto 0) -- Data output of RAM
);
end component;
end Package;
