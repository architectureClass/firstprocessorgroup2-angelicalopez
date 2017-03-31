library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity InstructionMemory is
    Port ( rst : in  STD_LOGIC;
           Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is


type rom_type   is array(63 downto 0) of std_logic_vector(31 downto 0);
impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;


signal dato : rom_type:=(others => "00000000000000000000000000000000");

begin
	process(rst,Direccion)
	begin
		if rst='1' then
			dato<=(others => "00000000000000000000000000000000");
			else
				salida<= dato(conv_integer(Direccion));
			
		end if;
	end process;
end Behavioral;

