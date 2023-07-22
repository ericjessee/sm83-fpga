/**
 * This is an autogenerated netlist code from CircuitVerse. Verilog Code can be
 * tested on https://www.edaplayground.com/ using Icarus Verilog 0.9.7. This is an
 * experimental module and some manual changes make need to be done in order for
 * this to work.
 *
 * If you have any ideas/suggestions or bug fixes, raise an issue
 * on https://github.com/CircuitVerse/CircuitVerse/issues/new/choose
 */

/*
  Element Usage Report
    Input - 52 times
    TriState - 6 times
    Output - 10 times
    DflipFlop - 1 times
    Multiplexer - 14 times
    Splitter - 18 times
    SubCircuit - 15 times
    Decoder - 1 times
    ConstantVal - 3 times
    Demultiplexer - 3 times
    OrGate - 2 times
    NotGate - 4 times
*/

/*
  Usage Instructions and Tips
    Labels - Ensure unique label names and avoid using verilog keywords
    Warnings - Connect all optional inputs to remove warnings
*/

// Sample Testbench Code - Uncomment to use

/*
module TestBench();

  reg clk, rst, pc_wr, pc_oe, sp_wr, sp_oe, a_wr, a_oe, f_oe, f_wr, gen_16b_mode, gen_LR_sel, gen_wr, gen_oe, pc_ldh, pc_ld16, sp_ldh, sp_ld16, inc_pc;
  reg [2:0] gen_reg_sel;
  reg [7:0] data_in;
  reg [15:0] addr_in;

  wire [7:0] data_out;
  wire [15:0] addr_out, addr_inc_out;

  regfile_top DUT0(data_out, addr_out, addr_inc_out, clk, rst, data_in, addr_in, pc_wr, pc_oe, sp_wr, sp_oe, a_wr, a_oe, f_oe, f_wr, gen_16b_mode, gen_LR_sel, gen_reg_sel, gen_wr, gen_oe, pc_ldh, pc_ld16, sp_ldh, sp_ld16, inc_pc);

  initial begin
    clk = 0;
    rst = 0;
    data_in = 0;
    addr_in = 0;
    pc_wr = 0;
    pc_oe = 0;
    sp_wr = 0;
    sp_oe = 0;
    a_wr = 0;
    a_oe = 0;
    f_oe = 0;
    f_wr = 0;
    gen_16b_mode = 0;
    gen_LR_sel = 0;
    gen_reg_sel = 0;
    gen_wr = 0;
    gen_oe = 0;
    pc_ldh = 0;
    pc_ld16 = 0;
    sp_ldh = 0;
    sp_ld16 = 0;
    inc_pc = 0;

    #15
    $display("data_out = %b", data_out);
    $display("addr_out = %b", addr_out);
    $display("addr_inc_out = %b", addr_inc_out);

    #10
    $display("data_out = %b", data_out);
    $display("addr_out = %b", addr_out);
    $display("addr_inc_out = %b", addr_inc_out);

    $finish;

  end
endmodule

*/

module register_8bit(dout, wr, rst, clk, din, oe);
  output [7:0] dout;
  input wr, rst, clk, oe;
  input [7:0] din;
  wire [7:0] TriState_0_out, DflipFlop_0_Q;
  assign TriState_0_out = (oe!=0) ? DflipFlop_0_Q : 8'b?;
  assign dout = TriState_0_out;
  DflipFlop #(8) DflipFlop_0(DflipFlop_0_Q, , clk, din, rst, , wr);
endmodule


