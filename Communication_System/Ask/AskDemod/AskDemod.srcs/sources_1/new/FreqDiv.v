`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 08:48:45 PM
// Design Name: 
// Module Name: FreqDiv
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


module FreqDiv(
    rst,clk4,clk_in,clk_I,clk_Q
    );
    input rst,clk4,clk_in;
    output clk_I,clk_Q;
    
    reg [3:0]count;
    reg clk_I_reg,clk_Q_reg;
    
    always@(posedge clk4 or posedge rst)begin
        if(rst)begin
            count <= 3'd0;
            clk_I_reg <= 1'd0;
            clk_Q_reg <= 1'd0;
        end
        else begin
            if(clk_in)
                count <= count + 1'd1;
            clk_I_reg <= ~count[2];
            clk_Q_reg <= count[2];
        end
    end
    
    assign clk_I = clk_I_reg;
    assign clk_Q = clk_Q_reg;
endmodule
