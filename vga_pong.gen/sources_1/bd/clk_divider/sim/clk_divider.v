//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Feb  4 22:02:39 2021
//Host        : Harid-PC running 64-bit major release  (build 9200)
//Command     : generate_target clk_divider.bd
//Design      : clk_divider
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "clk_divider,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_divider,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "clk_divider.hwdef" *) 
module clk_divider
   (i_clk_100M,
    i_reset,
    o_clk_25M,
    o_locked);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_CLK_100M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_CLK_100M, CLK_DOMAIN clk_divider_i_clk_100M, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input i_clk_100M;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.I_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.I_RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input i_reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.O_CLK_25M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.O_CLK_25M, CLK_DOMAIN /clk_div_clk_out1, FREQ_HZ 25173010, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output o_clk_25M;
  output o_locked;

  wire clk_div_locked;
  wire i_clk_100M_1;
  wire i_reset_1;
  wire o_clk_25M;

  assign i_clk_100M_1 = i_clk_100M;
  assign i_reset_1 = i_reset;
  assign o_locked = clk_div_locked;
  clk_divider_clk_wiz_0_0 clk_div
       (.clk_in1(i_clk_100M_1),
        .clk_out1(o_clk_25M),
        .locked(clk_div_locked),
        .reset(i_reset_1));
endmodule
