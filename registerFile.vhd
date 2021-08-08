----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:31 04/22/2020 
-- Design Name: 
-- Module Name:    registerFile - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RegisterFile is	
	port(		
		clk: in std_logic;
		WRSig: in std_logic; -- Write enable 
		rsadd : in std_logic_vector(1 downto 0); -- Read register number  		   		
		rdadd : in std_logic_vector(1 downto 0);  -- Write register number
		wdata : in std_logic_vector(7 downto 0);  -- Write data
		rsout: out std_logic_vector(7 downto 0));   -- read data		
end RegisterFile;

architecture behavioral of RegisterFile is
type registers is array(0 to 3) of std_logic_vector(7 downto 0);


signal reg: registers;

begin
process(clk)	
begin	
	if falling_edge(clk) and WRsig = '1'  then
	
		if rdadd /= "UU" then			
			reg(to_integer(unsigned(rdadd))) <= wdata;
		end if;	
		
	end if;
end process;
	
rsout <= "UUUUUUUU" when rsadd = "UU" else reg(to_integer(unsigned(rsadd))); 

end behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--
--Package myPackage is
--component RegisterFile 
--	port(		
--		clk: in std_logic;
--		WRSig: in std_logic; -- Write enable 
--		rsadd : in std_logic_vector(2 downto 0);    		   		
--		rdadd : in std_logic_vector(2 downto 0);   		
--		wdata : in std_logic_vector(7 downto 0);    	
--		rsout: out std_logic_vector(7 downto 0));   	
--end component;
--end Package;

