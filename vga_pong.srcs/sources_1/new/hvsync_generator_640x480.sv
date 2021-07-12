`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2021 11:23:08 PM
// Design Name: 
// Module Name: hvsync_generator
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

module hvsync_generator_640x480(
    input i_clk_25M,
    input i_rst,
    output [9:0] o_counterX,
    output [9:0] o_counterY,
    output o_hsync,
    output o_vsync,
    output reg o_inDispArea
    );
    
    reg r_hsync, r_vsync;
    
    reg[9:0] r_counterX = 0;
    reg[9:0] r_counterY = 0;
    
    wire w_counterXmaxed = (r_counterX == 800) ? 1'b1 : 1'b0; // 16 + 48 + 96 + 640
    wire w_counterYmaxed = (r_counterY == 525) ? 1'b1 : 1'b0; // 10 + 2 + 33 + 480
        
    always @(posedge i_clk_25M)
    begin
        if(w_counterXmaxed)
        begin
            r_counterX <= 0;
        end
        else
        begin
            r_counterX <= r_counterX + 1;
        end
    end
    
    always @(posedge i_clk_25M)
    begin
        if(w_counterXmaxed)
        begin
            if(w_counterYmaxed)
            begin
                r_counterY <= 0;
            end
            else
            begin
                r_counterY <= r_counterY + 1;
            end
         end
    end
    
    always @(posedge i_clk_25M)
    begin
        r_hsync <= (r_counterX > (640 + 16) && (r_counterX < (640 + 16 + 96)));   // active for 96 clocks
        r_vsync <= (r_counterY > (480 + 10) && (r_counterY < (480 + 10 + 2)));   // active for 2 clocks
    end
    
    always @(posedge i_clk_25M)
    begin
        o_inDispArea <= (r_counterX < 640) && (r_counterY < 480);
    end
    
    assign o_counterX = r_counterX;
    assign o_counterY = r_counterY;
    assign o_hsync = ~r_hsync;
    assign o_vsync = ~r_vsync;
    
endmodule
