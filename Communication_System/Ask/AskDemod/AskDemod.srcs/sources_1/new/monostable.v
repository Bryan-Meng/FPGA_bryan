`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2025 08:06:04 PM
// Design Name: 
// Module Name: monostable
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


module monostable(
    rst,clk4,din,dout
    );
    input rst,clk4,din;
    output dout;
    
    reg reg_dout,start;
    reg [1:0]count;
    
    always@(posedge clk4 or posedge rst)begin
        if(rst)begin
            count <= 2'd0;
            reg_dout <= 1'd0;
            start <= 1'd0;
        end
        else begin
            if(din==1'd1)begin
                start <= 1'd1;
                reg_dout <= 1'd1;
            end
            if(start == 1'd1)begin
                reg_dout <= 1'd1;
                if(count < 2'd3)
                    count <= count + 1'd1;
                else
                    start <= 1'd0;
            end
            else begin
                count <= 2'd0;
                reg_dout <= 1'd0;
            end
        end     
    end
    assign dout = reg_dout;
endmodule
