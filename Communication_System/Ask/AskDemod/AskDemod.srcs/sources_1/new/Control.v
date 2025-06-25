`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2025 07:52:13 PM
// Design Name: 
// Module Name: Control
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


module Control(
    rst,clk4,pd_bef,pd_aft,clk_d1,clk_d2,clk_in
    );
    input rst,clk4,pd_bef,pd_aft,clk_d1,clk_d2;
    output clk_in;
    
    wire un1_gate_open,gate_open,gate_close,clk_in;
    
    monostable u1(
    .rst(rst),
    .clk4(clk4),
    .din(pd_bef),
    .dout(un1_gate_open)
    );
    
    monostable u2(
    .rst(rst),
    .clk4(clk4),
    .din(pd_aft),
    .dout(gate_close)
    );
    
    assign gate_open = ~un1_gate_open;
    assign clk_in = (gate_open&clk_d1)|(gate_close&clk_d2);
endmodule
