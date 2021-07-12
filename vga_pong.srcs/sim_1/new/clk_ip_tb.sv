`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2021 09:00:24 PM
// Design Name: 
// Module Name: clk_ip_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define clk_period 10

module clk_ip_tb;

  reg i_clk_100M, i_reset;
  wire i_clk_25M, i_clk_lock;

  clk_divider uut(
      .i_clk_100M(i_clk_100M),
      .i_reset(i_reset),
      .o_clk_25M(i_clk_25M),
      .o_locked(i_clk_lock)
  );
  
  always begin
    #(`clk_period/2);
    i_clk_100M = ~i_clk_100M;
  end
  
  initial begin
    i_clk_100M = 1'b1;
    i_reset = 1'b1;
    #(`clk_period);
    i_reset = 1'b0;
    #(`clk_period);
  end

endmodule
