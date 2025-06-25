# 启用比特流压缩
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# 系统时钟引脚约束
set_property PACKAGE_PIN AE5 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports sys_clk_p]

# 修改为 8MHz 时钟约束 (周期 125ns)
create_clock -period 125.000 -name sys_clk_p -waveform {0.000 62.500} [get_ports sys_clk_p]

# 复位引脚约束
set_property PACKAGE_PIN AF12 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

# 输出时钟引脚约束
set_property PACKAGE_PIN AG11 [get_ports clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports clk_out]