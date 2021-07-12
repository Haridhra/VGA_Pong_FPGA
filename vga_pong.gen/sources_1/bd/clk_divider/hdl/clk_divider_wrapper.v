//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Feb  4 22:02:39 2021
//Host        : Harid-PC running 64-bit major release  (build 9200)
//Command     : generate_target clk_divider_wrapper.bd
//Design      : clk_divider_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clk_divider_wrapper
   (i_clk_100M,
    i_reset,
    o_clk_25M,
    o_locked);
  input i_clk_100M;
  input i_reset;
  output o_clk_25M;
  output o_locked;

  wire i_clk_100M;
  wire i_reset;
  wire o_clk_25M;
  wire o_locked;

  clk_divider clk_divider_i
       (.i_clk_100M(i_clk_100M),
        .i_reset(i_reset),
        .o_clk_25M(o_clk_25M),
        .o_locked(o_locked));
endmodule
