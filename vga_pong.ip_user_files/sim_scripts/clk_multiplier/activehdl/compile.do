vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../vga_controller.gen/sources_1/bd/clk_multiplier/ipshared/d0f7" \
"S:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"S:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../vga_controller.gen/sources_1/bd/clk_multiplier/ipshared/d0f7" \
"../../../bd/clk_multiplier/ip/clk_multiplier_clk_wiz_0_0/clk_multiplier_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/clk_multiplier/ip/clk_multiplier_clk_wiz_0_0/clk_multiplier_clk_wiz_0_0.v" \
"../../../bd/clk_multiplier/sim/clk_multiplier.v" \

vlog -work xil_defaultlib \
"glbl.v"

