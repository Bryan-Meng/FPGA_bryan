`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 08:48:45 PM
// Design Name: 
// Module Name: DifferPD
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


module DifferPD(
    rst,clk4,din,clk_I,clk_Q,pd_bef,pd_aft
    );
    input rst,clk4,din,clk_I,clk_Q;
    output pd_bef,pd_aft;
    
//    reg din_d;
//    wire din_edge;
    
//    always@(posedge clk4 or posedge rst)begin
//        if(rst)
//            din_d <= 1'd0;
//        else 
//            din_d <= din;
//    end
    
//    assign din_edge = din_d ^ din;
    
//    assign pd_bef = din_edge & clk_I;
//    assign pd_aft = din_edge & clk_Q;

    reg din_d,din_edge;
    reg pdbef,pdaft;
    always@(posedge clk4 or posedge rst)begin
        if(rst)begin
            din_d <= 1'b0;
            din_edge <= 1'b0;
            pdbef <= 1'b0;
            pdaft <= 1'b0;
        end
        else begin
            din_d <= din;
            din_edge <= din_d ^ din;
            pdbef <= (din_edge & clk_I);
            pdaft <= (din_edge & clk_Q);
        end
    end
    assign pd_bef = pdbef;
    assign pd_aft = pdaft;
endmodule
