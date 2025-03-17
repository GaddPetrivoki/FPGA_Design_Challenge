// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Sat Mar 15 12:48:11 2025
// Host        : CRAIWS15 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/bootcamp07/project_3/project_3.sim/sim_1/synth/timing/xsim/led_test_tb_time_synth.v
// Design      : led_test
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module led_test
   (clk,
    an,
    seg);
  input clk;
  output [3:0]an;
  output [6:0]seg;

  wire [3:0]an;
  wire [3:0]an_OBUF;
  wire \an_reg[0]_i_1_n_0 ;
  wire \an_reg[1]_i_1_n_0 ;
  wire \an_reg[2]_i_1_n_0 ;
  wire \an_reg[3]_i_1_n_0 ;
  wire [1:0]anode_control;
  wire \anode_control[1]_i_1_n_0 ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire p_0_in;
  wire [31:0]p_1_in;
  wire refresh_clk_i_1_n_0;
  wire refresh_clk_i_2_n_0;
  wire refresh_clk_reg_n_0;
  wire [31:0]refresh_count;
  wire \refresh_count[31]_i_3_n_0 ;
  wire \refresh_count[31]_i_4_n_0 ;
  wire \refresh_count[31]_i_5_n_0 ;
  wire \refresh_count[31]_i_6_n_0 ;
  wire \refresh_count[31]_i_7_n_0 ;
  wire \refresh_count[31]_i_8_n_0 ;
  wire \refresh_count[31]_i_9_n_0 ;
  wire \refresh_count_reg[12]_i_1_n_0 ;
  wire \refresh_count_reg[12]_i_1_n_1 ;
  wire \refresh_count_reg[12]_i_1_n_2 ;
  wire \refresh_count_reg[12]_i_1_n_3 ;
  wire \refresh_count_reg[16]_i_1_n_0 ;
  wire \refresh_count_reg[16]_i_1_n_1 ;
  wire \refresh_count_reg[16]_i_1_n_2 ;
  wire \refresh_count_reg[16]_i_1_n_3 ;
  wire \refresh_count_reg[20]_i_1_n_0 ;
  wire \refresh_count_reg[20]_i_1_n_1 ;
  wire \refresh_count_reg[20]_i_1_n_2 ;
  wire \refresh_count_reg[20]_i_1_n_3 ;
  wire \refresh_count_reg[24]_i_1_n_0 ;
  wire \refresh_count_reg[24]_i_1_n_1 ;
  wire \refresh_count_reg[24]_i_1_n_2 ;
  wire \refresh_count_reg[24]_i_1_n_3 ;
  wire \refresh_count_reg[28]_i_1_n_0 ;
  wire \refresh_count_reg[28]_i_1_n_1 ;
  wire \refresh_count_reg[28]_i_1_n_2 ;
  wire \refresh_count_reg[28]_i_1_n_3 ;
  wire \refresh_count_reg[31]_i_2_n_2 ;
  wire \refresh_count_reg[31]_i_2_n_3 ;
  wire \refresh_count_reg[4]_i_1_n_0 ;
  wire \refresh_count_reg[4]_i_1_n_1 ;
  wire \refresh_count_reg[4]_i_1_n_2 ;
  wire \refresh_count_reg[4]_i_1_n_3 ;
  wire \refresh_count_reg[8]_i_1_n_0 ;
  wire \refresh_count_reg[8]_i_1_n_1 ;
  wire \refresh_count_reg[8]_i_1_n_2 ;
  wire \refresh_count_reg[8]_i_1_n_3 ;
  wire [6:0]seg;
  wire [6:0]seg_OBUF;
  wire [6:5]seg_output;
  wire \seg_reg[3]_i_1_n_0 ;
  wire [3:2]\NLW_refresh_count_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_refresh_count_reg[31]_i_2_O_UNCONNECTED ;

initial begin
 $sdf_annotate("led_test_tb_time_synth.sdf",,,,"tool_control");
