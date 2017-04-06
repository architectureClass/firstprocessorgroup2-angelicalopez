----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:03 04/05/2017 
-- Design Name: 
-- Module Name:    procesador2 - Behavioral 
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

entity procesador2 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           salida : inout  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture Behavioral of procesador2 is


COMPONENT Suma
	PORT(
		Op1 : IN std_logic_vector(31 downto 0);
		Op2 : IN std_logic_vector(31 downto 0);          
		Result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
COMPONENT pc
	PORT(
		Data : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		clk : IN std_logic;          
		DataS : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;




	
COMPONENT InstructionMemory
	PORT(
		rst : IN std_logic;
		Direccion : IN std_logic_vector(31 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;COMPONENT RegisterFile
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rst : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;COMPONENT uC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salidaout : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;	
	
COMPONENT seu
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;COMPONENT mux
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);
		clase : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;COMPONENT alu
	PORT(
		suma1 : IN std_logic_vector(31 downto 0);
		suma2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		salida_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;


	
signal sumadorToNPC,npcToPC,pcToIM,imTorf,imTouc,imToseu,rfToalu,rfTomux,muxToalu,aluTorf,ucToalu,seuTomux: STD_LOGIC_VECTOR (31 downto 0);--creo senales de 32
signal alup_op1: STD_LOGIC_VECTOR (5 downto 0);--creo senales de 6	

 begin 
 
Inst_Suma: Suma PORT MAP(
		Op1 => "0000000000000000000000000000001",
		Op2 =>sumadorToNPC,
		Result =>npcToPC
	);





Inst_npc: pc PORT MAP(
		Data => npcToPC,
		rst => rst,
		clk => clk,
		DataS =>pcToIM	);







Inst_pc: pc PORT MAP(
		Data => npcToPC,
		rst => rst,
		clk => clk,
		DataS =>pcToIM
	);




Inst_InstructionMemory: InstructionMemory PORT MAP(
		rst => rst,
		Direccion =>pcToIM  ,
		Salida => imTorf
	);



Inst_RegisterFile: RegisterFile PORT MAP(
		rs1 => imTorf ( 18 downto 13),
		rs2 => imTorf (12 downto 0),
		rd =>   imTorf (29 downto 24),
		rst => rst,
		DWR => aluTorf,
		CRs1 => rfToalu,
		CRs2 => rfTomux
	);




Inst_uC: uC PORT MAP(
		op => imTorf (31 downto 30),
		op3 => imTofr (24 downto 19),
		salidaout => ucToalu 
	);



Inst_seu: seu PORT MAP(
		imm => imToseu,
		salida => seuTomux
	);


Inst_mux: mux PORT MAP(
		a => imTorf (13 downto 13),
		b => rfTomux,
		salida => muxToalu,
		clase => seuTomux
	);



	Inst_alu: alu PORT MAP(
		suma1 => muxToalu,
		suma2 => rfToalu,
		alu_op => ucToalu,
		salida_alu => aluTorf
	);

salida <= aluTorf;


end Behavioral;