module gen_regs(dout, clk, reg_sel, din, rst, reg_wr, reg_oe, cs);
  output [7:0] dout;
  input clk, rst, reg_wr, reg_oe, cs;
  input [2:0] reg_sel;
  input [7:0] din;
  wire Decoder_0_out_0, Decoder_0_out_1, Decoder_0_out_2, Decoder_0_out_3, Decoder_0_out_4, Decoder_0_out_5;
  wire [1:0] ctl_en_out, ctl_sel5_out, ctl_sel4_out, ctl_sel3_out, ctl_sel2_out, ctl_sel1_out, ctl_sel_out, Splitter_6_cmb, const_0;
  wire [7:0] register_8bit_5_out, TriState_1_out, TriState_0_out;
  Multiplexer2 #(2) ctl_en(ctl_en_out, const_0, Splitter_6_cmb, cs);
  Multiplexer2 #(2) ctl_sel5(ctl_sel5_out, const_0, ctl_en_out, Decoder_0_out_5);
  
  register_8bit register_8bit_5(register_8bit_5_out, ctl_sel5_out[0], rst, clk, TriState_0_out, ctl_sel5_out[1]);
  assign TriState_1_out = (cs!=0) ? register_8bit_5_out : 8'b?;
  assign dout = TriState_1_out;
  Multiplexer2 #(2) ctl_sel4(ctl_sel4_out, const_0, ctl_en_out, Decoder_0_out_4);
  
  register_8bit register_8bit_4(register_8bit_5_out, ctl_sel4_out[0], rst, clk, TriState_0_out, ctl_sel4_out[1]);
  Multiplexer2 #(2) ctl_sel3(ctl_sel3_out, const_0, ctl_en_out, Decoder_0_out_3);
  
  register_8bit register_8bit_3(register_8bit_5_out, ctl_sel3_out[0], rst, clk, TriState_0_out, ctl_sel3_out[1]);
  Multiplexer2 #(2) ctl_sel2(ctl_sel2_out, const_0, ctl_en_out, Decoder_0_out_2);
  
  register_8bit register_8bit_2(register_8bit_5_out, ctl_sel2_out[0], rst, clk, TriState_0_out, ctl_sel2_out[1]);
  Multiplexer2 #(2) ctl_sel1(ctl_sel1_out, const_0, ctl_en_out, Decoder_0_out_1);
  
  register_8bit register_8bit_1(register_8bit_5_out, ctl_sel1_out[0], rst, clk, TriState_0_out, ctl_sel1_out[1]);
  Multiplexer2 #(2) ctl_sel(ctl_sel_out, const_0, ctl_en_out, Decoder_0_out_0);
  
  register_8bit register_8bit_0(register_8bit_5_out, ctl_sel_out[0], rst, clk, TriState_0_out, ctl_sel_out[1]);
  assign TriState_0_out = (cs!=0) ? din : 8'b?;
  assign Splitter_6_cmb = {reg_oe,reg_wr};
  Decoder8 #(3) Decoder_0(Decoder_0_out_0, Decoder_0_out_1, Decoder_0_out_2, Decoder_0_out_3, Decoder_0_out_4, Decoder_0_out_5, , , reg_sel);
  assign const_0 = 2'b00;
endmodule



