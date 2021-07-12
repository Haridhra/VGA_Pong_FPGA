//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Feb  6 14:29:01 2021
//Host        : Harid-PC running 64-bit major release  (build 9200)
//Command     : generate_target clk_multiplier_wrapper.bd
//Design      : clk_multiplier_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clk_multiplier_wrapper
   (i_clk_100M,
    i_rst,
    o_clk_148M,
    o_clk_lock);
  input i_clk_100M;
  input i_rst;
  output o_clk_148M;
  output o_clk_lock;

  wire i_clk_100M;
  wire i_rst;
  wire o_clk_148M;
  wire o_clk_lock;

  clk_multiplier clk_multiplier_i
       (.i_clk_100M(i_clk_100M),
        .i_rst(i_rst),
        .o_clk_148M(o_clk_148M),
        .o_clk_lock(o_clk_lock));
endmodule
