----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:34:16 04/27/2020 
-- Design Name: 
-- Module Name:    Microprocessor - Behavioral 
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
use work.mypackage.all;

entity Microprocessor is
	port( clk : in STD_LOGIC;
			reset : in STD_LOGIC);
end Microprocessor;

architecture Behavioral of Microprocessor is

component ALU8bit
    Port ( in1 : in  STD_LOGIC_VECTOR (7 downto 0);
           in2 : in  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           result : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component halfAdder 
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Carry : out  STD_LOGIC);
end component;

component rippleCarry8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  Cin : in STD_LOGIC;
           Sum  : out  STD_LOGIC_VECTOR (7 downto 0);
           Carry : out  STD_LOGIC);
end component;

component DataMem
port(
 Raddr: in std_logic_vector(7 downto 0); -- Address to read
 Waddr: in std_logic_vector(7 downto 0); -- Address to write
 datain: in std_logic_vector(7 downto 0); -- Data to write into 
 WRSig: in std_logic; -- Write enable 
 clk: in std_logic; -- clock input 
 dataout: out std_logic_vector(7 downto 0) -- Data output 
);
end component;

component PC 
	Port(
			D: in STD_LOGIC_VECTOR(7 downto 0);
			clk: in STD_LOGIC;
			reset: in STD_LOGIC := '1';
			Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component ControlUnit 
    Port ( opcode : in  STD_LOGIC_VECTOR (1 downto 0);
           InsType : in  STD_LOGIC_VECTOR (1 downto 0);
			  clk : in STD_LOGIC := '1';
           S0 : out  STD_LOGIC;
           S1 : out  STD_LOGIC_VECTOR(1 downto 0);
           S2 : out  STD_LOGIC;
           S3 : out  STD_LOGIC;
           S4 : out  STD_LOGIC;
           S5 : out  STD_LOGIC;
           S6 : out  STD_LOGIC_VECTOR(1 downto 0);
           memWrite : out  STD_LOGIC;
           WR : out  STD_LOGIC);
end component;

component RegisterFile 
	port(		
		clk: in std_logic;
		WRSig: in std_logic; -- Write enable 
		rsadd : in std_logic_vector(1 downto 0);    		   		
		rdadd : in std_logic_vector(1 downto 0);   		
		wdata : in std_logic_vector(7 downto 0);    	
		rsout: out std_logic_vector(7 downto 0));   	
end component;

component InstructionMem 
	port(
		 InstructionAddr: in std_logic_vector(7 downto 0); 
		 Instruction: out std_logic_vector(15 downto 0) 
		);
end component;

component MUX3x1 
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL3 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX2x1_8bit 
    Port ( inL1 : in  STD_LOGIC_VECTOR (7 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX2x1_2bit is
    Port ( inL1 : in  STD_LOGIC_VECTOR (1 downto 0);
           inL2 : in  STD_LOGIC_VECTOR (1 downto 0);
           S : in  STD_LOGIC;
           outL : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component InstructionDecoder 
    Port ( clk: in STD_LOGIC := '1';
			  Instruction : in  STD_LOGIC_VECTOR (15 downto 0);
	        Rreg, Wreg, OpRreg, OpC, InsType : out STD_LOGIC_VECTOR(1 downto 0);
			  ImmtoRegData, ImmtoMemData, opData: out STD_LOGIC_VECTOR (7 downto 0);
			  MemWAdd, MemRAdd : out STD_LOGIC_VECTOR(7 downto 0);
			  ALUsel: out STD_LOGIC_VECTOR(2 downto 0));
end component;

component DEMUX1x2 
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component DEMUX1x3 
    Port ( inL : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC_VECTOR (1 downto 0);
           outL1 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL2 : out  STD_LOGIC_VECTOR (7 downto 0);
           outL3 : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal pc_current, pc_next, ImmtoRegData, ImmtoMemData, opData, MemWAdd, MemRAdd, WAddr : STD_LOGIC_VECTOR(7 downto 0);
signal datain, dataout, Ro1, Ro2, Ro3, ALUout, Mo1, Mo2, Wdata, Rout, ALUop: STD_LOGIC_VECTOR(7 downto 0);
signal ins : STD_LOGIC_VECTOR(15 downto 0);
signal Rreg, Wreg, OpRreg, RsAddr, RdAddr, OpC, InsType : STD_LOGIC_VECTOR(1 downto 0);
signal ALUsel : STD_LOGIC_VECTOR(2 downto 0);
signal S0, S2, S3, S4, S5 : STD_LOGIC;
signal S1, S6 : STD_LOGIC_VECTOR(1 downto 0);
signal memWrite : STD_LOGIC;
signal WR, c :  STD_LOGIC;

begin
-- program counter and PC adder
ProgramCounter: PC port map(pc_next, clk, reset, pc_current);
pcadder: rippleCarry8bit port map(pc_current, x"01", '0', pc_next, c);  

-- Instruction memory read by address from PC
InsMem : InstructionMem port map(pc_current, ins);

-- Instruction from Instruction memory recieved and decoded 
InsDecod : InstructionDecoder port map(clk, ins, Rreg, Wreg, OpRreg, OpC, InsType, ImmtoRegData, ImmtoMemData, opData, MemWAdd, MemRAdd, ALUsel);

-- Using the Opcode and Instruction type from Instruction decoder
CU: ControlUnit port map(OpC, InsType, clk, S0, S1, S2, S3, S4, S5, S6, memWrite, WR);

-- selecting inputs to various components 
mux0: MUX2x1_2bit port map(Rreg, OpRreg, S0, RsAddr);
mux2: MUX2x1_8bit port map(Ro1, MemWAdd, S2, WAddr);
mux3: MUX2x1_8bit port map(ImmtoMemData, Ro2, S3, datain);

-- ALU operation using inputs from register and memory/immediate data
ALU: ALU8bit port map(Ro3, ALUop, ALUsel, ALUout);

-- Data memory
Memory: DataMem port map(MemRAdd, WAddr, datain, memWrite, clk, dataout);

-- deciding where the output from data memory must go
demux1: DEMUX1x2 port map(dataout, S5, Mo1, Mo2);

-- register file
RdAddr <= Wreg;
RF: registerFile port map(clk, WR, RsAddr, RdAddr, Wdata, Rout);

-- deciding where the data read from register file must go
demux2: DEMUX1x3 port map(Rout, S1, Ro3, Ro2, Ro1);

-- choosing second operand of ALU (from memory or immediate data)
mux4: MUX2x1_8bit port map(opData, Mo2, S4, ALUop);

-- choosing which data to write to register file.
mux6: MUX3x1 port map(ALUout, Mo1, ImmtoRegData, S6, Wdata);


end Behavioral;