module gen_regs_16(out_16b, out_8b, in_16b, \16b_mode , in_8b, LR_sel, clk, rst, oe, cs, reg_sel, wr);
  output [7:0] out_8b;
  output [15:0] out_16b;
  input \16b_mode , LR_sel, clk, rst, oe, cs, wr;
  input [2:0] reg_sel;
  input [7:0] in_8b;
  input [15:0] in_16b;
  wire output_sel_out_0, output_sel_out_1, or_1_out, not_0_out, or_0_out, not_1_out;
  wire [2:0] Splitter_2_cmb, R_ctl_out, L_ctl_out, const_0;
  wire [7:0] \c-l_out , Multiplexer_2_out, TriState_0_out, \b-h_out , \16_8_sel_1_out , \16_8_sel_out ;
  wire [15:0] Splitter_0_cmb, TriState_1_out;
  assign Splitter_2_cmb = {cs,oe,wr};
  Multiplexer2 #(3) R_ctl(R_ctl_out, const_0, Splitter_2_cmb, or_1_out);
  
  gen_regs \c-l (\c-l_out , clk, reg_sel, \16_8_sel_1_out , rst, R_ctl_out[0], R_ctl_out[1], R_ctl_out[2]);
  Multiplexer2 #(8) Multiplexer_2(Multiplexer_2_out, \b-h_out , \c-l_out , LR_sel);
  assign TriState_0_out = (output_sel_out_1!=0) ? Multiplexer_2_out : 8'b?;
  assign out_8b = TriState_0_out;
  assign Splitter_0_cmb = {\c-l_out ,\b-h_out };
  assign TriState_1_out = (output_sel_out_0!=0) ? Splitter_0_cmb : 16'b?;
  assign out_16b = TriState_1_out;
  Multiplexer2 #(3) L_ctl(L_ctl_out, const_0, Splitter_2_cmb, or_0_out);
  
  gen_regs \b-h (\b-h_out , clk, reg_sel, \16_8_sel_out , rst, L_ctl_out[0], L_ctl_out[1], L_ctl_out[2]);
  Demultiplexer2 output_sel(output_sel_out_0, output_sel_out_1, oe, not_1_out);
  assign or_1_out = \16b_mode  | LR_sel;
  assign not_0_out = ~LR_sel;
  assign or_0_out = \16b_mode  | not_0_out;
  Multiplexer2 #(8) \16_8_sel_1 (\16_8_sel_1_out , in_8b, in_16b[15:8], \16b_mode );
  Multiplexer2 #(8) \16_8_sel (\16_8_sel_out , in_8b, in_16b[7:0], \16b_mode );
  assign not_1_out = ~\16b_mode ;
  
  assign const_0 = 3'b000;
endmodule


module register_16bit(addr_out, out_1, out_2, wr, oe, rst, clk, data_in, addr_in, loadh, load16);
  output [7:0] out_1, out_2;
  output [15:0] addr_out;
  input wr, oe, rst, clk, loadh, load16;
  input [7:0] data_in;
  input [15:0] addr_in;
  wire not_0_out, Demultiplexer_1_out_0, Demultiplexer_1_out_1;
  wire [1:0] Multiplexer_1_out, Splitter_5_cmb, Splitter_4_cmb;
  wire [7:0] low_byte_out, high_byte_out, Demultiplexer_0_out_0, Demultiplexer_0_out_1;
  wire [15:0] Splitter_0_cmb, Multiplexer_0_out, Splitter_2_cmb;
  Multiplexer2 #(2) Multiplexer_1(Multiplexer_1_out, Splitter_5_cmb, Splitter_4_cmb, load16);
  
  register_8bit low_byte(low_byte_out, Multiplexer_1_out[1], rst, clk, Multiplexer_0_out[7:0], oe);
  assign Splitter_0_cmb = {high_byte_out,low_byte_out};
  assign addr_out = Splitter_0_cmb;
  register_8bit high_byte(high_byte_out, Multiplexer_1_out[0], rst, clk, Multiplexer_0_out[15:8], oe);
  Multiplexer2 #(16) Multiplexer_0(Multiplexer_0_out, Splitter_2_cmb, addr_in, load16);
  
  assign out_2 = Multiplexer_0_out[15:8];
  assign out_1 = Multiplexer_0_out[7:0];
  assign not_0_out = ~loadh;
  Demultiplexer2 Demultiplexer_1(Demultiplexer_1_out_0, Demultiplexer_1_out_1, wr, not_0_out);
  assign Splitter_5_cmb = {Demultiplexer_1_out_1,Demultiplexer_1_out_0};
  Demultiplexer2 #(8) Demultiplexer_0(Demultiplexer_0_out_0, Demultiplexer_0_out_1, data_in, loadh);
  assign Splitter_2_cmb = {Demultiplexer_0_out_1,Demultiplexer_0_out_0};
  assign Splitter_4_cmb = {wr,wr};
endmodule





