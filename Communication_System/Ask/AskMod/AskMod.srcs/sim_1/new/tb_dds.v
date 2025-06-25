`timescale 1ns / 1ps
 
module dds_tb();
reg clk;
reg clk1;
reg rst_n;
wire [1:0] din;
reg [4:0] count;
//reg config_tvalid;
//reg [15:0] config_data_poff,config_data_pinc;
//wire [7:0] dds_data_sin0,dds_data_cos0;

wire [13:0] dout;

initial begin
    clk = 0;
    clk1 = 0;
    rst_n = 0;
    #1000 rst_n = 1;

 
//    config_data_poff = 16'h6000;
//    config_data_pinc = 16'hd76;
//    config_tvalid = 1;
//    #10000;
//    config_data_pinc = 16'd1234;
//    #10000;
//    config_data_poff = 16'h3400;
//    #10000;
 
end
 
always#10 clk=~clk;
always#500 clk1=~clk1;
 
always@(posedge clk1)
    if(!rst_n)
        count <= 'b0;
    else
        count <= count + 1'b1;
        
assign din = {count[4],count[3]};
//assign din = count[3]&count[3];
//assign din = 2'b11;

AskMod dds_inst (
  .clk(clk),                              // input wire clk
  .rst_n(rst_n),
  .din(din),                          // input wire rst_n
  //.config_tvalid(config_tvalid),                   // input wire config_tvalid
  //.config_data_poff(config_data_poff),            // input wire [15 : 0] config_data_poff
  //.config_data_pinc(config_data_pinc),            // input wire [15 : 0] config_data_pinc
//  .dds_data_sin0(dds_data_sin0),                  // output wire [7 : 0] dds_data_sin0
  .dout(dout)                   // output wire [7 : 0] dds_data_cos0
);
 
endmodule