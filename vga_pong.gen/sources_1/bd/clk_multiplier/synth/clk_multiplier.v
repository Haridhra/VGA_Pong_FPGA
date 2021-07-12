//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Feb  6 14:29:01 2021
//Host        : Harid-PC running 64-bit major release  (build 9200)
//Command     : generate_target clk_multiplier.bd
//Design      : clk_multiplier
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "clk_multiplier,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=clk_multiplier,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "clk_multiplier.hwdef" *) 
module clk_multiplier
   (i_clk_100M,
    i_rst,
    o_clk_148M,
    o_clk_lock);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.I_CLK_100M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.I_CLK_100M, CLK_DOMAIN clk_multiplier_i_clk_100M, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input i_clk_100M;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.I_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.I_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input i_rst;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.O_CLK_148M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.O_CLK_148M, CLK_DOMAIN /clk_multiplier_clk_out1, FREQ_HZ 148500000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output o_clk_148M;
  output o_clk_lock;

  wire clk_multiplier_clk_out1;
  wire clk_multiplier_locked;
  wire i_clk_100M_1;
  wire i_rst_1;

  assign i_clk_100M_1 = i_clk_100M;
  assign i_rst_1 = i_rst;
  assign o_clk_148M = clk_multiplier_clk_out1;
  assign o_clk_lock = clk_multiplier_locked;
  clk_multiplier_clk_wiz_0_0 clk_multiplier
       (.clk_in1(i_clk_100M_1),
        .clk_out1(clk_multiplier_clk_out1),
        .locked(clk_multiplier_locked),
        .reset(i_rst_1));
endmodule
