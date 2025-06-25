`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2025 08:40:07 PM
// Design Name: 
// Module Name: BitSync
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


module BitSync(
    rst,clk4,din,sync
    );
    input rst,clk4,din;
    output sync;
    
    wire clk_Q,pd_bef,pd_aft,clk_d1,clk_d2,clk_in;
    
    DifferPD u1(
    .rst(rst),
    .clk4(clk4),
    .din(din),
    .clk_I(sync),
    .clk_Q(clk_Q),
    .pd_bef(pd_bef),
    .pd_aft(pd_aft)
    );
    
    ClkTrans u2(
    .rst(rst),
    .clk4(clk4),
    .clk_d1(clk_d1),
    .clk_d2(clk_d2)
    );
    
    Control u3(
    .rst(rst),
    .clk4(clk4),
    .pd_bef(pd_bef),
    .pd_aft(pd_aft),
    .clk_d1(clk_d1),
    .clk_d2(clk_d2),
    .clk_in(clk_in)
    );

    FreqDiv u4(
    .rst(rst),
    .clk4(clk4),
    .clk_in(clk_in),
    .clk_I(sync),
    .clk_Q(clk_Q)
    );
endmodule
