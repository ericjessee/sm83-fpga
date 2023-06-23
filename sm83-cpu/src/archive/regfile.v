module regfile (

    input clk,
    input rst,

    inout[15:0] pc,
    input pc_wr,
    input pc_oe,
    inout[15:0] sp,
    input sp_wr,
    input sp_oe,

    inout[7:0] a,
    input a_wr,
    input a_oe,
    inout[7:0] f,
    input f_wr,
    input f_oe,

    //intermediate 8 and 16 bit general purpose register access
    inout[15:0] LR,
    inout[7:0]  LR_data,
    input[1:0]  LR_sel,
    input LR_data_sel,
    input L_wr,
    input L_oe,
    input R_wr,
    input R_oe

);

register #(16) pc(pc, pc_wr, rst, clk, pc_oe);
register #(16) sp(sp, sp_wr, rst, clk, sp_oe);

register #(8) a(a, a_wr, rst, clk, a_oe);
register #(8) f(f, f_wr, rst, clk, f_oe);

wire[15:0] LR_wire;
wire L_wr_wire;
wire L_oe_wire;
wire R_wr_wire;
wire R_oe_wire;

reg b_wr;
reg b_oe;
reg c_wr;
reg c_oe;
reg d_wr;
reg d_oe;
reg e_wr;
reg e_oe;
reg h_wr;
reg h_oe;
reg l_wr;
reg l_oe;

register #(8) b(LR_wire[15:8], b_wr, rst, clk, b_oe);
register #(8) c(LR_wire[7:0], c_wr, rst, clk, c_oe);
register #(8) d(LR_wire[15:8], d_wr, rst, clk, d_oe);
register #(8) e(LR_wire[7:0], e_wr, rst, clk, e_oe);
register #(8) h(LR_wire[15:8], h_wr, rst, clk, h_oe);
register #(8) l(LR_wire[7:0], l_wr, rst, clk, l_oe);



endmodule
