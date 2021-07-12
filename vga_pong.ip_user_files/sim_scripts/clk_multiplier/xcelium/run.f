-makelib xcelium_lib/xpm -sv \
  "S:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "S:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/clk_multiplier/ip/clk_multiplier_clk_wiz_0_0/clk_multiplier_clk_wiz_0_0_clk_wiz.v" \
  "../../../bd/clk_multiplier/ip/clk_multiplier_clk_wiz_0_0/clk_multiplier_clk_wiz_0_0.v" \
  "../../../bd/clk_multiplier/sim/clk_multiplier.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

