--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:54:54 04/01/2017
-- Design Name:   
-- Module Name:   D:/Procesador/tb_alu.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
--------------------------------------------------------------------------------LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_alu IS
END tb_alu;
 
ARCHITECTURE behavior OF tb_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Alu
    PORT(
         suma1 : IN  std_logic_vector(31 downto 0);
         suma2 : IN  std_logic_vector(31 downto 0);
         alu_op : IN  std_logic_vector(5 downto 0);
         salida_alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;    --Inputs
   signal suma1 : std_logic_vector(31 downto 0) := (others => '0');
   signal suma2 : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida_alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Alu PORT MAP (
          suma1 => suma1,
          suma2 => suma2,
          alu_op => alu_op,
          salida_alu => salida_alu
        );-- Stimulus process
   stim_proc: process
   begin		
	
	suma1 <= x"00000004";
	suma2 <= x"00000002";
		alu_op <= "000001";
     	

      wait;
   end process;

END;
	 
