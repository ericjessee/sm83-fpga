module test_control_tb();

    wire[7:0] data_bus;
    wire[15:0] addr_bus;

    //bus control signals
    reg data_ready;
    reg addr_ready;

    //arbitrary data to place on the buses
    reg[7:0] data_to_write;
    reg[15:0] addr_to_write;

    reg clk;
    reg rst;

    //inter-module connections
    wire pc_oe_conn, pc_wr_conn, pc_ldh_conn, pc_ld16_conn;
    wire a_wr_conn, a_oe_conn; 
    wire rom_oe;
    wire rom_cs;
    wire[7:0] rom_out;

    //need to make sure outputs are hiz when not driving the bus
    assign data_bus = data_ready ? data_to_write : 'hz;
    assign addr_bus = addr_ready ? addr_to_write : 'hz;

    //rom output is not tri state
    assign data_bus = rom_oe ? rom_out : 'hz;

    //arbitrary constants
    wire const0;
    wire const1;
    wire[2:0] const0_3bit;
    assign const0 = 0;
    assign const1 = 1;
    assign const0_3bit = 3'd0;

    mem rom(
        .clka(clk),
        .ena(const1),
        .addra(addr_bus),
        .douta(rom_out)
    ); 
	 
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
        .mem_cs(rom_cs),
        .mem_oe(rom_oe)
    );

	regfile_top regfile(
        .data_out(data_bus), .addr_out(addr_bus), .addr_inc_out(pc_inc_tap),
        .clk(clk), .rst(rst), 
        .data_in(data_bus), .addr_in(addr_bus), 
        .pc_wr(pc_wr_conn), .pc_oe(pc_oe_conn), 
        .sp_wr(const0), .sp_oe(const0), 
        .a_wr(a_wr_conn), .a_oe(a_oe_conn), .f_oe(const0), .f_wr(const0), 
        .gen_16b_mode(const0), .gen_LR_sel(const0), .gen_reg_sel(const0_3bit),.gen_wr(const0), .gen_oe(const0),
        .pc_ldh(const0), .pc_ld16(const1), .sp_ldh(const0), .sp_ld16(const0), .inc_pc(pc_inc_tap_en) 
    );

    incrementer inc_pc(
        .clk(clk),
        .en(pc_inc_en),
        .din(pc_inc_tap),
        .dout(addr_bus)
    );
    
    initial begin
        clk=0;
        rst=1;
        addr_ready=0;
        data_ready=0;
        #10
        clk=1;
        #10
        clk=0;
        rst=0;
        forever begin
            #10
            clk=~clk;
        end       
    end

endmodule