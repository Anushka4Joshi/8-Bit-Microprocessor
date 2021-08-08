----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:00 04/25/2020 
-- Design Name: 
-- Module Name:    InstructionDecoder - Behavioral 
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

entity InstructionDecoder is
    Port ( clk: in STD_LOGIC := '1';
			  Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
	        Rreg, Wreg, OpRreg, OpC, InsType : out STD_LOGIC_VECTOR(1 downto 0);
			  ImmtoRegData, ImmtoMemData, opData: out STD_LOGIC_VECTOR (7 downto 0);
			  MemWAdd, MemRAdd : out STD_LOGIC_VECTOR(7 downto 0);
			  ALUsel: out STD_LOGIC_VECTOR(2 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
signal opcode: STD_LOGIC_VECTOR(1 downto 0);
signal lastByte, MemAdd, ImmData: STD_LOGIC_VECTOR(7 downto 0);
signal check: STD_LOGIC_VECTOR(1 downto 0);
begin
-- retrieving opcode from instruction
opcode(0) <= Instruction(14); 
opcode(1) <= Instruction(15); 

--retrieving last byte of instruction
lastByte(0) <= Instruction(0);
lastByte(1) <= Instruction(1);
lastByte(2) <= Instruction(2);
lastByte(3) <= Instruction(3);
lastByte(4) <= Instruction(4);
lastByte(5) <= Instruction(5);
lastByte(6) <= Instruction(6);
lastByte(7) <= Instruction(7);

--sub Instruction type check 
check(0) <= Instruction(12);
check(1) <= Instruction(13);

process(opcode, check)
begin
if (opcode = "00" and check = "00") then -- immediate to register data transfer

	-- retrieve register number
	Wreg(0) <= Instruction(10);
	Wreg(1) <= Instruction(11); 
	
	--	retrieving immediate data
	ImmtoRegData <= lastByte;  
	
elsif opcode = "00" and check = "01" then -- immediate data to memory data transfer

	--	retrieve register number pointing at memory location
	Rreg(0) <= Instruction(10);
	Rreg(1) <= Instruction(11);
	
	-- data to be transferred to memory pointed by register
	ImmtoMemData <= lastByte; 
	
elsif opcode = "00" and check = "10" then -- memory to register data transfer

	-- retrieve write register number
	Wreg(0) <= Instruction(10);
	Wreg(1) <= Instruction(11);
	
	-- retrieve read memory address
	MemRAdd <= lastByte;
	
elsif opcode = "00" and check = "11" then -- register to memory data transfer

	-- retrieve read register number
	Rreg(0) <= Instruction(10);
	Rreg(1) <= Instruction(11);
	
	-- retrieve write memory address
	MemWAdd <= lastByte;
	
elsif opcode = "01" and check(1) = '0' then -- ALU instruction with immediate operand
	
	-- get ALU select signal from instruction
	ALUsel(0) <= Instruction(10);
	ALUsel(1) <= Instruction(11);
	ALUsel(2) <= Instruction(12);
	
	
	-- get register address having operand
	OpRreg(0) <= Instruction(8);
	OpRreg(1) <= Instruction(9);
	
	-- get immediate operand
	opData <= lastByte; 
	
	-- destination register for storing result (same as operand register OpRreg)
	Wreg(0) <= Instruction(8);
	Wreg(1) <= Instruction(9);
	
elsif opcode = "01" and check(1) = '1' then -- ALU instruction with operand from memory

	-- get ALU select signal from instruction
	ALUsel(0) <= Instruction(10);
	ALUsel(1) <= Instruction(11);
	ALUsel(2) <= Instruction(12);
	
	-- get register address having operand
	OpRreg(0) <= Instruction(8);
	OpRreg(1) <= Instruction(9);

	-- get address of memory having operand
	MemRAdd <= lastByte;
	
	-- destination register for storing result (same as operand register OpRreg)
	Wreg(0) <= Instruction(8);
	Wreg(1) <= Instruction(9);

else Null;
end if;
end process;

-- to be sent to control unit
InsType(0) <= Instruction(12);
InsType(1) <= Instruction(13);
OpC <= opcode;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Package myPackage is
component InstructionDecoder 
    Port ( Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
	        Rreg, Wreg, OpRreg, OpC, InsType : out STD_LOGIC_VECTOR(1 downto 0);
			  ImmtoRegData, ImmtoMemData, opData: out STD_LOGIC_VECTOR (7 downto 0);
			  MemWAdd, MemRAdd : out STD_LOGIC_VECTOR(7 downto 0);
			  ALUsel, ALURd : out STD_LOGIC_VECTOR(2 downto 0));
end component;
end Package;
