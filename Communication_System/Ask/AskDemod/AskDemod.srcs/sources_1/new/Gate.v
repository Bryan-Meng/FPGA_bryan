`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 09:19:15 PM
// Design Name: 
// Module Name: Gate
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


module Gate(
    rst,clk,din,mean
    );
    input rst,clk;
    input signed [13:0] din;
    output signed [21:0] mean;
    
    reg [13:0] ShiftReg [255:0];
    integer i,j;
    always@(posedge clk or posedge rst)begin
        if(rst)begin
            for (i=0;i<=255;i=i+1)
                ShiftReg[i] <= 14'd0;
        end
        else begin
            for (j=0;j<=254;j=j+1)
                ShiftReg[j+1] <= ShiftReg[j];
            ShiftReg[0] <= din;
        end
    end
    
    reg signed [21:0] sum;
    always@(posedge clk or posedge rst)begin
        if(rst)
            sum <= 22'd0;
        else
            sum <= sum+{{8{din[13]}},din}-{{8{ShiftReg[255][13]}},ShiftReg[255]};
    end
    assign mean = sum[21:8];
endmodule
