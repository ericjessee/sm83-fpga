module regfile_tb();
    reg clk;
    reg rst;

    reg[15:0] addr_bus;
    reg[7:0] data_bus;
	 
	 wire[7:0] dbus_tmp;

    reg[1:0] LR_sel;
    reg LR_data_sel;

    reg[1:0] pc_wrz;
    reg[1:0] sp_wrz;
    reg[1:0] LR_wrz;
    reg[1:0] LR_data_wrz;
    
    reg[1:0] a_wrz;
    reg[1:0] f_wrz;

    regfile test_regfile(
        .clk(clk),
        .rst(rst),
        // .LR(addr_bus),
        // .LR_data(data_bus),
        .LR_sel(LR_sel),
        .LR_data_sel(LR_data_sel),
        .pc_wrz(pc_wrz),
        .sp_wrz(sp_wrz),
        .LR_wrz(LR_wrz),
        .LR_data_wrz(LR_data_wrz),
        .a(dbus_tmp),
        .a_wrz(a_wrz),
        .f_wrz(f_wrz)
    );

	assign dbus_tmp = (a_wrz == 0) ? data_bus : 'hz;

    initial begin
        //initial conditions;
        data_bus= 'hz;
        addr_bus= 'hz;
        rst=1;
        LR_sel=0;
        LR_data_sel=0;
		a_wrz=2;
        pc_wrz=2;
        sp_wrz=2;
        LR_wrz=2;
        LR_data_wrz=2;
        a_wrz=2;
        f_wrz=2;
        clk=0;
        #10
        clk=1;
        #10
        clk=0;
        //store a byte into the a reg
        data_bus = 8'h3f;
        a_wrz = 0;
        #10
        clk=1;
        #10
        clk=0;
        data_bus= 'hz;
        //delay 1 cycle
        #10
        clk=1;
        #10
        clk=0;
        //read the byte from the a reg
        a_wrz = 1;
        #10
        clk=1;
        #10
		clk=0;
        end
    


endmodule