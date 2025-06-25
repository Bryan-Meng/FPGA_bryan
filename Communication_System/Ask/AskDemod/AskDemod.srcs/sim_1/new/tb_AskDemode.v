`timescale 1ns / 1ps

module tb_AskDemode();

    // 测试模块实例化
    reg rst;                    // 复位信号，初始高电平有效
    reg clk;
    reg clk4;                    // 时钟信号
    reg [7:0] din;              // 输入数据
    wire dout;           // 输出数据
    wire bit_sync;
    // 实例化被测模块
//    AskDemod uut (
//        .rst(rst),
//        .clk(clk),
//        .din(din),
//        .dout(dout)
//    );
    top uut (
        .rst(rst),
        .clk(clk),
        .clk4(clk4),
        .din(din),
        .dout(dout),
        .bit_sync(bit_sync)
    );
    
    // 时钟参数定义 - 16MHz (周期62.5ns)
//    parameter CLK_PERIOD = 125; // 单位：ns
//    parameter CLK_PERIOD_plus = 31.25; // 单位：ns
    parameter CLK_PERIOD = 62.5; // 单位：ns
    parameter CLK_PERIOD_plus = 15.625; // 单位：ns
    // 时钟生成
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end
    
    initial begin
        clk4 = 0;
        forever #(CLK_PERIOD_plus/2) clk4 = ~clk4;
    end
    
    // 复位控制 - 400ns后释放复位
    initial begin
        rst = 1; // 初始复位有效
        #400 rst = 0; // 400ns后释放复位
    end
    
    // 文件读取处理
    integer file_handle;        // 文件句柄
    reg [7:0] file_data [0:9999]; // 存储文件数据的数组
    integer data_count = 0;     // 数据计数器
    integer index = 0;          // 当前读取索引
    reg [7:0] char;             // 用于存储当前字符
    integer i;                  // 循环变量
    integer eof_flag;           // 文件结束标志
    
    initial begin
        // 初始化数组
        for (i = 0; i < 10000; i = i + 1) begin
            file_data[i] = 8'h00;
        end
        
        // 1. 打开文件
        file_handle = $fopen("/home/bryan/workspace/AXU3EG/vivado/AskDemod/ASK2.txt", "r");
        
        if (file_handle == 0) begin
            $display("错误：无法打开文件!");
            $finish;
        end
        
        eof_flag = 0;
        
        // 2. 读取文件内容到数组
        while (!eof_flag) begin
            file_data[data_count] = 8'h00;
            // 逐字符读取8个字符
            for (i = 0; i < 8; i = i + 1) begin
                char = $fgetc(file_handle);
                
                // 检查文件结束
                if ($feof(file_handle)) begin
                    eof_flag = 1;
                end 
                // 处理有效字符
                else if (char == "0" || char == "1") begin
                    file_data[data_count][7-i] = (char == "1") ? 1'b1 : 1'b0;
                    $display("第 %0d 行数据的第 %0d 位为 %s", data_count, i, char);
                end
                else if (char == 10 || char == 13) begin
                    i=i-1;
                end
            end
            
            // 仅当读取到有效数据时才增加计数
            if (i > 0 && !eof_flag) begin
                data_count = data_count + 1;
            end
        end
        
        // 3. 关闭文件
        $fclose(file_handle);
        $display("成功读取 %0d 行数据", data_count);
        
        // 4. 初始化输入
        din = 0;
        
        // 5. 启动数据输入进程
        fork
            begin
                // 等待复位释放
                wait(rst === 0);
                
                // 循环读取数据
                while (index < data_count) begin
                    @(posedge clk);
                    din = file_data[index];
                    index = index + 1;
                end
                
                // 文件结束后保持最后的值
                forever @(posedge clk) din = file_data[data_count-1];
            end
        join
    end  // 修复：添加此end以关闭initial块
    
    // 波形记录
    initial begin
        $dumpfile("askdemod_tb.vcd");
        $dumpvars(0, tb_AskDemode);
    end
    
    // 监控输出
    always @(posedge clk) begin
        if (rst) begin
            $display("Time=%t: 复位中...", $time);
        end else begin
            $display("Time=%t: din=%b, dout=%h", $time, din, dout);
        end
    end
    
    // 仿真结束控制
    initial begin
        #100000; // 仿真运行100us
        $display("仿真完成");
        $finish;
    end

endmodule