end
  OBUF \an_OBUF[0]_inst 
       (.I(an_OBUF[0]),
        .O(an[0]));
  OBUF \an_OBUF[1]_inst 
       (.I(an_OBUF[1]),
        .O(an[1]));
  OBUF \an_OBUF[2]_inst 
       (.I(an_OBUF[2]),
        .O(an[2]));
  OBUF \an_OBUF[3]_inst 
       (.I(an_OBUF[3]),
        .O(an[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \an_reg[0]_i_1 
       (.I0(anode_control[1]),
        .I1(anode_control[0]),
        .O(\an_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_reg[1]_i_1 
       (.I0(anode_control[0]),
        .I1(anode_control[1]),
        .O(\an_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \an_reg[2]_i_1 
       (.I0(anode_control[1]),
        .I1(anode_control[0]),
        .O(\an_reg[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \an_reg[3]_i_1 
       (.I0(anode_control[1]),
        .I1(anode_control[0]),
        .O(\an_reg[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\an_reg[0]_i_1_n_0 ),
        .Q(an_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\an_reg[1]_i_1_n_0 ),
        .Q(an_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\an_reg[2]_i_1_n_0 ),
        .Q(an_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \an_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\an_reg[3]_i_1_n_0 ),
        .Q(an_OBUF[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \anode_control[0]_i_1 
       (.I0(anode_control[0]),
        .O(seg_output[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \anode_control[1]_i_1 
       (.I0(anode_control[1]),
        .I1(anode_control[0]),
        .O(\anode_control[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \anode_control_reg[0] 
       (.C(refresh_clk_reg_n_0),
        .CE(1'b1),
        .D(seg_output[6]),
        .Q(anode_control[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \anode_control_reg[1] 
       (.C(refresh_clk_reg_n_0),
        .CE(1'b1),
        .D(\anode_control[1]_i_1_n_0 ),
        .Q(anode_control[1]),
        .R(1'b0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT5 #(
    .INIT(32'hFEFF0100)) 
    refresh_clk_i_1
       (.I0(\refresh_count[31]_i_6_n_0 ),
        .I1(refresh_clk_i_2_n_0),
        .I2(\refresh_count[31]_i_4_n_0 ),
        .I3(\refresh_count[31]_i_3_n_0 ),
        .I4(refresh_clk_reg_n_0),
        .O(refresh_clk_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEEFE)) 
    refresh_clk_i_2
       (.I0(refresh_count[26]),
        .I1(refresh_count[14]),
        .I2(refresh_count[12]),
        .I3(refresh_count[13]),
        .I4(refresh_count[24]),
        .I5(refresh_count[25]),
        .O(refresh_clk_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    refresh_clk_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(refresh_clk_i_1_n_0),
        .Q(refresh_clk_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \refresh_count[0]_i_1 
       (.I0(refresh_count[0]),
        .O(p_1_in[0]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \refresh_count[31]_i_1 
       (.I0(\refresh_count[31]_i_3_n_0 ),
        .I1(\refresh_count[31]_i_4_n_0 ),
        .I2(refresh_count[12]),
        .I3(refresh_count[24]),
        .I4(\refresh_count[31]_i_5_n_0 ),
        .I5(\refresh_count[31]_i_6_n_0 ),
        .O(p_0_in));
  LUT6 #(
    .INIT(64'h0000000000008000)) 
    \refresh_count[31]_i_3 
       (.I0(refresh_count[7]),
        .I1(refresh_count[10]),
        .I2(refresh_count[5]),
        .I3(refresh_count[9]),
        .I4(\refresh_count[31]_i_7_n_0 ),
        .I5(\refresh_count[31]_i_8_n_0 ),
        .O(\refresh_count[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \refresh_count[31]_i_4 
       (.I0(refresh_count[18]),
        .I1(refresh_count[20]),
        .I2(refresh_count[19]),
        .I3(refresh_count[22]),
        .I4(refresh_count[23]),
        .I5(refresh_count[21]),
        .O(\refresh_count[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \refresh_count[31]_i_5 
       (.I0(refresh_count[25]),
        .I1(refresh_count[26]),
        .O(\refresh_count[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \refresh_count[31]_i_6 
       (.I0(refresh_count[30]),
        .I1(refresh_count[27]),
        .I2(refresh_count[13]),
        .I3(refresh_count[29]),
        .I4(\refresh_count[31]_i_9_n_0 ),
        .O(\refresh_count[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \refresh_count[31]_i_7 
       (.I0(refresh_count[8]),
        .I1(refresh_count[1]),
        .I2(refresh_count[2]),
        .I3(refresh_count[6]),
        .O(\refresh_count[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \refresh_count[31]_i_8 
       (.I0(refresh_count[0]),
        .I1(refresh_count[4]),
        .I2(refresh_count[3]),
        .I3(refresh_count[11]),
        .O(\refresh_count[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFDFFFFFFFF)) 
    \refresh_count[31]_i_9 
       (.I0(refresh_count[15]),
        .I1(refresh_count[17]),
        .I2(refresh_count[28]),
        .I3(refresh_count[14]),
        .I4(refresh_count[31]),
        .I5(refresh_count[16]),
        .O(\refresh_count[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[0]),
        .Q(refresh_count[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[10]),
        .Q(refresh_count[10]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[11]),
        .Q(refresh_count[11]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[12]),
        .Q(refresh_count[12]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[12]_i_1 
       (.CI(\refresh_count_reg[8]_i_1_n_0 ),
        .CO({\refresh_count_reg[12]_i_1_n_0 ,\refresh_count_reg[12]_i_1_n_1 ,\refresh_count_reg[12]_i_1_n_2 ,\refresh_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[12:9]),
        .S(refresh_count[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[13]),
        .Q(refresh_count[13]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[14]),
        .Q(refresh_count[14]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[15]),
        .Q(refresh_count[15]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[16]),
        .Q(refresh_count[16]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[16]_i_1 
       (.CI(\refresh_count_reg[12]_i_1_n_0 ),
        .CO({\refresh_count_reg[16]_i_1_n_0 ,\refresh_count_reg[16]_i_1_n_1 ,\refresh_count_reg[16]_i_1_n_2 ,\refresh_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[16:13]),
        .S(refresh_count[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[17]),
        .Q(refresh_count[17]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[18]),
        .Q(refresh_count[18]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[19]),
        .Q(refresh_count[19]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[1]),
        .Q(refresh_count[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[20]),
        .Q(refresh_count[20]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[20]_i_1 
       (.CI(\refresh_count_reg[16]_i_1_n_0 ),
        .CO({\refresh_count_reg[20]_i_1_n_0 ,\refresh_count_reg[20]_i_1_n_1 ,\refresh_count_reg[20]_i_1_n_2 ,\refresh_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[20:17]),
        .S(refresh_count[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[21]),
        .Q(refresh_count[21]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[22]),
        .Q(refresh_count[22]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[23]),
        .Q(refresh_count[23]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[24]),
        .Q(refresh_count[24]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[24]_i_1 
       (.CI(\refresh_count_reg[20]_i_1_n_0 ),
        .CO({\refresh_count_reg[24]_i_1_n_0 ,\refresh_count_reg[24]_i_1_n_1 ,\refresh_count_reg[24]_i_1_n_2 ,\refresh_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[24:21]),
        .S(refresh_count[24:21]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[25]),
        .Q(refresh_count[25]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[26]),
        .Q(refresh_count[26]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[27]),
        .Q(refresh_count[27]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[28]),
        .Q(refresh_count[28]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[28]_i_1 
       (.CI(\refresh_count_reg[24]_i_1_n_0 ),
        .CO({\refresh_count_reg[28]_i_1_n_0 ,\refresh_count_reg[28]_i_1_n_1 ,\refresh_count_reg[28]_i_1_n_2 ,\refresh_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[28:25]),
        .S(refresh_count[28:25]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[29]),
        .Q(refresh_count[29]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(refresh_count[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[30]),
        .Q(refresh_count[30]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[31]),
        .Q(refresh_count[31]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[31]_i_2 
       (.CI(\refresh_count_reg[28]_i_1_n_0 ),
        .CO({\NLW_refresh_count_reg[31]_i_2_CO_UNCONNECTED [3:2],\refresh_count_reg[31]_i_2_n_2 ,\refresh_count_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_refresh_count_reg[31]_i_2_O_UNCONNECTED [3],p_1_in[31:29]}),
        .S({1'b0,refresh_count[31:29]}));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(refresh_count[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[4]),
        .Q(refresh_count[4]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\refresh_count_reg[4]_i_1_n_0 ,\refresh_count_reg[4]_i_1_n_1 ,\refresh_count_reg[4]_i_1_n_2 ,\refresh_count_reg[4]_i_1_n_3 }),
        .CYINIT(refresh_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[4:1]),
        .S(refresh_count[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[5]),
        .Q(refresh_count[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(refresh_count[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(refresh_count[7]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[8]),
        .Q(refresh_count[8]),
        .R(p_0_in));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \refresh_count_reg[8]_i_1 
       (.CI(\refresh_count_reg[4]_i_1_n_0 ),
        .CO({\refresh_count_reg[8]_i_1_n_0 ,\refresh_count_reg[8]_i_1_n_1 ,\refresh_count_reg[8]_i_1_n_2 ,\refresh_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_1_in[8:5]),
        .S(refresh_count[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \refresh_count_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(p_1_in[9]),
        .Q(refresh_count[9]),
        .R(p_0_in));
  OBUF \seg_OBUF[0]_inst 
       (.I(seg_OBUF[0]),
        .O(seg[0]));
  OBUF \seg_OBUF[1]_inst 
       (.I(1'b0),
        .O(seg[1]));
  OBUF \seg_OBUF[2]_inst 
       (.I(1'b0),
        .O(seg[2]));
  OBUF \seg_OBUF[3]_inst 
       (.I(seg_OBUF[3]),
        .O(seg[3]));
  OBUF \seg_OBUF[4]_inst 
       (.I(seg_OBUF[4]),
        .O(seg[4]));
  OBUF \seg_OBUF[5]_inst 
       (.I(seg_OBUF[4]),
        .O(seg[5]));
  OBUF \seg_OBUF[6]_inst 
       (.I(seg_OBUF[6]),
        .O(seg[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \seg_reg[3]_i_1 
       (.I0(anode_control[0]),
        .I1(anode_control[1]),
        .O(\seg_reg[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \seg_reg[5]_i_1 
       (.I0(anode_control[1]),
        .I1(anode_control[0]),
        .O(seg_output[5]));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\anode_control[1]_i_1_n_0 ),
        .Q(seg_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\seg_reg[3]_i_1_n_0 ),
        .Q(seg_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(seg_output[5]),
        .Q(seg_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(seg_output[6]),
        .Q(seg_OBUF[6]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
