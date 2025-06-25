`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/10/2025 07:26:45 PM
// Design Name: 
// Module Name: AskDemod
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


module AskDemod(
    clk,rst,din,dout
    );
    input    rst;              //复位信号，高电平有效
	input		clk;   				//FPGA系统时钟:8MHz
	input	 signed [7:0]	din;  //基带输入数据
	output signed [13:0]	dout; //ASK输出数据
	
	reg signed [7:0] abs_din;
	always @(posedge clk or posedge rst)
		if (rst)
			abs_din <= 8'd0;
		else
			if (din[7])
				abs_din <= -din;
			else
			   abs_din <= din;
			   
	wire ast_sink_valid,ast_source_valid,ast_sink_ready;
	wire signed [21:0]  Yout;
	assign ast_sink_valid=1'b1;
	lpf	u0(
		.aclk(clk),
		.s_axis_data_tdata(abs_din),
		.s_axis_data_tvalid(ast_sink_valid),
		.m_axis_data_tdata(Yout),
		.s_axis_data_tready(ast_sink_ready),
		.m_axis_data_tvalid(ast_source_valid));	
	//根据滤波器系数，可知滤波后输出数据最大位宽为输入数据位宽+14位，因此，最高数据位为
	//Yout(21)Yout(21 downto 8)做为输出数据。
	assign dout = Yout[21:8];
endmodule