module regfile_top(data_out, addr_out, addr_inc_out, clk, rst, data_in, addr_in, pc_wr, pc_oe, sp_wr, sp_oe, a_wr, a_oe, f_oe, f_wr, gen_16b_mode, gen_LR_sel, gen_reg_sel, gen_wr, gen_oe, pc_ldh, pc_ld16, sp_ldh, sp_ld16, inc_pc);
  output [7:0] data_out;
  output [15:0] addr_out, addr_inc_out;
  input clk, rst, pc_wr, pc_oe, sp_wr, sp_oe, a_wr, a_oe, f_oe, f_wr, gen_16b_mode, gen_LR_sel, gen_wr, gen_oe, pc_ldh, pc_ld16, sp_ldh, sp_ld16, inc_pc;
  input [2:0] gen_reg_sel;
  input [7:0] data_in;
  input [15:0] addr_in;
  wire not_0_out, const_0;
  wire [7:0] sp_out_1, sp_out_2, pc_out_1, pc_out_2, gen_regs_16_0_out_1;
  wire [15:0] TriState_0_out, sp_out_0, pc_out_0;
  assign not_0_out = ~inc_pc;
  assign TriState_0_out = (not_0_out!=0) ? pc_out_0 : 16'b?;
  assign addr_out = TriState_0_out;
  register_16bit sp(sp_out_0, sp_out_1, sp_out_2, sp_wr, sp_oe, rst, clk, data_in, addr_in, sp_ldh, sp_ld16);
  register_16bit pc(pc_out_0, pc_out_1, pc_out_2, pc_wr, pc_oe, rst, clk, data_in, addr_in, pc_ldh, pc_ld16);
  assign addr_inc_out = pc_out_0;
  gen_regs_16 gen_regs_16_0(TriState_0_out, gen_regs_16_0_out_1, addr_in, gen_16b_mode, data_in, gen_LR_sel, clk, rst, gen_oe, const_0, gen_reg_sel, gen_wr);
  assign data_out = gen_regs_16_0_out_1;
  register_8bit f_reg(gen_regs_16_0_out_1, f_wr, rst, clk, data_in, f_oe);
  register_8bit a_reg(gen_regs_16_0_out_1, a_wr, rst, clk, data_in, a_oe);
  assign const_0 = 1'b1;
endmodule

module DflipFlop(q, q_inv, clk, d, a_rst, pre, en);
    parameter WIDTH = 1;
    output reg [WIDTH-1:0] q, q_inv;
    input clk, a_rst, pre, en;
    input [WIDTH-1:0] d;

    always @ (posedge clk or posedge a_rst)
    if (a_rst) begin
        q <= 'b0;
        q_inv <= 'b1;
    end else if (en == 0) ;
    else begin
        q <= d;
        q_inv <= ~d;
    end
endmodule
    
module Multiplexer2(out, in0, in1, sel);
  parameter WIDTH = 1;
  output reg [WIDTH-1:0] out;
  input [WIDTH-1:0] in0, in1;
  input [0:0] sel;
  
  always @ (*)
    case (sel)
      0 : out = in0;
      1 : out = in1;
    endcase
endmodule


module Decoder8(out0, out1, out2, out3, out4, out5, out6, out7, sel);
  output reg out0, out1, out2, out3, out4, out5, out6, out7;
  input [2:0] sel;
  
  always @ (*) begin
    out0 = 0;
    out1 = 0;
    out2 = 0;
    out3 = 0;
    out4 = 0;
    out5 = 0;
    out6 = 0;
    out7 = 0;
    case (sel)
      0 : out0 = 1;
      1 : out1 = 1;
      2 : out2 = 1;
      3 : out3 = 1;
      4 : out4 = 1;
      5 : out5 = 1;
      6 : out6 = 1;
      7 : out7 = 1;
    endcase
  end
endmodule

module Demultiplexer2(out0, out1, in, sel);
  parameter WIDTH = 1;
  output reg [WIDTH-1:0] out0, out1;
  input [WIDTH-1:0] in;
  input [0:0] sel;
  
  always @ (*) begin
    out0 = 0;
    out1 = 0;
    case (sel)
      0 : out0 = in;
      1 : out1 = in;
    endcase
  end
endmodule
