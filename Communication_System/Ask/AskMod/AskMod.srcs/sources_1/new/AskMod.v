`timescale 1ns / 1ps
 
module AskMod(
    input clk,rst_n,
    input [1:0] din,
    output [13:0] dout
);
 
wire m_axis_data_tvalid;
wire m_axis_phase_tvalid;
wire [15:0] m_axis_phase_tdata;
wire [13:0] cosine;
reg [13:0] dout_reg;
 
dds_compiler_0 dds_inst(
    .aclk(clk),
//    .aresetn(~rst_n),
    //.s_axis_config_tvalid(config_tvalid),//s_axis_config_tvalid:相当于一个配置通道的使能信号，高电平有效
    //.s_axis_config_tdata({16'd0,config_data_pinc}),//s_axis_config_tdata:高16位用于储存相位信息（偏移的相位=2p*此值除以2^相位累加器位宽），后16位为频率控制字
    .m_axis_data_tvalid(m_axis_data_tvalid),//m_axis_data_tvalid:输出有效信号吧TVALID for output DATA channel
    .m_axis_data_tdata(cosine),//m_axis_data_tdata：输出信号，高位是正弦，低位是余弦
    .m_axis_phase_tvalid(m_axis_phase_tvalid),//m_axis_phase_tvalid:输出有效标志TVALID for output PHASE channel
    .m_axis_phase_tdata(m_axis_phase_tdata)//m_axis_phase_tdata:输出相位通道
);
 
 // 有符号数计算辅助变量
wire [13:0] sum01;  // 用于 din="01" 的计算
wire [13:0] sum10;  // 用于 din="10" 的计算

//// 符号扩展和移位操作
//wire [13:0] sign_ext_01_1 = {{2{cosine[13]}}, cosine[13:2]};  // 右移2位并符号扩展
//wire [13:0] sign_ext_01_2 = cosine[13:4];  // 右移4位并符号扩展
//wire [13:0] sign_ext_01_3 = cosine[13:6];  // 右移6位并符号扩展

//wire [13:0] sign_ext_10_1 = {{1{cosine[13]}}, cosine};        // 原始值
//wire [13:0] sign_ext_10_2 = cosine[13:3];  // 右移3位并符号扩展
//wire [13:0] sign_ext_10_3 = cosine[13:5];  // 右移5位并符号扩展

// 计算中间结果
assign sum01 = {{2{cosine[13]}}, cosine[13:2]} + {{4{cosine[13]}}, cosine[13:4]} + {{6{cosine[13]}}, cosine[13:6]};
assign sum10 = {{1{cosine[13]}}, cosine[13:1]} + {{3{cosine[13]}}, cosine[13:3]} + {{5{cosine[13]}}, cosine[13:5]};
 
 always@(*)begin
    case (din)
        2'b00: dout_reg = 14'b0;             // 零输出
        2'b01: dout_reg = sum01[13:0];       // 约 0.3281 幅度
        2'b10: dout_reg = sum10[13:0];       // 约 0.6563 幅度
        2'b11: dout_reg = cosine;            // 全幅度
        default: dout_reg = 14'b0; 
    endcase
end
 
assign dout = dout_reg;
endmodule


//`timescale 1ns / 1ps
 
//module AskMod(
//    input clk,
//    input rst_n,
//    //input config_tvalid,
//    //input [15:0] config_data_poff,config_data_pinc,
//    output [7:0] dds_data_sin0,dds_data_cos0
//);
 
//wire m_axis_data_tvalid;
//wire m_axis_phase_tvalid;
//wire [15:0] m_axis_phase_tdata;
 
//dds_compiler_0 dds_inst(
//    .aclk(clk),
//    //.aresetn(rst_n),
//    //.s_axis_config_tvalid(config_tvalid),//s_axis_config_tvalid:相当于一个配置通道的使能信号，高电平有效
//    //.s_axis_config_tdata({16'd0,config_data_pinc}),//s_axis_config_tdata:高16位用于储存相位信息（偏移的相位=2p*此值除以2^相位累加器位宽），后16位为频率控制字
//    .m_axis_data_tvalid(m_axis_data_tvalid),//m_axis_data_tvalid:输出有效信号吧TVALID for output DATA channel
//    .m_axis_data_tdata({dds_data_sin0,dds_data_cos0}),//m_axis_data_tdata：输出信号，高位是正弦，低位是余弦
//    .m_axis_phase_tvalid(m_axis_phase_tvalid),//m_axis_phase_tvalid:输出有效标志TVALID for output PHASE channel
//    .m_axis_phase_tdata(m_axis_phase_tdata)//m_axis_phase_tdata:输出相位通道
//);
 
 
 
 
 
 
 
 
//endmodule