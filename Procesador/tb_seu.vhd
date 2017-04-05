--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:15:13 04/01/2017
-- Design Name:   
-- Module Name:   D:/Procesador/tb_seu.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: seu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_seu IS
END tb_seu;
 
ARCHITECTURE behavior OF tb_seu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seu
    PORT(
         imm : IN  std_logic_vector(12 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seu PORT MAP (
          imm => imm,
          salida => salida
        );


 

   -- Stimulus process
   stim_proc: process
   		
     begin		
     imm <= "0000000000001";
		
		wait for 30 ns;
		
		imm <= "0000000000010";
		
		wait for 30 ns;
		
		imm <= "1000000000010";
		
		wait for 30 ns;
		
		imm <= "1100000000011";
		
		wait for 30 ns;
		


     

      wait;
   end process;

END;
