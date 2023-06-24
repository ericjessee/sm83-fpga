module cpu_top(
    input clk,
    input rst,

    input mem_oe,
    input mem_cs,
    
    inout[7:0] data_bus,
    inout[15:0] addr_bus
);

    //wire[7:0] data_bus;
    //wire[15:0] addr_bus;

    // assign data_bus = data_bus_ext;
    // assign addr_bus_ext = addr_bus;

    //bus control signals
    reg data_ready;
    reg addr_ready;

    //inter-module connections
    wire pc_oe_conn, pc_wr_conn, pc_ldh_conn, pc_ld16_conn;
    wire a_wr_conn, a_oe_conn, gen_oe_conn, gen_wr_conn, gen_lr_sel_conn;
    wire[2:0] gen_sel_conn;

    //arbitrary constants
    wire const0;
    wire const1;
    wire[2:0] const0_3bit;
    assign const0 = 0;
    assign const1 = 1;
    assign const0_3bit = 3'd0;
	 
    wire pc_inc_en, pc_inc_tap_en;
    wire[15:0] pc_inc_tap;

    control ctl(
        .clk(clk),
        .rst(rst),
        .addr_bus(addr_bus),
        .data_bus(data_bus),
        .pc_oe(pc_oe_conn),
        .pc_wr(pc_wr_conn),
        .pc_ldh(pc_ldh_conn),
        .pc_ld16(pc_ld16_conn),
        .pc_inc_en(pc_inc_en),
        .pc_inc_tap_en(pc_inc_tap_en),
        .a_wr(a_wr_conn),
        .a_oe(a_oe_conn),
        .gen_oe(gen_oe_conn),
        .gen_wr(gen_wr_conn),
        .gen_lr_sel(gen_lr_sel_conn),
        .gen_sel(gen_sel_conn),
        .mem_cs(mem_cs),
        .mem_oe(mem_oe)
    );

	regfile_top regfile(
        .data_out(data_bus), .addr_out(addr_bus), .addr_inc_out(pc_inc_tap),
        .clk(clk), .rst(rst), 
        .data_in(data_bus), .addr_in(addr_bus), 
        .pc_wr(pc_wr_conn), .pc_oe(pc_oe_conn), 
        .sp_wr(const0), .sp_oe(const0), 
        .a_wr(a_wr_conn), .a_oe(a_oe_conn), .f_oe(const0), .f_wr(const0), 
        .gen_16b_mode(const0), .gen_LR_sel(gen_lr_sel_conn), .gen_reg_sel(gen_sel_conn),.gen_wr(gen_wr_conn), .gen_oe(gen_oe_conn),
        .pc_ldh(const0), .pc_ld16(const1), .sp_ldh(const0), .sp_ld16(const0), .inc_pc(pc_inc_tap_en) 
    );

    incrementer inc_pc(
        .clk(clk),
        .en(pc_inc_en),
        .din(pc_inc_tap),
        .dout(addr_bus)
    );

endmodule