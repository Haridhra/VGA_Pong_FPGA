vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  "+incdir+../../../../vga_controller.gen/sources_1/bd/clk_divider/ipshared/d0f7" \
"../../../bd/clk_divider/sim/clk_divider.v" \
"../../../bd/clk_divider/ip/clk_divider_clk_wiz_0_0_1/clk_divider_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/clk_divider/ip/clk_divider_clk_wiz_0_0_1/clk_divider_clk_wiz_0_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

