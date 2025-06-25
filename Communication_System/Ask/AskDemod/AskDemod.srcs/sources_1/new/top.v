`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 09:49:57 PM
// Design Name: 
// Module Name: top
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


module top(
    rst,clk,clk4,din,dout,bit_sync
    );
    input rst,clk,clk4;
    input [7:0] din;
    output dout,bit_sync;
    wire signed [13:0] data;
    wire signed [21:0] mean;
    wire judge,sync;
    reg sync_d,dout_reg,bit_sync_reg;
    AskDemod c1(
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(data)
    );
    
    Gate c2(
    .rst(rst),
    .clk(clk),
    .din(data),
    .mean(mean)
    );
    assign judge = (data<mean)?1'b0:1'b1;
    BitSync c3(
    .clk4(clk4),
    .rst(rst),
    .din(judge),
    .sync(sync)
    );
    
    always@(posedge clk4 or posedge rst)begin
        if(rst)begin
            sync_d <= 1'd0;
            dout_reg <= 1'd0;
        end
        else begin
            sync_d <= sync;
            if(sync_d==1'd1 & sync==1'd0)begin
                dout_reg <= judge;
                bit_sync_reg <= 1'd1;
            end
            else
                bit_sync_reg <= 1'd0;
        end
    end
    assign bit_sync = bit_sync_reg;
    assign dout = dout_reg;
endmodule
