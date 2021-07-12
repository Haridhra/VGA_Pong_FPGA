`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 02:15:31 PM
// Design Name: 
// Module Name: hvsync_generator_1920x1080
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


module hvsync_generator_1920x1080(
    input i_clk_148M,
    input i_rst,
    output [11:0] o_counterX,
    output [10:0] o_counterY,
    output o_hsync,
    output o_vsync,
    output reg o_inDispArea
    );
    
    reg r_hsync, r_vsync;
    
    reg[11:0] r_counterX = 0;
    reg[10:0] r_counterY = 0;
    
    wire w_counterXmaxed = (r_counterX == 2200); // 88 + 44 + 148 + 1920
    wire w_counterYmaxed = (r_counterY == 1125); // 4 + 5 + 36 + 1080
        
    always @(posedge i_clk_148M)
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
    
    always @(posedge i_clk_148M)
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
    
    always @(posedge i_clk_148M)
    begin
        r_hsync <= (r_counterX > (1920 + 88) && (r_counterX < (1920 + 88 + 44)));   // active for 44 clocks
        r_vsync <= (r_counterY > (1080 + 4) && (r_counterY < (1080 + 4 + 5)));   // active for 5 clocks
    end
    
    always @(posedge i_clk_148M)
    begin
        o_inDispArea <= (r_counterX < 1920) && (r_counterY < 1080);
    end
    
    assign o_counterX = r_counterX;
    assign o_counterY = r_counterY;
    assign o_hsync = ~r_hsync;
    assign o_vsync = ~r_vsync;
    
endmodule
