# "Normal" constraints file- not early not late


###############################################################################
# DDR
###############################################################################
# Note: Most of the pins are set in the constraints file created by MIG
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_clk_p]
set_property IOSTANDARD LVDS_25 [get_ports sys_clk_clk_n]

###############################################################################
# LEDs (4)
###############################################################################

set_property PACKAGE_PIN G3 [get_ports LED_A1]
set_property IOSTANDARD LVCMOS33 [get_ports LED_A1]
set_property PULLUP true [get_ports LED_A1]
set_property DRIVE 8 [get_ports LED_A1]

set_property PACKAGE_PIN H3 [get_ports LED_A2]
set_property IOSTANDARD LVCMOS33 [get_ports LED_A2]
set_property PULLUP true [get_ports LED_A2]
set_property DRIVE 8 [get_ports LED_A2]

set_property PACKAGE_PIN G4 [get_ports {LED_A3}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_A3}]
set_property PULLUP true [get_ports {LED_A3}]
set_property DRIVE 8 [get_ports {LED_A3}]

set_property PACKAGE_PIN H4 [get_ports {LED_A4}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_A4}]
set_property PULLUP true [get_ports {LED_A4}]
set_property DRIVE 8 [get_ports {LED_A4}]

###############################################################################
# M.2 LED signal
###############################################################################
set_property PACKAGE_PIN M1 [get_ports {LED_M2_tri_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED_M2_tri_io}]
set_property PULLUP true [get_ports {LED_M2_tri_io}]
set_property DRIVE 8 [get_ports {LED_M2_tri_io}]


###############################################################################
# SPI
###############################################################################
set_property PACKAGE_PIN P22 [get_ports {SPI_0_io0_io}]
set_property PACKAGE_PIN R22 [get_ports {SPI_0_io1_io}]
set_property PACKAGE_PIN P21 [get_ports {SPI_0_io2_io}]
set_property PACKAGE_PIN R21 [get_ports {SPI_0_io3_io}]

set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_io0_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_io1_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_io2_io}]
set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_io3_io}]

set_property PACKAGE_PIN T19 [get_ports {real_spi_ss}]
set_property IOSTANDARD LVCMOS33 [get_ports {real_spi_ss}]

set_property PACKAGE_PIN U21 [get_ports {SPI_0_ss_t}]
set_property IOSTANDARD LVCMOS33 [get_ports {SPI_0_ss_t}]


###############################################################################
# Analog inputs
###############################################################################

# The pin placement for the external Vaux14 input for TMON core, but need to set
# a compatible IO standand for pins in the same bank 35 to prevent errors when
# placing the design even though the IOSTANDARD does not affect the input programming.
# Vaux14 is set to unipolar with:
# a. The TMON_CORE signal connected to AD14P
# b. GND connected to AD14N
#
# The 7 Series FPGAs and Zynq-7000 SoC XADC Dual 12-Bit 1 MSPS Analog-to-Digital Converter User Guide
# https://www.xilinx.com/content/dam/xilinx/support/documents/user_guides/ug480_7Series_XADC.pdf
# shows that in unipolar mode Csample is between the Vp and Vn inputs, so both are set here.
set_property PACKAGE_PIN H2 [get_ports {TMON_CORE_v_p}]
set_property IOSTANDARD LVCMOS33 [get_ports {TMON_CORE_v_p}]
set_property PACKAGE_PIN G2 [get_ports {TMON_CORE_v_n}]
set_property IOSTANDARD LVCMOS33 [get_ports {TMON_CORE_v_n}]


###############################################################################
# Timing Constraints
###############################################################################

#create_clock -period 10.000 -name pcie_clkin [get_ports pcie_clkin_p]

###############################################################################
# Physical Constraints
###############################################################################

# Input reset is resynchronized within FPGA design as necessary
set_false_path -from [get_ports pci_reset]



###############################################################################
# Additional design / project settings
###############################################################################

# Power down on overtemp
set_property BITSTREAM.CONFIG.OVERTEMPPOWERDOWN ENABLE [current_design]

# High-speed configuration so FPGA is up in time to negotiate with PCIe root complex
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN Div-1 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]


