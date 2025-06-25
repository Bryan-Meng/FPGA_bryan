`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 08:48:45 PM
// Design Name: 
// Module Name: ClkTrans
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


module ClkTrans(
    rst,clk4,clk_d1,clk_d2
    );
    input rst,clk4;
    output clk_d1,clk_d2;
    
    reg [1:0] count;
    
    always@(posedge clk4 or posedge rst)begin
        if(rst)
            count <= 2'd0;
        else
            count <= count + 2'd1;
    end
    
    assign clk_d1 = (count == 2'd0)?1'd1:1'd0;
    assign clk_d2 = (count == 2'd2)?1'd1:1'd0;
endmodule
