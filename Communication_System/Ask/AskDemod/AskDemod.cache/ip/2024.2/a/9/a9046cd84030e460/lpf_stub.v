// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Tue Jun 10 20:08:17 2025
// Host        : bryan-OMEN-by-HP-Gaming-Laptop-16-k0xxx running 64-bit Ubuntu 22.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ lpf_stub.v
// Design      : lpf
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu3eg-sfvc784-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "lpf,fir_compiler_v7_2_23,{}" *) (* core_generation_info = "lpf,fir_compiler_v7_2_23,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fir_compiler,x_ipVersion=7.2,x_ipCoreRevision=23,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XDEVICEFAMILY=zynquplus,C_ELABORATION_DIR=./,C_COMPONENT_NAME=lpf,C_COEF_FILE=lpf.mif,C_COEF_FILE_LINES=17,C_FILTER_TYPE=0,C_INTERP_RATE=1,C_DECIM_RATE=1,C_ZERO_PACKING_FACTOR=1,C_SYMMETRY=1,C_NUM_FILTS=1,C_NUM_TAPS=33,C_NUM_CHANNELS=1,C_CHANNEL_PATTERN=fixed,C_ROUND_MODE=0,C_COEF_RELOAD=0,C_NUM_RELOAD_SLOTS=1,C_COL_MODE=1,C_COL_PIPE_LEN=4,C_COL_CONFIG=17,C_OPTIMIZATION=0,C_DATA_PATH_WIDTHS=8,C_DATA_IP_PATH_WIDTHS=8,C_DATA_PX_PATH_WIDTHS=8,C_DATA_WIDTH=8,C_COEF_PATH_WIDTHS=12,C_COEF_WIDTH=12,C_DATA_PATH_SRC=0,C_COEF_PATH_SRC=0,C_PX_PATH_SRC=0,C_DATA_PATH_SIGN=0,C_COEF_PATH_SIGN=0,C_ACCUM_PATH_WIDTHS=22,C_OUTPUT_WIDTH=22,C_OUTPUT_PATH_WIDTHS=22,C_ACCUM_OP_PATH_WIDTHS=22,C_EXT_MULT_CNFG=none,C_DATA_PATH_PSAMP_SRC=0,C_OP_PATH_PSAMP_SRC=0,C_NUM_MADDS=17,C_OPT_MADDS=none,C_OVERSAMPLING_RATE=1,C_INPUT_RATE=1,C_OUTPUT_RATE=1,C_DATA_MEMTYPE=0,C_COEF_MEMTYPE=2,C_IPBUFF_MEMTYPE=0,C_OPBUFF_MEMTYPE=0,C_DATAPATH_MEMTYPE=0,C_MEM_ARRANGEMENT=1,C_DATA_MEM_PACKING=0,C_COEF_MEM_PACKING=0,C_FILTS_PACKED=0,C_LATENCY=23,C_HAS_ARESETn=0,C_HAS_ACLKEN=0,C_DATA_HAS_TLAST=0,C_S_DATA_HAS_FIFO=1,C_S_DATA_HAS_TUSER=0,C_S_DATA_TDATA_WIDTH=8,C_S_DATA_TUSER_WIDTH=1,C_M_DATA_HAS_TREADY=0,C_M_DATA_HAS_TUSER=0,C_M_DATA_TDATA_WIDTH=24,C_M_DATA_TUSER_WIDTH=1,C_HAS_CONFIG_CHANNEL=0,C_CONFIG_SYNC_MODE=0,C_CONFIG_PACKET_SIZE=0,C_CONFIG_TDATA_WIDTH=1,C_RELOAD_TDATA_WIDTH=1}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "fir_compiler_v7_2_23,Vivado 2024.2" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(aclk, s_axis_data_tvalid, s_axis_data_tready, 
  s_axis_data_tdata, m_axis_data_tvalid, m_axis_data_tdata)
/* synthesis syn_black_box black_box_pad_pin="s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tdata[7:0],m_axis_data_tvalid,m_axis_data_tdata[23:0]" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_mode = "slave aclk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_DATA:S_AXIS_RELOAD, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_DATA TVALID" *) (* x_interface_mode = "slave S_AXIS_DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_DATA, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_DATA TREADY" *) output s_axis_data_tready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_DATA TDATA" *) input [7:0]s_axis_data_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_mode = "master M_AXIS_DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [23:0]m_axis_data_tdata;
endmodule
