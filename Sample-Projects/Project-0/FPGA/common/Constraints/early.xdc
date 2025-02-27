# "Early" constraints file
# Evaluated before integrated IP


###############################################################################
# PCIe x4
###############################################################################

# Remove default placement first (otherwise the default LOC is applied)
#
# @todo This is necessary to get the correct PCIe pin placement when compiling under Linux, but worked without under Windows.
#       A side effect is 4 of the following Critical Warnings:
#         [Constraints 18-4427] You are overriding a physical property set by a constraint that originated in a read only source
#
#       Where the overriden physical properties are in project/project.gen/sources_1/bd/Top/ip/Top_xdma_0_0/ip_0/source/Top_xdma_0_0_pcie2_ip-PCIE_X0Y0.xdc
#       which is a generated IP constraint file.
set_property LOC "" [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property LOC "" [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[1].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property LOC "" [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[2].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property LOC "" [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[3].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]

# PCIe lane 0
set_property LOC GTPE2_CHANNEL_X0Y7 [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[3].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN A10 [get_ports {pcie_mgt_rxn[0]}]
set_property PACKAGE_PIN B10 [get_ports {pcie_mgt_rxp[0]}]
set_property PACKAGE_PIN A6 [get_ports {pcie_mgt_txn[0]}]
set_property PACKAGE_PIN B6 [get_ports {pcie_mgt_txp[0]}]

# PCIe lane 1
set_property LOC GTPE2_CHANNEL_X0Y6 [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN A8 [get_ports {pcie_mgt_rxn[1]}]
set_property PACKAGE_PIN B8 [get_ports {pcie_mgt_rxp[1]}]
set_property PACKAGE_PIN A4 [get_ports {pcie_mgt_txn[1]}]
set_property PACKAGE_PIN B4 [get_ports {pcie_mgt_txp[1]}]

# PCIe lane 2
set_property LOC GTPE2_CHANNEL_X0Y5 [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[2].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN C11 [get_ports {pcie_mgt_rxn[2]}]
set_property PACKAGE_PIN D11 [get_ports {pcie_mgt_rxp[2]}]
set_property PACKAGE_PIN C5 [get_ports {pcie_mgt_txn[2]}]
set_property PACKAGE_PIN D5 [get_ports {pcie_mgt_txp[2]}]

# PCIe lane 3
set_property LOC GTPE2_CHANNEL_X0Y4 [get_cells {Top_i/xdma_0/inst/Top_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[1].gt_wrapper_i/gtp_channel.gtpe2_channel_i}]
set_property PACKAGE_PIN C9 [get_ports {pcie_mgt_rxn[3]}]
set_property PACKAGE_PIN D9 [get_ports {pcie_mgt_rxp[3]}]
set_property PACKAGE_PIN C7 [get_ports {pcie_mgt_txn[3]}]
set_property PACKAGE_PIN D7 [get_ports {pcie_mgt_txp[3]}]

# PCIe refclock
set_property PACKAGE_PIN F6 [get_ports {pcie_clkin_clk_p[0]}]
set_property PACKAGE_PIN E6 [get_ports {pcie_clkin_clk_n[0]}]

# Other PCIe signals
set_property PACKAGE_PIN G1 [get_ports {pcie_clkreq_l}]
set_property IOSTANDARD LVCMOS33 [get_ports {pcie_clkreq_l}]
set_property PACKAGE_PIN J1 [get_ports pci_reset]
set_property IOSTANDARD LVCMOS33 [get_ports pci_reset]



