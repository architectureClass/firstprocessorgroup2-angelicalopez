----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:24 04/01/2017 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0);
           clase : in  STD_LOGIC);
end mux;

architecture Behavioral of mux is

begin
 process (a,b,clase) IS 
  begin
         case clase IS
           when '0' => salida <= a; --tierra
           when '1' => salida <= b; --rgb
           when  others => salida <= (others => '0');
         end case;
			
			end process;
			

end Behavioral;

