`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2021 11:22:40 PM
// Design Name: 
// Module Name: hvsync_tb
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

module hvsync_tb;

    reg i_clk_100M, i_reset;
    wire o_vga_hsync, o_vga_vsync, o_vga_R, o_vga_G, o_vga_B;
    
    hvsync_generator uut(
        .i_CLK_100MHZ(i_clk_100M),
        .i_reset,
        .o_vga_hsync,
        .o_vga_vsync,
        .o_vga_R,
        .o_vga_G,
        .o_vga_B
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
