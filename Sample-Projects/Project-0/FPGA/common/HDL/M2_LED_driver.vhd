----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/17/2023 08:20:55 PM
-- Design Name: 
-- Module Name: M2_LED_driver - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity M2_LED_driver is
    Port ( Din : in STD_LOGIC_VECTOR (31 downto 0);
           LED_M2_o : out STD_LOGIC;
           LED_M2_t : out STD_LOGIC;
           LED_M2_i : in STD_LOGIC);
end M2_LED_driver;

architecture Behavioral of M2_LED_driver is

-- Allow the Block Diagram to automatically recognise this as a GPIO bus
-- Have to use a GPIO interface, rather than a just a single 3-state output signal, to ensure
-- an OBUFT is instantiated in the top-level block diagram.
--
-- If use a single -state output signal then get the critical warning
-- "[Synth 8-5799] Converted tricell instance 'i_0' to logic" and the implementation is incorrect.
--
-- This is variant of the suggestions in answer records:
-- a. https://support.xilinx.com/s/article/000034588?language=en_US which suggests
--    to instantiate the IOBUF in reconfigurable module to replace the VHD code related
--    to the 3-state signal on the port.
-- a. https://support.xilinx.com/s/question/0D52E00006iHuBxSAK/tristate-logic-not-implemented-in-20164?language=en_US
--    which suggests to change from an "out-of-context" to "global" output product generation.
ATTRIBUTE X_INTERFACE_INFO:              STRING;
ATTRIBUTE X_INTERFACE_INFO of LED_M2_i: SIGNAL is "xilinx.com:interface:gpio_rtl:1.0 LED_M2 TRI_I";
ATTRIBUTE X_INTERFACE_INFO of LED_M2_o: SIGNAL is "xilinx.com:interface:gpio_rtl:1.0 LED_M2 TRI_O";
ATTRIBUTE X_INTERFACE_INFO of LED_M2_t: SIGNAL is "xilinx.com:interface:gpio_rtl:1.0 LED_M2 TRI_T";

begin

    -- Drive the M2 LED as an open-collector output
    LED_M2_o <= '0';
    LED_M2_t <= '0' when (Din(1)='1') else '1';

end Behavioral;
