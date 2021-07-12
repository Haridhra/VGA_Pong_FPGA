vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../vga_controller.gen/sources_1/bd/clk_divider/ipshared/d0f7" \
"../../../bd/clk_divider/sim/clk_divider.v" \
"../../../bd/clk_divider/ip/clk_divider_clk_wiz_0_0_1/clk_divider_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/clk_divider/ip/clk_divider_clk_wiz_0_0_1/clk_divider_clk_wiz_0_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

