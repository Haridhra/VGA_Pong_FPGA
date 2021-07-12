`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2021 12:54:07 PM
// Design Name: 
// Module Name: display
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


module display(
    input i_clk_100M,
    input i_reset,
    input i_reset_clk,
    input i_paddleRight,
    input i_paddleLeft,
    output o_vga_hsync,
    output o_vga_vsync,
    output reg o_vga_R,
    output reg o_vga_G,
    output reg o_vga_B,
    output o_led[4],
    output o_led0_r
    );
      
    wire w_clk_148M;
    wire w_clk_lock;
    
    clk_multiplier clk_mult_1920x1080(
        .i_clk_100M(i_clk_100M),
        .i_rst(i_reset_clk),
        .o_clk_148M(w_clk_148M),
        .o_clk_lock(w_clk_lock)
    );
    
    wire [11:0] w_counterX;
    wire [10:0] w_counterY;
    wire w_inDisplayArea;
    
    hvsync_generator_1920x1080 hvsync_gen(
        .i_clk_148M(w_clk_148M),
        .i_rst(i_reset),
        .o_counterX(w_counterX),
        .o_counterY(w_counterY),
        .o_hsync(o_vga_hsync),
        .o_vsync(o_vga_vsync),
        .o_inDispArea(w_inDisplayArea)
    );
    
    parameter c_borderLeft = 30, c_borderRight = 1889, c_borderTop = 30, c_borderBottom = 1049;
    parameter c_paddleHeight = 30, c_paddleWidth = 160, c_paddleStartY = c_borderBottom - c_paddleHeight, c_moveStep = 10;
    reg [10:0] r_paddleX = (c_borderRight - c_borderLeft)/2 - c_paddleWidth/2;
    reg [20:0] r_paddleCounter = 0;
    
    wire w_border = (w_counterX < c_borderLeft) || (w_counterX > c_borderRight) || (w_counterY < c_borderTop);
    wire w_lava = (w_counterY > c_borderBottom);
    wire w_paddle = (w_counterX >= r_paddleX && w_counterX < (r_paddleX + c_paddleWidth)) && (w_counterY >= c_paddleStartY && w_counterY <= (c_paddleStartY + c_paddleHeight));
    
    always @(posedge i_clk_100M)
    begin
        if(r_paddleCounter < 2000000)
            r_paddleCounter <= r_paddleCounter + 1;
        else
            r_paddleCounter <= 0;
        
        if(i_paddleRight && r_paddleCounter == 2000000)
        begin
            if(r_paddleX < c_borderRight - c_paddleWidth)
                r_paddleX <= r_paddleX + c_moveStep;
        end
             
     if(i_paddleLeft && r_paddleCounter == 2000000)
        begin
            if(r_paddleX > c_borderLeft)
                r_paddleX <= r_paddleX - c_moveStep;
        end
    end
    
    reg [11:0] r_ballX = 200;
    reg [10:0] r_ballY = 200;
    reg r_ball_inX, r_ball_inY;
    
    parameter ballWidth = 28, ballHeight = 28;
    
    always @(posedge w_clk_148M)
        if(r_ball_inX==0) r_ball_inX <= (w_counterX==r_ballX) & r_ball_inY; else r_ball_inX <= !(w_counterX==r_ballX+ballWidth);
    
    always @(posedge w_clk_148M)
        if(r_ball_inY==0) r_ball_inY <= (w_counterY==r_ballY); else r_ball_inY <= !(w_counterY==r_ballY+ballHeight);
    
    wire w_ball = r_ball_inX & r_ball_inY;
    
    reg r_updateBallPosition;
    
    always @(posedge w_clk_148M)
    begin
        //Update ball X and Y position only once every frame
        if(w_counterY == 1120 && w_counterX == 0)
        begin
            r_updateBallPosition <= 1'b1;
        end
        else
        begin    
            r_updateBallPosition <= 1'b0;
        end
    end
    
    reg r_collisionObject = w_border | w_paddle | w_lava;
    reg r_collisionLeft, r_collisionRight, r_collisionTop, r_collisionBottom;
    reg r_gameOver = 1'b0;
    reg [3:0] r_score = 0, r_scoreInc = 1'b0;
    reg [1:0] r_count = 0;
    wire w_resetCollisions = r_updateBallPosition;
    
    always @(posedge w_clk_148M)
    begin
        if(i_reset)
        begin
            r_gameOver <= 1'b0;
            r_scoreInc <= 0;
            r_count <= 0;
            r_score <= 0;
        end
        if(w_resetCollisions)
        begin
            r_collisionLeft <= 1'b0;
            r_collisionRight <= 1'b0;
            r_collisionTop <= 1'b0;
            r_collisionBottom <= 1'b0;
            if(r_scoreInc)
            begin
                if(r_count == 2)
                begin
                    r_score <= r_score + 1;
                    r_scoreInc <= 1'b0;
                end
                r_count <= r_count + 1;
            end
        end
        else
        begin
            if(r_collisionObject & (w_counterX == r_ballX) & (w_counterY == r_ballY + ballHeight/2))
                r_collisionLeft <= 1'b1;
            if(r_collisionObject & (w_counterX == r_ballX + ballWidth) & (w_counterY == r_ballY + ballHeight/2))
                r_collisionRight <= 1'b1;
            if(r_collisionObject & (w_counterX == r_ballX + ballWidth/2) & (w_counterY == r_ballY))
                r_collisionTop <= 1'b1;
            if(r_collisionObject & (w_counterX == r_ballX + ballWidth/2) & (w_counterY == r_ballY + ballHeight))
            begin
                r_collisionBottom <= 1'b1;
                if(w_lava)
                    r_gameOver <= 1'b1;
                else if(w_paddle)
                    r_scoreInc <= 1'b1;
                else
                    r_scoreInc <= 1'b0;
            end                      
        end
    end
    
    reg r_ballDirX = 1'b1, r_ballDirY = 1'b0;       
    
    always @(posedge w_clk_148M)
    begin  
        if(i_reset)
        begin
            r_ballX <= 100;
            r_ballY <= 100;
        end
        else
        begin    
            if(r_updateBallPosition & ~r_gameOver)
            begin
                if(~(r_collisionRight & r_collisionLeft))
                begin
                    if(r_collisionRight)
                        r_ballDirX <= 1'b0;
                    else if(r_collisionLeft)
                        r_ballDirX <= 1'b1;
                        
                    r_ballX <= r_ballX + (r_ballDirX ? ballWidth/4 : -ballWidth/4);
                end
                
                if(~(r_collisionTop & r_collisionBottom))
                begin
                    if(r_collisionBottom)
                        r_ballDirY <= 1'b0;
                    else if(r_collisionTop)
                        r_ballDirY <= 1'b1;
                        
                    r_ballY <= r_ballY + (r_ballDirY ? ballHeight/4 : -ballHeight/4);
                end
            end
        end
    end
    
//    always @(posedge w_clk_148M)
//    begin
        
//    end    
    
    always @(posedge w_clk_148M)
    begin
      if (w_inDisplayArea)
      begin
        o_vga_R <= w_border | w_lava;
        o_vga_G <= w_border | w_ball | w_paddle;
        o_vga_B <= w_border | w_ball;
      end
      else // if it's not to display, go dark
      begin
        o_vga_R <= 1'b0;
        o_vga_G <= 1'b0;
        o_vga_B <= 1'b0;
      end
    end
    
    assign o_led[0] = r_score[0];
    assign o_led[1] = r_score[1];
    assign o_led[2] = r_score[2];
    assign o_led[3] = r_score[3];
    
    assign o_led0_r = r_gameOver;
    
endmodule
